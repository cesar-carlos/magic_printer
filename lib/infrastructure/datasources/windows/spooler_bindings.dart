import 'dart:ffi';
import 'dart:io';

import 'spooler_constants.dart';

class SpoolerBindings {
  static final _winspool = DynamicLibrary.open('winspool.drv');

  static final enumPrinters =
      _winspool.lookupFunction<EnumPrintersNative, EnumPrintersDart>(
    'EnumPrintersW',
  );

  static final openPrinter =
      _winspool.lookupFunction<OpenPrinterNative, OpenPrinterDart>(
    'OpenPrinterW',
  );

  static final closePrinter =
      _winspool.lookupFunction<ClosePrinterNative, ClosePrinterDart>(
    'ClosePrinter',
  );

  static final enumJobs =
      _winspool.lookupFunction<EnumJobsNative, EnumJobsDart>(
    'EnumJobsW',
  );

  static final setJob = _winspool.lookupFunction<SetJobNative, SetJobDart>(
    'SetJobW',
  );

  static final addJob = _winspool.lookupFunction<AddJobNative, AddJobDart>(
    'AddJobW',
  );

  static final scheduleJob =
      _winspool.lookupFunction<ScheduleJobNative, ScheduleJobDart>(
    'ScheduleJob',
  );

  static final startDocPrinter =
      _winspool.lookupFunction<StartDocPrinterNative, StartDocPrinterDart>(
    'StartDocPrinterW',
  );

  static final endDocPrinter =
      _winspool.lookupFunction<EndDocPrinterNative, EndDocPrinterDart>(
    'EndDocPrinter',
  );

  static final writePrinter =
      _winspool.lookupFunction<WritePrinterNative, WritePrinterDart>(
    'WritePrinter',
  );

  static final getPrinterDriverDirectory = _winspool.lookupFunction<
      GetPrinterDriverDirectoryNative, GetPrinterDriverDirectoryDart>(
    'GetPrinterDriverDirectoryW',
  );
}

String getSpoolerDirectory() {
  final windowsDir = Platform.environment['WINDIR'] ?? 'C:\\Windows';
  return '$windowsDir\\System32\\spool\\PRINTERS';
}
