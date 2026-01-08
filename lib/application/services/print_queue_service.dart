import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:logger/logger.dart';

import '../../domain/domain.dart';
import '../dtos/send_print_job_request_dto.dart';
import 'app_log_service.dart';
import 'print_job_service.dart';
import 'printer_service.dart';

const _defaultRetryDelay = Duration(seconds: 10);
const _maxRetries = 5;
const _processInterval = Duration(milliseconds: 500);

final _blockedStatuses = {'offline', 'error', 'paused'};

class PrintQueueService implements IPrintQueueService {
  final PrinterService _printerService;
  final PrintJobService _printJobService;
  final AppLogService? _logService;
  final Logger _logger;

  final Queue<PrintQueueItem> _queue = Queue();
  final List<PrintQueueItem> _completed = [];
  final _itemUpdatedController = StreamController<PrintQueueItem>.broadcast();
  final _itemCompletedController = StreamController<PrintQueueItem>.broadcast();

  Timer? _processTimer;
  bool _isProcessing = false;
  bool _isRunning = false;
  PrintQueueItem? _currentItem;

  PrintQueueService({
    required PrinterService printerService,
    required PrintJobService printJobService,
    AppLogService? logService,
    Logger? logger,
  })  : _printerService = printerService,
        _printJobService = printJobService,
        _logService = logService,
        _logger = logger ?? Logger();

  @override
  List<PrintQueueItem> get queue => _queue.toList();

  @override
  List<PrintQueueItem> get pendingItems =>
      _queue.where((item) => !item.isCompleted).toList();

  @override
  List<PrintQueueItem> get completedItems => List.unmodifiable(_completed);

  @override
  PrintQueueItem? get currentItem => _currentItem;

  @override
  bool get isProcessing => _isProcessing;

  @override
  Stream<PrintQueueItem> get onItemUpdated => _itemUpdatedController.stream;

  @override
  Stream<PrintQueueItem> get onItemCompleted => _itemCompletedController.stream;

  @override
  JobId enqueue({
    required String printerId,
    required String printerName,
    required String documentName,
    required Uint8List payload,
    int totalPages = 0,
    String datatype = 'RAW',
  }) {
    final jobId = JobId.generate();
    final item = PrintQueueItem(
      id: jobId,
      printerId: printerId,
      printerName: printerName,
      documentName: documentName,
      payload: payload,
      totalPages: totalPages,
      datatype: datatype,
      createdAt: DateTime.now(),
    );

    _queue.add(item);
    _logger.i('Job enfileirado: ${jobId.value} - $documentName');
    _itemUpdatedController.add(item);

    _logService?.logInfo(
      category: AppLogCategory.print,
      title: 'Job Enfileirado',
      message: 'Documento "$documentName" adicionado à fila de impressão',
      details: jsonEncode({
        'jobId': jobId.value,
        'printerId': printerId,
        'printerName': printerName,
        'totalPages': totalPages,
      }),
      printerId: printerId,
      jobId: jobId.value,
    );

    return jobId;
  }

  @override
  void cancel(JobId jobId) {
    final index = _queue.toList().indexWhere((item) => item.id == jobId);
    if (index < 0) return;

    final items = _queue.toList();
    final item = items[index];

    if (item.isSending) {
      _logger.w('Não é possível cancelar job em envio: ${jobId.value}');
      return;
    }

    final cancelled = item.copyWith(
      status: PrintQueueItemStatus.cancelled,
      completedAt: DateTime.now(),
    );

    _queue.clear();
    for (var i = 0; i < items.length; i++) {
      if (i == index) {
        _completed.add(cancelled);
      } else {
        _queue.add(items[i]);
      }
    }

    _logger.i('Job cancelado: ${jobId.value}');
    _itemUpdatedController.add(cancelled);
    _itemCompletedController.add(cancelled);
  }

  @override
  void cancelAll() {
    final now = DateTime.now();
    for (final item in _queue) {
      if (!item.isSending) {
        final cancelled = item.copyWith(
          status: PrintQueueItemStatus.cancelled,
          completedAt: now,
        );
        _completed.add(cancelled);
        _itemUpdatedController.add(cancelled);
        _itemCompletedController.add(cancelled);
      }
    }

    _queue.removeWhere((item) => !item.isSending);
    _logger.i('Todos os jobs cancelados (exceto em envio)');
  }

