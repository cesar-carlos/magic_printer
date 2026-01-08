import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'printer_info.dart';
import 'spooler_bindings.dart';
import 'spooler_constants.dart';

class SpoolerDataSource {
  List<PrinterInfoData> enumeratePrinters() {
    final printers = <PrinterInfoData>[];

    final pcbNeeded = calloc<Uint32>();
    final pcReturned = calloc<Uint32>();

    try {
      SpoolerBindings.enumPrinters(
        printerEnumLocal | printerEnumConnections,
        nullptr,
        2,
        nullptr,
        0,
        pcbNeeded,
        pcReturned,
      );

      if (pcbNeeded.value == 0) {
        return printers;
      }

      final pPrinterEnum = calloc<Uint8>(pcbNeeded.value);
      try {
        final result = SpoolerBindings.enumPrinters(
          printerEnumLocal | printerEnumConnections,
          nullptr,
          2,
          pPrinterEnum,
          pcbNeeded.value,
          pcbNeeded,
          pcReturned,
        );

        if (result == 0) {
          return printers;
        }

        final count = pcReturned.value;
        final printerInfoPtr = pPrinterEnum.cast<PrinterInfo2>();

        for (var i = 0; i < count; i++) {
          final info = printerInfoPtr[i];
          printers.add(PrinterInfoData(
            name: info.pPrinterName.toDartString(),
            serverName: _nullableString(info.pServerName),
            shareName: _nullableString(info.pShareName),
            portName: _nullableString(info.pPortName),
            driverName: _nullableString(info.pDriverName),
            comment: _nullableString(info.pComment),
            location: _nullableString(info.pLocation),
            status: info.status,
            jobCount: info.cJobs,
            attributes: info.attributes,
          ));
        }
      } finally {
        calloc.free(pPrinterEnum);
      }
    } finally {
      calloc.free(pcbNeeded);
      calloc.free(pcReturned);
    }

    return printers;
  }

  int? openPrinter(String printerName) {
    final pPrinterName = printerName.toNativeUtf16();
    final phPrinter = calloc<IntPtr>();

    try {
      final result = SpoolerBindings.openPrinter(pPrinterName, phPrinter, nullptr);
      if (result == 0) {
        return null;
      }
      return phPrinter.value;
    } finally {
      calloc.free(pPrinterName);
      calloc.free(phPrinter);
    }
  }

  void closePrinter(int hPrinter) {
    SpoolerBindings.closePrinter(hPrinter);
  }

  List<PrintJobInfo> enumerateJobs(int hPrinter, {int maxJobs = 100}) {
    final jobs = <PrintJobInfo>[];

    final pcbNeeded = calloc<Uint32>();
    final pcReturned = calloc<Uint32>();

    try {
      SpoolerBindings.enumJobs(
        hPrinter,
        0,
        maxJobs,
        2,
        nullptr,
        0,
        pcbNeeded,
        pcReturned,
      );

      if (pcbNeeded.value == 0) {
        return jobs;
      }

      final pJob = calloc<Uint8>(pcbNeeded.value);
      try {
        final result = SpoolerBindings.enumJobs(
          hPrinter,
          0,
          maxJobs,
          2,
          pJob,
          pcbNeeded.value,
          pcbNeeded,
          pcReturned,
        );

        if (result == 0) {
          return jobs;
        }

        final count = pcReturned.value;
        final jobInfoPtr = pJob.cast<JobInfo2>();

        for (var i = 0; i < count; i++) {
          final info = jobInfoPtr[i];
          jobs.add(PrintJobInfo(
            jobId: info.jobId,
            printerName: info.pPrinterName.toDartString(),
            machineName: _nullableString(info.pMachineName),
            userName: _nullableString(info.pUserName),
            documentName: _nullableString(info.pDocument),
            datatype: _nullableString(info.pDatatype),
            status: info.status,
            totalPages: info.totalPages,
            pagesPrinted: info.pagesPrinted,
            size: info.size,
            submittedAt: _fileTimeToDateTime(info.submittedLow, info.submittedHigh),
          ));
        }
      } finally {
        calloc.free(pJob);
      }
    } finally {
      calloc.free(pcbNeeded);
      calloc.free(pcReturned);
    }

    return jobs;
  }

  String getSpoolDirectory() {
    return getSpoolerDirectory();
  }

