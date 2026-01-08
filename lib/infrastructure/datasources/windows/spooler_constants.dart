import 'dart:ffi';

import 'package:ffi/ffi.dart';

const printerEnumLocal = 0x00000002;
const printerEnumConnections = 0x00000004;

const jobStatusPaused = 0x00000001;
const jobStatusError = 0x00000002;
const jobStatusDeleting = 0x00000004;
const jobStatusSpooling = 0x00000008;
const jobStatusPrinting = 0x00000010;
const jobStatusOffline = 0x00000020;
const jobStatusPaperout = 0x00000040;
const jobStatusPrinted = 0x00000080;
const jobStatusDeleted = 0x00000100;
const jobStatusBlockedDevq = 0x00000200;
const jobStatusUserIntervention = 0x00000400;
const jobStatusRestart = 0x00000800;
const jobStatusComplete = 0x00001000;
const jobStatusRetained = 0x00002000;
const jobStatusRendering = 0x00004000;

const printerStatusPaused = 0x00000001;
const printerStatusError = 0x00000002;
const printerStatusPendingDeletion = 0x00000004;
const printerStatusPaperJam = 0x00000008;
const printerStatusPaperOut = 0x00000010;
const printerStatusManualFeed = 0x00000020;
const printerStatusPaperProblem = 0x00000040;
const printerStatusOffline = 0x00000080;
const printerStatusIoActive = 0x00000100;
const printerStatusBusy = 0x00000200;
const printerStatusPrinting = 0x00000400;
const printerStatusOutputBinFull = 0x00000800;
const printerStatusNotAvailable = 0x00001000;
const printerStatusWaiting = 0x00002000;
const printerStatusProcessing = 0x00004000;
const printerStatusInitializing = 0x00008000;
const printerStatusWarmingUp = 0x00010000;
const printerStatusTonerLow = 0x00020000;
const printerStatusNoToner = 0x00040000;
const printerStatusPagePunt = 0x00080000;
const printerStatusUserIntervention = 0x00100000;
const printerStatusOutOfMemory = 0x00200000;
const printerStatusDoorOpen = 0x00400000;
const printerStatusServerUnknown = 0x00800000;
const printerStatusPowerSave = 0x01000000;

const printerAccessAdminister = 0x00000004;
const printerAccessUse = 0x00000008;
const printerAllAccess = 0x000F000C;

const jobControlPause = 1;
const jobControlResume = 2;
const jobControlCancel = 3;
const jobControlRestart = 4;
const jobControlDelete = 5;
const jobControlSentToprinter = 6;
const jobControlLastPageEjected = 7;
const jobControlRetain = 8;
const jobControlRelease = 9;

sealed class PrinterInfo2 extends Struct {
  external Pointer<Utf16> pServerName;
  external Pointer<Utf16> pPrinterName;
  external Pointer<Utf16> pShareName;
  external Pointer<Utf16> pPortName;
  external Pointer<Utf16> pDriverName;
  external Pointer<Utf16> pComment;
  external Pointer<Utf16> pLocation;
  external Pointer pDevMode;
  external Pointer<Utf16> pSepFile;
  external Pointer<Utf16> pPrintProcessor;
  external Pointer<Utf16> pDatatype;
  external Pointer<Utf16> pParameters;
  external Pointer pSecurityDescriptor;
  @Uint32()
  external int attributes;
  @Uint32()
  external int priority;
  @Uint32()
  external int defaultPriority;
  @Uint32()
  external int startTime;
  @Uint32()
  external int untilTime;
  @Uint32()
  external int status;
  @Uint32()
  external int cJobs;
  @Uint32()
  external int averagePPM;
}

sealed class JobInfo1 extends Struct {
  @Uint32()
  external int jobId;
  external Pointer<Utf16> pPrinterName;
  external Pointer<Utf16> pMachineName;
  external Pointer<Utf16> pUserName;
  external Pointer<Utf16> pDocument;
  external Pointer<Utf16> pDatatype;
  external Pointer<Utf16> pStatus;
  @Uint32()
  external int status;
  @Uint32()
  external int priority;
  @Uint32()
  external int position;
  @Uint32()
  external int totalPages;
  @Uint32()
  external int pagesPrinted;
  @Uint32()
  external int submittedLow;
  @Uint32()
  external int submittedHigh;
}

sealed class JobInfo2 extends Struct {
  @Uint32()
  external int jobId;
  external Pointer<Utf16> pPrinterName;
  external Pointer<Utf16> pMachineName;
  external Pointer<Utf16> pUserName;
  external Pointer<Utf16> pDocument;
  external Pointer<Utf16> pNotifyName;
  external Pointer<Utf16> pDatatype;
  external Pointer<Utf16> pPrintProcessor;
  external Pointer<Utf16> pParameters;
  external Pointer<Utf16> pDriverName;
  external Pointer pDevMode;
  external Pointer<Utf16> pStatus;
  external Pointer pSecurityDescriptor;
  @Uint32()
  external int status;
  @Uint32()
  external int priority;
  @Uint32()
  external int position;
  @Uint32()
  external int startTime;
  @Uint32()
  external int untilTime;
  @Uint32()
  external int totalPages;
  @Uint32()
  external int size;
  @Uint32()
  external int submittedLow;
  @Uint32()
  external int submittedHigh;
  @Uint32()
  external int time;
  @Uint32()
  external int pagesPrinted;
}