  @override
  void retry(JobId jobId) {
    final index = _completed.indexWhere((item) => item.id == jobId);
    if (index < 0) return;

    final item = _completed[index];
    if (item.status != PrintQueueItemStatus.failed) return;

    final retried = item.copyWith(
      status: PrintQueueItemStatus.pending,
      completedAt: null,
      errorCode: null,
      errorMessage: null,
      retryCount: item.retryCount + 1,
    );

    _completed.removeAt(index);
    _queue.add(retried);

    _logger.i('Job reenfileirado: ${jobId.value}');
    _itemUpdatedController.add(retried);
  }

  @override
  void start() {
    if (_isRunning) return;

    _isRunning = true;
    _processTimer = Timer.periodic(_processInterval, (_) => _processNext());
    _logger.i('Fila de impressão iniciada');
  }

  @override
  void stop() {
    _isRunning = false;
    _processTimer?.cancel();
    _processTimer = null;
    _logger.i('Fila de impressão parada');
  }

  @override
  void clearCompleted() {
    _completed.clear();
    _logger.d('Histórico de jobs limpo');
  }

  @override
  void dispose() {
    stop();
    _itemUpdatedController.close();
    _itemCompletedController.close();
    _queue.clear();
    _completed.clear();
  }

  Future<void> _processNext() async {
    if (!_isRunning || _isProcessing || _queue.isEmpty) return;

    _isProcessing = true;

    try {
      final item = _queue.first;

      if (item.status == PrintQueueItemStatus.waitingPrinter) {
        final waitingSince = item.startedAt ?? item.createdAt;
        if (DateTime.now().difference(waitingSince) < _defaultRetryDelay) {
          return;
        }
      }

      _currentItem = item;
      _logger.d('Processando job: ${item.id.value}');

      final printerStatus = await _checkPrinterStatus(item.printerId);

      if (printerStatus == null) {
        _handlePrinterNotFound(item);
        return;
      }

      if (_blockedStatuses.contains(printerStatus)) {
        _handlePrinterBlocked(item, printerStatus);
        return;
      }

      await _sendJob(item);
    } finally {
      _isProcessing = false;
      _currentItem = null;
    }
  }

  Future<String?> _checkPrinterStatus(String printerId) async {
    final result = await _printerService.getPrinterById(printerId);

    if (result.isError()) {
      _logger.w('Erro ao buscar impressora: $printerId');
      return null;
    }

    final printer = result.getOrThrow();
    return printer.status;
  }

  void _handlePrinterNotFound(PrintQueueItem item) {
    _logger.e('Impressora não encontrada: ${item.printerId}');

    final failed = item.copyWith(
      status: PrintQueueItemStatus.failed,
      completedAt: DateTime.now(),
      errorCode: 'E_PRINTER_NOT_FOUND',
      errorMessage: 'Impressora não encontrada: ${item.printerName}',
    );

    _queue.removeFirst();
    _completed.add(failed);

    _itemUpdatedController.add(failed);
    _itemCompletedController.add(failed);

    _logService?.logError(
      category: AppLogCategory.print,
      title: 'Impressora Não Encontrada',
      message: 'Falha ao processar job: impressora "${item.printerName}" não encontrada',
      details: jsonEncode({
        'jobId': item.id.value,
        'printerId': item.printerId,
        'documentName': item.documentName,
      }),
      printerId: item.printerId,
      jobId: item.id.value,
    );
  }

