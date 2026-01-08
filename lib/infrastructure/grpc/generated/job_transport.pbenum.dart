// This is a generated file - do not edit.
//
// Generated from job_transport.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class JobStatus extends $pb.ProtobufEnum {
  static const JobStatus JOB_STATUS_UNKNOWN =
      JobStatus._(0, _omitEnumNames ? '' : 'JOB_STATUS_UNKNOWN');
  static const JobStatus JOB_STATUS_RECEIVING =
      JobStatus._(1, _omitEnumNames ? '' : 'JOB_STATUS_RECEIVING');
  static const JobStatus JOB_STATUS_COMPLETE =
      JobStatus._(2, _omitEnumNames ? '' : 'JOB_STATUS_COMPLETE');
  static const JobStatus JOB_STATUS_INJECTING =
      JobStatus._(3, _omitEnumNames ? '' : 'JOB_STATUS_INJECTING');
  static const JobStatus JOB_STATUS_SPOOLED =
      JobStatus._(4, _omitEnumNames ? '' : 'JOB_STATUS_SPOOLED');
  static const JobStatus JOB_STATUS_PRINTING =
      JobStatus._(5, _omitEnumNames ? '' : 'JOB_STATUS_PRINTING');
  static const JobStatus JOB_STATUS_PRINTED =
      JobStatus._(6, _omitEnumNames ? '' : 'JOB_STATUS_PRINTED');
  static const JobStatus JOB_STATUS_FAILED =
      JobStatus._(7, _omitEnumNames ? '' : 'JOB_STATUS_FAILED');
  static const JobStatus JOB_STATUS_CANCELLED =
      JobStatus._(8, _omitEnumNames ? '' : 'JOB_STATUS_CANCELLED');

  static const $core.List<JobStatus> values = <JobStatus>[
    JOB_STATUS_UNKNOWN,
    JOB_STATUS_RECEIVING,
    JOB_STATUS_COMPLETE,
    JOB_STATUS_INJECTING,
    JOB_STATUS_SPOOLED,
    JOB_STATUS_PRINTING,
    JOB_STATUS_PRINTED,
    JOB_STATUS_FAILED,
    JOB_STATUS_CANCELLED,
  ];

  static final $core.List<JobStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static JobStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JobStatus._(super.value, super.name);
}

class PrinterStatus extends $pb.ProtobufEnum {
  static const PrinterStatus PRINTER_STATUS_UNKNOWN =
      PrinterStatus._(0, _omitEnumNames ? '' : 'PRINTER_STATUS_UNKNOWN');
  static const PrinterStatus PRINTER_STATUS_ONLINE =
      PrinterStatus._(1, _omitEnumNames ? '' : 'PRINTER_STATUS_ONLINE');
  static const PrinterStatus PRINTER_STATUS_OFFLINE =
      PrinterStatus._(2, _omitEnumNames ? '' : 'PRINTER_STATUS_OFFLINE');
  static const PrinterStatus PRINTER_STATUS_ERROR =
      PrinterStatus._(3, _omitEnumNames ? '' : 'PRINTER_STATUS_ERROR');
  static const PrinterStatus PRINTER_STATUS_PAUSED =
      PrinterStatus._(4, _omitEnumNames ? '' : 'PRINTER_STATUS_PAUSED');
  static const PrinterStatus PRINTER_STATUS_PRINTING =
      PrinterStatus._(5, _omitEnumNames ? '' : 'PRINTER_STATUS_PRINTING');

  static const $core.List<PrinterStatus> values = <PrinterStatus>[
    PRINTER_STATUS_UNKNOWN,
    PRINTER_STATUS_ONLINE,
    PRINTER_STATUS_OFFLINE,
    PRINTER_STATUS_ERROR,
    PRINTER_STATUS_PAUSED,
    PRINTER_STATUS_PRINTING,
  ];

  static final $core.List<PrinterStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static PrinterStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PrinterStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