  Future<Uint8List?> captureSpoolFile(PrintJobInfo job) async {
    final spoolDir = getSpoolDirectory();
    final splPath = '$spoolDir\\${job.splFileName}';

    final file = File(splPath);
    if (!await file.exists()) {
      return null;
    }

    try {
      return await file.readAsBytes();
    } catch (e) {
      return null;
    }
  }

  Future<Uint8List?> captureShadowFile(PrintJobInfo job) async {
    final spoolDir = getSpoolDirectory();
    final shdPath = '$spoolDir\\${job.shdFileName}';

    final file = File(shdPath);
    if (!await file.exists()) {
      return null;
    }

    try {
      return await file.readAsBytes();
    } catch (e) {
      return null;
    }
  }

  Future<({Uint8List? spl, Uint8List? shd})> captureJobFiles(
    PrintJobInfo job,
  ) async {
    final spl = await captureSpoolFile(job);
    final shd = await captureShadowFile(job);
    return (spl: spl, shd: shd);
  }

  bool pauseJob(int hPrinter, int jobId) {
    return SpoolerBindings.setJob(hPrinter, jobId, 0, nullptr, jobControlPause) != 0;
  }

  bool resumeJob(int hPrinter, int jobId) {
    return SpoolerBindings.setJob(hPrinter, jobId, 0, nullptr, jobControlResume) != 0;
  }

  bool cancelJob(int hPrinter, int jobId) {
    return SpoolerBindings.setJob(hPrinter, jobId, 0, nullptr, jobControlCancel) != 0;
  }

  bool restartJob(int hPrinter, int jobId) {
    return SpoolerBindings.setJob(hPrinter, jobId, 0, nullptr, jobControlRestart) != 0;
  }

  ({int jobId, String spoolPath})? addJob(int hPrinter) {
    final pcbNeeded = calloc<Uint32>();
    try {
      SpoolerBindings.addJob(hPrinter, 1, nullptr, 0, pcbNeeded);
      if (pcbNeeded.value == 0) {
        return null;
      }

      final pData = calloc<Uint8>(pcbNeeded.value);
      try {
        final result = SpoolerBindings.addJob(
          hPrinter,
          1,
          pData,
          pcbNeeded.value,
          pcbNeeded,
        );
        if (result == 0) {
          return null;
        }

        final info = pData.cast<AddJobInfo1>().ref;
        final path = info.path.toDartString();
        return (jobId: info.jobId, spoolPath: path);
      } finally {
        calloc.free(pData);
      }
    } finally {
      calloc.free(pcbNeeded);
    }
  }

  bool scheduleJob(int hPrinter, int jobId) {
    return SpoolerBindings.scheduleJob(hPrinter, jobId) != 0;
  }

  Future<bool> writeSpoolFile(
    int hPrinter,
    String documentName,
    Uint8List data,
    String datatype,
  ) async {
    final pDocName = documentName.toNativeUtf16();
    final pDatatype = datatype.toNativeUtf16();

    final docInfo = calloc<DocInfo1>();
    docInfo.ref.pDocName = pDocName;
    docInfo.ref.pOutputFile = nullptr;
    docInfo.ref.pDatatype = pDatatype;

    try {
      final jobId = SpoolerBindings.startDocPrinter(hPrinter, 1, docInfo.cast());
      if (jobId == 0) {
        return false;
      }

      final pBuf = calloc<Uint8>(data.length);
      final pcWritten = calloc<Uint32>();

      try {
        for (var i = 0; i < data.length; i++) {
          pBuf[i] = data[i];
        }

        final writeResult = SpoolerBindings.writePrinter(
          hPrinter,
          pBuf.cast(),
          data.length,
          pcWritten,
        );

        if (writeResult == 0) {
          return false;
        }

        SpoolerBindings.endDocPrinter(hPrinter);
        return true;
      } finally {
        calloc.free(pBuf);
        calloc.free(pcWritten);
      }
    } finally {
      calloc.free(pDocName);
      calloc.free(pDatatype);
      calloc.free(docInfo);
    }
  }

  String? _nullableString(Pointer<Utf16> ptr) {
    if (ptr == nullptr) return null;
    return ptr.toDartString();
  }

  DateTime? _fileTimeToDateTime(int low, int high) {
    if (low == 0 && high == 0) return null;
    final ticks = (high << 32) | low;
    final microseconds = ticks ~/ 10;
    final epoch = DateTime.utc(1601, 1, 1);
    return epoch.add(Duration(microseconds: microseconds));
  }
}