  void _handlePrinterBlocked(PrintQueueItem item, String printerStatus) {
    _logger.w(
      'Impressora ${item.printerName} com status bloqueado: $printerStatus',
    );

    if (item.retryCount >= _maxRetries) {
      _logger.e('Job ${item.id.value} atingiu máximo de retries');

      final failed = item.copyWith(
        status: PrintQueueItemStatus.failed,
        completedAt: DateTime.now(),
        errorCode: 'E_MAX_RETRIES',
        errorMessage:
            'Impressora indisponível após $_maxRetries tentativas ($printerStatus)',
        lastPrinterStatus: printerStatus,
      );

      _queue.removeFirst();
      _completed.add(failed);

      _itemUpdatedController.add(failed);
      _itemCompletedController.add(failed);

      _logService?.logError(
        category: AppLogCategory.print,
        title: 'Job Travado - Máximo de Tentativas',
        message:
            'Job "${item.documentName}" falhou após $_maxRetries tentativas. Impressora: ${item.printerName} ($printerStatus)',
        details: jsonEncode({
          'jobId': item.id.value,
          'printerId': item.printerId,
          'printerName': item.printerName,
          'documentName': item.documentName,
          'printerStatus': printerStatus,
          'retryCount': item.retryCount,
        }),
        printerId: item.printerId,
        jobId: item.id.value,
      );

      return;
    }

    final waiting = item.copyWith(
      status: PrintQueueItemStatus.waitingPrinter,
      startedAt: item.startedAt ?? DateTime.now(),
      retryCount: item.retryCount + 1,
      lastPrinterStatus: printerStatus,
    );

    _updateQueueItem(waiting);
    _itemUpdatedController.add(waiting);

    _logger.i(
      'Job ${item.id.value} aguardando impressora (tentativa ${waiting.retryCount}/$_maxRetries)',
    );
  }

  Future<void> _sendJob(PrintQueueItem item) async {
    _logger.i('Enviando job: ${item.id.value} -> ${item.printerName}');

    final sending = item.copyWith(
      status: PrintQueueItemStatus.sending,
      startedAt: item.startedAt ?? DateTime.now(),
    );
    _updateQueueItem(sending);
    _itemUpdatedController.add(sending);

    final request = SendPrintJobRequestDTO(
      printerId: item.printerId,
      documentName: item.documentName,
      payload: item.payload,
      totalPages: item.totalPages,
      datatype: item.datatype,
    );

    final result = await _printJobService.sendPrintJob(request);

    if (result.isError()) {
      final error = result.exceptionOrNull();
      _logger.e('Falha ao enviar job: ${item.id.value}', error: error);

      final failed = item.copyWith(
        status: PrintQueueItemStatus.failed,
        completedAt: DateTime.now(),
        errorCode: 'E_SEND_FAILED',
        errorMessage: error?.toString() ?? 'Falha ao enviar job',
      );

      _queue.removeFirst();
      _completed.add(failed);

      _itemUpdatedController.add(failed);
      _itemCompletedController.add(failed);

      _logService?.logError(
        category: AppLogCategory.print,
        title: 'Falha ao Enviar Job',
        message:
            'Erro ao enviar "${item.documentName}" para impressora "${item.printerName}"',
        details: jsonEncode({
          'jobId': item.id.value,
          'printerId': item.printerId,
          'printerName': item.printerName,
          'documentName': item.documentName,
          'error': error?.toString(),
        }),
        printerId: item.printerId,
        jobId: item.id.value,
      );

      return;
    }

    _logger.i('Job enviado com sucesso: ${item.id.value}');

    final sent = item.copyWith(
      status: PrintQueueItemStatus.sent,
      completedAt: DateTime.now(),
    );

    _queue.removeFirst();
    _completed.add(sent);

    _itemUpdatedController.add(sent);
    _itemCompletedController.add(sent);

    _logService?.logInfo(
      category: AppLogCategory.print,
      title: 'Job Enviado com Sucesso',
      message:
          'Documento "${item.documentName}" enviado para impressora "${item.printerName}"',
      details: jsonEncode({
        'jobId': item.id.value,
        'printerId': item.printerId,
        'printerName': item.printerName,
        'totalPages': item.totalPages,
      }),
      printerId: item.printerId,
      jobId: item.id.value,
    );
  }

  void _updateQueueItem(PrintQueueItem updated) {
    final items = _queue.toList();
    final index = items.indexWhere((i) => i.id == updated.id);
    if (index < 0) return;

    _queue.clear();
    for (var i = 0; i < items.length; i++) {
      _queue.add(i == index ? updated : items[i]);
    }
  }
}