typedef EnumPrintersNative = Int32 Function(
  Uint32 flags,
  Pointer<Utf16> name,
  Uint32 level,
  Pointer<Uint8> pPrinterEnum,
  Uint32 cbBuf,
  Pointer<Uint32> pcbNeeded,
  Pointer<Uint32> pcReturned,
);

typedef EnumPrintersDart = int Function(
  int flags,
  Pointer<Utf16> name,
  int level,
  Pointer<Uint8> pPrinterEnum,
  int cbBuf,
  Pointer<Uint32> pcbNeeded,
  Pointer<Uint32> pcReturned,
);

typedef OpenPrinterNative = Int32 Function(
  Pointer<Utf16> pPrinterName,
  Pointer<IntPtr> phPrinter,
  Pointer pDefault,
);

typedef OpenPrinterDart = int Function(
  Pointer<Utf16> pPrinterName,
  Pointer<IntPtr> phPrinter,
  Pointer pDefault,
);

typedef ClosePrinterNative = Int32 Function(IntPtr hPrinter);
typedef ClosePrinterDart = int Function(int hPrinter);

typedef EnumJobsNative = Int32 Function(
  IntPtr hPrinter,
  Uint32 firstJob,
  Uint32 noJobs,
  Uint32 level,
  Pointer<Uint8> pJob,
  Uint32 cbBuf,
  Pointer<Uint32> pcbNeeded,
  Pointer<Uint32> pcReturned,
);

typedef EnumJobsDart = int Function(
  int hPrinter,
  int firstJob,
  int noJobs,
  int level,
  Pointer<Uint8> pJob,
  int cbBuf,
  Pointer<Uint32> pcbNeeded,
  Pointer<Uint32> pcReturned,
);

typedef GetPrinterDriverDirectoryNative = Int32 Function(
  Pointer<Utf16> pName,
  Pointer<Utf16> pEnvironment,
  Uint32 level,
  Pointer<Uint8> pDriverDirectory,
  Uint32 cbBuf,
  Pointer<Uint32> pcbNeeded,
);

typedef GetPrinterDriverDirectoryDart = int Function(
  Pointer<Utf16> pName,
  Pointer<Utf16> pEnvironment,
  int level,
  Pointer<Uint8> pDriverDirectory,
  int cbBuf,
  Pointer<Uint32> pcbNeeded,
);

typedef SetJobNative = Int32 Function(
  IntPtr hPrinter,
  Uint32 jobId,
  Uint32 level,
  Pointer pJob,
  Uint32 command,
);

typedef SetJobDart = int Function(
  int hPrinter,
  int jobId,
  int level,
  Pointer pJob,
  int command,
);

typedef AddJobNative = Int32 Function(
  IntPtr hPrinter,
  Uint32 level,
  Pointer<Uint8> pData,
  Uint32 cbBuf,
  Pointer<Uint32> pcbNeeded,
);

typedef AddJobDart = int Function(
  int hPrinter,
  int level,
  Pointer<Uint8> pData,
  int cbBuf,
  Pointer<Uint32> pcbNeeded,
);

typedef ScheduleJobNative = Int32 Function(IntPtr hPrinter, Uint32 jobId);
typedef ScheduleJobDart = int Function(int hPrinter, int jobId);

typedef StartDocPrinterNative = Uint32 Function(
  IntPtr hPrinter,
  Uint32 level,
  Pointer pDocInfo,
);

typedef StartDocPrinterDart = int Function(
  int hPrinter,
  int level,
  Pointer pDocInfo,
);

typedef EndDocPrinterNative = Int32 Function(IntPtr hPrinter);
typedef EndDocPrinterDart = int Function(int hPrinter);

typedef WritePrinterNative = Int32 Function(
  IntPtr hPrinter,
  Pointer pBuf,
  Uint32 cbBuf,
  Pointer<Uint32> pcWritten,
);

typedef WritePrinterDart = int Function(
  int hPrinter,
  Pointer pBuf,
  int cbBuf,
  Pointer<Uint32> pcWritten,
);

sealed class DocInfo1 extends Struct {
  external Pointer<Utf16> pDocName;
  external Pointer<Utf16> pOutputFile;
  external Pointer<Utf16> pDatatype;
}

sealed class AddJobInfo1 extends Struct {
  external Pointer<Utf16> path;
  @Uint32()
  external int jobId;
}

