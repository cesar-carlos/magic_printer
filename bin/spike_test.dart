import 'dart:io';

import 'package:logger/logger.dart';
import 'package:magic_printer/infrastructure/datasources/windows/windows.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 80,
    colors: false,
    printEmojis: false,
  ),
);

void main(List<String> args) async {
  stdout.writeln('╔════════════════════════════════════════════════════════╗');
  stdout.writeln('║         SPIKE - Viabilidade .spl/.shd (2a)             ║');
  stdout.writeln('╚════════════════════════════════════════════════════════╝');

  final runner = SpikeRunner(logger: logger);

  if (args.isEmpty) {
    printUsage();
    return;
  }

  final command = args[0];

  switch (command) {
    case 'list':
      final printers = SpoolerDataSource().enumeratePrinters();
      stdout.writeln('=== Impressoras Disponíveis (${printers.length}) ===');
      for (final printer in printers) {
        stdout.writeln('- ${printer.name}');
        if (printer.driverName != null) {
          stdout.writeln('  driver: ${printer.driverName}');
        }
        if (printer.portName != null) {
          stdout.writeln('  port: ${printer.portName}');
        }
        if (printer.shareName != null) {
          stdout.writeln('  share: ${printer.shareName}');
        }
      }
      return;

    case 'jobs':
      if (args.length < 2) {
        stderr.writeln('Uso: spike_test jobs <nome_impressora>');
        return;
      }
      final printerName = args[1];
      final dataSource = SpoolerDataSource();
      final hPrinter = dataSource.openPrinter(printerName);
      if (hPrinter == null) {
        stderr.writeln('Falha ao abrir impressora: $printerName');
        return;
      }
      try {
        final jobs = dataSource.enumerateJobs(hPrinter);
        stdout.writeln('=== Jobs na Fila: $printerName (${jobs.length}) ===');
        for (final job in jobs) {
          stdout.writeln(
            '- Job ${job.jobId}: ${job.documentName ?? '(sem nome)'} (${job.size} bytes)',
          );
        }
      } finally {
        dataSource.closePrinter(hPrinter);
      }
      return;

    case 'capture':
      if (args.length < 2) {
        logger.e('Uso: spike_test capture <nome_impressora> [job_id]');
        return;
      }
      final printerName = args[1];
      final jobId = args.length > 2 ? int.tryParse(args[2]) : null;

      final result = await runner.runCaptureTest(
        sourcePrinterName: printerName,
        specificJobId: jobId,
      );

      logger.i(result.toString());
      return;

    case 'full':
      if (args.length < 3) {
        logger.e(
          'Uso: spike_test full <impressora_origem> <impressora_destino> [job_id]',
        );
        return;
      }
      final sourcePrinter = args[1];
      final targetPrinter = args[2];
      final jobId = args.length > 3 ? int.tryParse(args[3]) : null;

      final result = await runner.runFullSpike(
        sourcePrinterName: sourcePrinter,
        targetPrinterName: targetPrinter,
        specificJobId: jobId,
      );

      logger.i(result.toString());

      if (result.success) {
        logger.i('✅ SPIKE APROVADO - Fluxo completo funcionou!');
      } else {
        logger.e('❌ SPIKE FALHOU - ${result.errorMessage}');
      }
      return;

    case 'spool-dir':
      final dir = getSpoolerDirectory();
      stdout.writeln('Diretório do Spooler: $dir');

      final directory = Directory(dir);
      try {
        if (await directory.exists()) {
          final files = await directory.list().toList();
          stdout.writeln('Arquivos encontrados: ${files.length}');
          for (final file in files) {
            stdout.writeln('  - ${file.path.split('\\').last}');
          }
        } else {
          stdout.writeln('Diretório não existe ou sem permissão');
        }
      } on FileSystemException catch (e) {
        stderr.writeln('Sem permissão para acessar o spooler: ${e.message}');
        stderr.writeln('Dica: execute o terminal como Administrador.');
      }
      return;

    default:
      printUsage();
      return;
  }
}

void printUsage() {
  stdout.writeln('''
Uso: dart run bin/spike_test.dart <comando> [opções]

Comandos:
  list                          Lista todas as impressoras
  jobs <impressora>             Lista jobs na fila da impressora
  capture <impressora> [job_id] Captura job e comprime (E1 + E2)
  full <origem> <destino> [job] Executa spike completo (E1 + E2 + E3)
  spool-dir                     Mostra diretório do spooler

Exemplos:
  dart run bin/spike_test.dart list
  dart run bin/spike_test.dart jobs "HP LaserJet"
  dart run bin/spike_test.dart capture "HP LaserJet"
  dart run bin/spike_test.dart full "HP LaserJet Virtual" "HP LaserJet Real"

Nota: Execute como administrador para acessar arquivos do spooler.
''');
}
