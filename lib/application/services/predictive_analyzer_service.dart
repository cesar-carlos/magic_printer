import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/domain.dart';

class PredictiveAnalyzerService implements IPredictiveAnalyzerService {
  final IPredictionRepository _predictionRepository;
  final IPrinterRepository _printerRepository;
  final IJobRepository _jobRepository;

  Timer? _analysisTimer;
  bool _isEnabled = false;
  final _predictionStreamControllers = <String, StreamController<Prediction>>{};
  final _uuid = const Uuid();

  PredictiveAnalyzerService({
    required IPredictionRepository predictionRepository,
    required IPrinterRepository printerRepository,
    required IJobRepository jobRepository,
  }) : _predictionRepository = predictionRepository,
       _printerRepository = printerRepository,
       _jobRepository = jobRepository;

  @override
  bool get isEnabled => _isEnabled;

  @override
  void setEnabled(bool enabled) {
    if (_isEnabled == enabled) return;

    _isEnabled = enabled;

    if (enabled) {
      _startAnalysis();
    } else {
      _stopAnalysis();
    }
  }

  void _startAnalysis() {
    if (_analysisTimer != null && _analysisTimer!.isActive) {
      return;
    }

    _analysisTimer = Timer.periodic(
      defaultPredictionCheckInterval,
      (_) => _analyzeAllPrinters(),
    );

    _analyzeAllPrinters();
  }

  void _stopAnalysis() {
    _analysisTimer?.cancel();
    _analysisTimer = null;
  }

  Future<void> _analyzeAllPrinters() async {
    final printersResult = await _printerRepository.getAll();
    if (printersResult.isError()) return;

    final printers = printersResult.getOrThrow();
    for (final printer in printers) {
      await analyze(printer.id);
    }
  }

  @override
  Future<Result<List<Prediction>>> analyze(String printerId) async {
    try {
      final predictions = <Prediction>[];

      final tonerPrediction = await _predictTonerDepletion(printerId);
      if (tonerPrediction != null) {
        predictions.add(tonerPrediction);
        await _predictionRepository.addPrediction(tonerPrediction);
        _notifyPrediction(printerId, tonerPrediction);
      }

      final paperPrediction = await _predictPaperDepletion(printerId);
      if (paperPrediction != null) {
        predictions.add(paperPrediction);
        await _predictionRepository.addPrediction(paperPrediction);
        _notifyPrediction(printerId, paperPrediction);
      }

      return Success(predictions);
    } catch (e) {
      return Failure(
        StorageException(
          'E_PREDICTION_FAILED',
          'Failed to analyze printer $printerId: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<List<Pattern>>> detectPatterns(String printerId) async {
    return await _predictionRepository.detectPatterns(printerId);
  }

  @override
  Stream<Prediction> watchPredictions(String printerId) {
    if (!_predictionStreamControllers.containsKey(printerId)) {
      _predictionStreamControllers[printerId] =
          StreamController<Prediction>.broadcast();
    }
    return _predictionStreamControllers[printerId]!.stream;
  }

  Future<Prediction?> _predictTonerDepletion(String printerId) async {
    try {
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) return null;

      final printer = printerResult.getOrThrow();
      if (printer.tonerLevel == null) return null;

      final currentLevel = int.tryParse(printer.tonerLevel!) ?? 100;
      if (currentLevel > 30) return null;

      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) return null;

      final allJobs = jobsResult.getOrThrow();
      final printerJobs = allJobs
          .where(
            (j) =>
                j.printerName == printer.name &&
                j.createdAt.isAfter(
                  DateTime.now().subtract(const Duration(days: 30)),
                ),
          )
          .toList();

      if (printerJobs.isEmpty) return null;

      final avgPagesPerDay = printerJobs.length / 30.0;
      final daysUntilDepletion = currentLevel / (avgPagesPerDay * 0.1);

      return Prediction(
        id: _uuid.v4(),
        printerId: printerId,
        type: PredictionType.tonerDepletion,
        predictedDate: DateTime.now().add(
          Duration(days: daysUntilDepletion.round()),
        ),
        confidence: 0.7,
        factors: {
          'currentLevel': currentLevel,
          'avgPagesPerDay': avgPagesPerDay,
        },
        createdAt: DateTime.now(),
      );
    } catch (e) {
      return null;
    }
  }

  Future<Prediction?> _predictPaperDepletion(String printerId) async {
    try {
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) return null;

      final printer = printerResult.getOrThrow();
      if (printer.paperLevel == null) return null;

      final currentLevel = int.tryParse(printer.paperLevel!) ?? 100;
      if (currentLevel > 20) return null;

      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) return null;

      final allJobs = jobsResult.getOrThrow();
      final printerJobs = allJobs
          .where(
            (j) =>
                j.printerName == printer.name &&
                j.createdAt.isAfter(
                  DateTime.now().subtract(const Duration(days: 7)),
                ),
          )
          .toList();

      if (printerJobs.isEmpty) return null;

      final avgPagesPerDay = printerJobs.length / 7.0;
      final daysUntilDepletion = currentLevel / (avgPagesPerDay * 0.2);

      return Prediction(
        id: _uuid.v4(),
        printerId: printerId,
        type: PredictionType.paperDepletion,
        predictedDate: DateTime.now().add(
          Duration(days: daysUntilDepletion.round()),
        ),
        confidence: 0.6,
        factors: {
          'currentLevel': currentLevel,
          'avgPagesPerDay': avgPagesPerDay,
        },
        createdAt: DateTime.now(),
      );
    } catch (e) {
      return null;
    }
  }

  void _notifyPrediction(String printerId, Prediction prediction) {
    final controller = _predictionStreamControllers[printerId];
    if (controller != null && !controller.isClosed) {
      controller.add(prediction);
    }
  }

  void dispose() {
    _stopAnalysis();
    for (final controller in _predictionStreamControllers.values) {
      controller.close();
    }
    _predictionStreamControllers.clear();
  }
}
