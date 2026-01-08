// This is a generated file - do not edit.
//
// Generated from job_transport.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use jobStatusDescriptor instead')
const JobStatus$json = {
  '1': 'JobStatus',
  '2': [
    {'1': 'JOB_STATUS_UNKNOWN', '2': 0},
    {'1': 'JOB_STATUS_RECEIVING', '2': 1},
    {'1': 'JOB_STATUS_COMPLETE', '2': 2},
    {'1': 'JOB_STATUS_INJECTING', '2': 3},
    {'1': 'JOB_STATUS_SPOOLED', '2': 4},
    {'1': 'JOB_STATUS_PRINTING', '2': 5},
    {'1': 'JOB_STATUS_PRINTED', '2': 6},
    {'1': 'JOB_STATUS_FAILED', '2': 7},
    {'1': 'JOB_STATUS_CANCELLED', '2': 8},
  ],
};

/// Descriptor for `JobStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List jobStatusDescriptor = $convert.base64Decode(
    'CglKb2JTdGF0dXMSFgoSSk9CX1NUQVRVU19VTktOT1dOEAASGAoUSk9CX1NUQVRVU19SRUNFSV'
    'ZJTkcQARIXChNKT0JfU1RBVFVTX0NPTVBMRVRFEAISGAoUSk9CX1NUQVRVU19JTkpFQ1RJTkcQ'
    'AxIWChJKT0JfU1RBVFVTX1NQT09MRUQQBBIXChNKT0JfU1RBVFVTX1BSSU5USU5HEAUSFgoSSk'
    '9CX1NUQVRVU19QUklOVEVEEAYSFQoRSk9CX1NUQVRVU19GQUlMRUQQBxIYChRKT0JfU1RBVFVT'
    'X0NBTkNFTExFRBAI');

@$core.Deprecated('Use printerStatusDescriptor instead')
const PrinterStatus$json = {
  '1': 'PrinterStatus',
  '2': [
    {'1': 'PRINTER_STATUS_UNKNOWN', '2': 0},
    {'1': 'PRINTER_STATUS_ONLINE', '2': 1},
    {'1': 'PRINTER_STATUS_OFFLINE', '2': 2},
    {'1': 'PRINTER_STATUS_ERROR', '2': 3},
    {'1': 'PRINTER_STATUS_PAUSED', '2': 4},
    {'1': 'PRINTER_STATUS_PRINTING', '2': 5},
  ],
};

/// Descriptor for `PrinterStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List printerStatusDescriptor = $convert.base64Decode(
    'Cg1QcmludGVyU3RhdHVzEhoKFlBSSU5URVJfU1RBVFVTX1VOS05PV04QABIZChVQUklOVEVSX1'
    'NUQVRVU19PTkxJTkUQARIaChZQUklOVEVSX1NUQVRVU19PRkZMSU5FEAISGAoUUFJJTlRFUl9T'
    'VEFUVVNfRVJST1IQAxIZChVQUklOVEVSX1NUQVRVU19QQVVTRUQQBBIbChdQUklOVEVSX1NUQV'
    'RVU19QUklOVElORxAF');

@$core.Deprecated('Use beginJobRequestDescriptor instead')
const BeginJobRequest$json = {
  '1': 'BeginJobRequest',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'printer_name', '3': 2, '4': 1, '5': 9, '10': 'printerName'},
    {'1': 'document_name', '3': 3, '4': 1, '5': 9, '10': 'documentName'},
    {'1': 'client_id', '3': 4, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'auth_token', '3': 5, '4': 1, '5': 9, '10': 'authToken'},
    {
      '1': 'metadata',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.magic_printer.transport.JobMetadata',
      '10': 'metadata'
    },
  ],
};

/// Descriptor for `BeginJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beginJobRequestDescriptor = $convert.base64Decode(
    'Cg9CZWdpbkpvYlJlcXVlc3QSFQoGam9iX2lkGAEgASgJUgVqb2JJZBIhCgxwcmludGVyX25hbW'
    'UYAiABKAlSC3ByaW50ZXJOYW1lEiMKDWRvY3VtZW50X25hbWUYAyABKAlSDGRvY3VtZW50TmFt'
    'ZRIbCgljbGllbnRfaWQYBCABKAlSCGNsaWVudElkEh0KCmF1dGhfdG9rZW4YBSABKAlSCWF1dG'
    'hUb2tlbhJACghtZXRhZGF0YRgGIAEoCzIkLm1hZ2ljX3ByaW50ZXIudHJhbnNwb3J0LkpvYk1l'
    'dGFkYXRhUghtZXRhZGF0YQ==');

@$core.Deprecated('Use beginJobResponseDescriptor instead')
const BeginJobResponse$json = {
  '1': 'BeginJobResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'host_job_id', '3': 4, '4': 1, '5': 9, '10': 'hostJobId'},
  ],
};

/// Descriptor for `BeginJobResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beginJobResponseDescriptor = $convert.base64Decode(
    'ChBCZWdpbkpvYlJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHQoKZXJyb3JfY2'
    '9kZRgCIAEoCVIJZXJyb3JDb2RlEiMKDWVycm9yX21lc3NhZ2UYAyABKAlSDGVycm9yTWVzc2Fn'
    'ZRIeCgtob3N0X2pvYl9pZBgEIAEoCVIJaG9zdEpvYklk');

@$core.Deprecated('Use sendChunkRequestDescriptor instead')
const SendChunkRequest$json = {
  '1': 'SendChunkRequest',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'chunk_index', '3': 2, '4': 1, '5': 5, '10': 'chunkIndex'},
    {'1': 'total_chunks', '3': 3, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'data', '3': 4, '4': 1, '5': 12, '10': 'data'},
    {'1': 'checksum', '3': 5, '4': 1, '5': 9, '10': 'checksum'},
  ],
};

/// Descriptor for `SendChunkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendChunkRequestDescriptor = $convert.base64Decode(
    'ChBTZW5kQ2h1bmtSZXF1ZXN0EhUKBmpvYl9pZBgBIAEoCVIFam9iSWQSHwoLY2h1bmtfaW5kZX'
    'gYAiABKAVSCmNodW5rSW5kZXgSIQoMdG90YWxfY2h1bmtzGAMgASgFUgt0b3RhbENodW5rcxIS'
    'CgRkYXRhGAQgASgMUgRkYXRhEhoKCGNoZWNrc3VtGAUgASgJUghjaGVja3N1bQ==');

@$core.Deprecated('Use sendChunkResponseDescriptor instead')
const SendChunkResponse$json = {
  '1': 'SendChunkResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'chunk_index', '3': 4, '4': 1, '5': 5, '10': 'chunkIndex'},
    {'1': 'checksum_valid', '3': 5, '4': 1, '5': 8, '10': 'checksumValid'},
  ],
};

/// Descriptor for `SendChunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendChunkResponseDescriptor = $convert.base64Decode(
    'ChFTZW5kQ2h1bmtSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh0KCmVycm9yX2'
    'NvZGUYAiABKAlSCWVycm9yQ29kZRIjCg1lcnJvcl9tZXNzYWdlGAMgASgJUgxlcnJvck1lc3Nh'
    'Z2USHwoLY2h1bmtfaW5kZXgYBCABKAVSCmNodW5rSW5kZXgSJQoOY2hlY2tzdW1fdmFsaWQYBS'
    'ABKAhSDWNoZWNrc3VtVmFsaWQ=');

@$core.Deprecated('Use endJobRequestDescriptor instead')
const EndJobRequest$json = {
  '1': 'EndJobRequest',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'total_chunks', '3': 2, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'full_checksum', '3': 3, '4': 1, '5': 9, '10': 'fullChecksum'},
    {'1': 'original_size', '3': 4, '4': 1, '5': 3, '10': 'originalSize'},
    {'1': 'compressed_size', '3': 5, '4': 1, '5': 3, '10': 'compressedSize'},
  ],
};

/// Descriptor for `EndJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endJobRequestDescriptor = $convert.base64Decode(
    'Cg1FbmRKb2JSZXF1ZXN0EhUKBmpvYl9pZBgBIAEoCVIFam9iSWQSIQoMdG90YWxfY2h1bmtzGA'
    'IgASgFUgt0b3RhbENodW5rcxIjCg1mdWxsX2NoZWNrc3VtGAMgASgJUgxmdWxsQ2hlY2tzdW0S'
    'IwoNb3JpZ2luYWxfc2l6ZRgEIAEoA1IMb3JpZ2luYWxTaXplEicKD2NvbXByZXNzZWRfc2l6ZR'
    'gFIAEoA1IOY29tcHJlc3NlZFNpemU=');

@$core.Deprecated('Use endJobResponseDescriptor instead')
const EndJobResponse$json = {
  '1': 'EndJobResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'result',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.magic_printer.transport.JobResult',
      '10': 'result'
    },
  ],
};

/// Descriptor for `EndJobResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endJobResponseDescriptor = $convert.base64Decode(
    'Cg5FbmRKb2JSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh0KCmVycm9yX2NvZG'
    'UYAiABKAlSCWVycm9yQ29kZRIjCg1lcnJvcl9tZXNzYWdlGAMgASgJUgxlcnJvck1lc3NhZ2US'
    'OgoGcmVzdWx0GAQgASgLMiIubWFnaWNfcHJpbnRlci50cmFuc3BvcnQuSm9iUmVzdWx0UgZyZX'
    'N1bHQ=');

@$core.Deprecated('Use cancelJobRequestDescriptor instead')
const CancelJobRequest$json = {
  '1': 'CancelJobRequest',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `CancelJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelJobRequestDescriptor = $convert.base64Decode(
    'ChBDYW5jZWxKb2JSZXF1ZXN0EhUKBmpvYl9pZBgBIAEoCVIFam9iSWQSFgoGcmVhc29uGAIgAS'
    'gJUgZyZWFzb24=');

@$core.Deprecated('Use cancelJobResponseDescriptor instead')
const CancelJobResponse$json = {
  '1': 'CancelJobResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `CancelJobResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelJobResponseDescriptor = $convert.base64Decode(
    'ChFDYW5jZWxKb2JSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh0KCmVycm9yX2'
    'NvZGUYAiABKAlSCWVycm9yQ29kZRIjCg1lcnJvcl9tZXNzYWdlGAMgASgJUgxlcnJvck1lc3Nh'
    'Z2U=');

@$core.Deprecated('Use getJobStatusRequestDescriptor instead')
const GetJobStatusRequest$json = {
  '1': 'GetJobStatusRequest',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
  ],
};

/// Descriptor for `GetJobStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getJobStatusRequestDescriptor =
    $convert.base64Decode(
        'ChNHZXRKb2JTdGF0dXNSZXF1ZXN0EhUKBmpvYl9pZBgBIAEoCVIFam9iSWQ=');

@$core.Deprecated('Use getJobStatusResponseDescriptor instead')
const GetJobStatusResponse$json = {
  '1': 'GetJobStatusResponse',
  '2': [
    {'1': 'found', '3': 1, '4': 1, '5': 8, '10': 'found'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.magic_printer.transport.JobStatus',
      '10': 'status'
    },
    {'1': 'chunks_received', '3': 3, '4': 1, '5': 5, '10': 'chunksReceived'},
    {'1': 'total_chunks', '3': 4, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'error_code', '3': 5, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 6, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `GetJobStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getJobStatusResponseDescriptor = $convert.base64Decode(
    'ChRHZXRKb2JTdGF0dXNSZXNwb25zZRIUCgVmb3VuZBgBIAEoCFIFZm91bmQSOgoGc3RhdHVzGA'
    'IgASgOMiIubWFnaWNfcHJpbnRlci50cmFuc3BvcnQuSm9iU3RhdHVzUgZzdGF0dXMSJwoPY2h1'
    'bmtzX3JlY2VpdmVkGAMgASgFUg5jaHVua3NSZWNlaXZlZBIhCgx0b3RhbF9jaHVua3MYBCABKA'
    'VSC3RvdGFsQ2h1bmtzEh0KCmVycm9yX2NvZGUYBSABKAlSCWVycm9yQ29kZRIjCg1lcnJvcl9t'
    'ZXNzYWdlGAYgASgJUgxlcnJvck1lc3NhZ2U=');

@$core.Deprecated('Use chunkDataDescriptor instead')
const ChunkData$json = {
  '1': 'ChunkData',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'chunk_index', '3': 2, '4': 1, '5': 5, '10': 'chunkIndex'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
    {'1': 'checksum', '3': 4, '4': 1, '5': 9, '10': 'checksum'},
  ],
};

/// Descriptor for `ChunkData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDataDescriptor = $convert.base64Decode(
    'CglDaHVua0RhdGESFQoGam9iX2lkGAEgASgJUgVqb2JJZBIfCgtjaHVua19pbmRleBgCIAEoBV'
    'IKY2h1bmtJbmRleBISCgRkYXRhGAMgASgMUgRkYXRhEhoKCGNoZWNrc3VtGAQgASgJUghjaGVj'
    'a3N1bQ==');

@$core.Deprecated('Use chunkAckDescriptor instead')
const ChunkAck$json = {
  '1': 'ChunkAck',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'chunk_index', '3': 2, '4': 1, '5': 5, '10': 'chunkIndex'},
    {'1': 'success', '3': 3, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_code', '3': 4, '4': 1, '5': 9, '10': 'errorCode'},
  ],
};

/// Descriptor for `ChunkAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkAckDescriptor = $convert.base64Decode(
    'CghDaHVua0FjaxIVCgZqb2JfaWQYASABKAlSBWpvYklkEh8KC2NodW5rX2luZGV4GAIgASgFUg'
    'pjaHVua0luZGV4EhgKB3N1Y2Nlc3MYAyABKAhSB3N1Y2Nlc3MSHQoKZXJyb3JfY29kZRgEIAEo'
    'CVIJZXJyb3JDb2Rl');

@$core.Deprecated('Use getHostInfoRequestDescriptor instead')
const GetHostInfoRequest$json = {
  '1': 'GetHostInfoRequest',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 9, '10': 'clientId'},
  ],
};

/// Descriptor for `GetHostInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHostInfoRequestDescriptor =
    $convert.base64Decode(
        'ChJHZXRIb3N0SW5mb1JlcXVlc3QSGwoJY2xpZW50X2lkGAEgASgJUghjbGllbnRJZA==');

@$core.Deprecated('Use getHostInfoResponseDescriptor instead')
const GetHostInfoResponse$json = {
  '1': 'GetHostInfoResponse',
  '2': [
    {'1': 'host_id', '3': 1, '4': 1, '5': 9, '10': 'hostId'},
    {'1': 'host_name', '3': 2, '4': 1, '5': 9, '10': 'hostName'},
    {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
    {'1': 'port', '3': 4, '4': 1, '5': 5, '10': 'port'},
    {'1': 'requires_auth', '3': 5, '4': 1, '5': 8, '10': 'requiresAuth'},
    {
      '1': 'supported_features',
      '3': 6,
      '4': 3,
      '5': 9,
      '10': 'supportedFeatures'
    },
  ],
};

/// Descriptor for `GetHostInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHostInfoResponseDescriptor = $convert.base64Decode(
    'ChNHZXRIb3N0SW5mb1Jlc3BvbnNlEhcKB2hvc3RfaWQYASABKAlSBmhvc3RJZBIbCglob3N0X2'
    '5hbWUYAiABKAlSCGhvc3ROYW1lEhgKB3ZlcnNpb24YAyABKAlSB3ZlcnNpb24SEgoEcG9ydBgE'
    'IAEoBVIEcG9ydBIjCg1yZXF1aXJlc19hdXRoGAUgASgIUgxyZXF1aXJlc0F1dGgSLQoSc3VwcG'
    '9ydGVkX2ZlYXR1cmVzGAYgAygJUhFzdXBwb3J0ZWRGZWF0dXJlcw==');

@$core.Deprecated('Use listPrintersRequestDescriptor instead')
const ListPrintersRequest$json = {
  '1': 'ListPrintersRequest',
  '2': [
    {'1': 'auth_token', '3': 1, '4': 1, '5': 9, '10': 'authToken'},
  ],
};

/// Descriptor for `ListPrintersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPrintersRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UHJpbnRlcnNSZXF1ZXN0Eh0KCmF1dGhfdG9rZW4YASABKAlSCWF1dGhUb2tlbg==');

@$core.Deprecated('Use listPrintersResponseDescriptor instead')
const ListPrintersResponse$json = {
  '1': 'ListPrintersResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'printers',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.magic_printer.transport.PrinterInfo',
      '10': 'printers'
    },
  ],
};

/// Descriptor for `ListPrintersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPrintersResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UHJpbnRlcnNSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh0KCmVycm'
    '9yX2NvZGUYAiABKAlSCWVycm9yQ29kZRIjCg1lcnJvcl9tZXNzYWdlGAMgASgJUgxlcnJvck1l'
    'c3NhZ2USQAoIcHJpbnRlcnMYBCADKAsyJC5tYWdpY19wcmludGVyLnRyYW5zcG9ydC5QcmludG'
    'VySW5mb1IIcHJpbnRlcnM=');

@$core.Deprecated('Use checkPermissionRequestDescriptor instead')
const CheckPermissionRequest$json = {
  '1': 'CheckPermissionRequest',
  '2': [
    {'1': 'auth_token', '3': 1, '4': 1, '5': 9, '10': 'authToken'},
    {'1': 'printer_name', '3': 2, '4': 1, '5': 9, '10': 'printerName'},
    {'1': 'permission', '3': 3, '4': 1, '5': 9, '10': 'permission'},
  ],
};

/// Descriptor for `CheckPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionRequestDescriptor = $convert.base64Decode(
    'ChZDaGVja1Blcm1pc3Npb25SZXF1ZXN0Eh0KCmF1dGhfdG9rZW4YASABKAlSCWF1dGhUb2tlbh'
    'IhCgxwcmludGVyX25hbWUYAiABKAlSC3ByaW50ZXJOYW1lEh4KCnBlcm1pc3Npb24YAyABKAlS'
    'CnBlcm1pc3Npb24=');

@$core.Deprecated('Use checkPermissionResponseDescriptor instead')
const CheckPermissionResponse$json = {
  '1': 'CheckPermissionResponse',
  '2': [
    {'1': 'allowed', '3': 1, '4': 1, '5': 8, '10': 'allowed'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `CheckPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionResponseDescriptor = $convert.base64Decode(
    'ChdDaGVja1Blcm1pc3Npb25SZXNwb25zZRIYCgdhbGxvd2VkGAEgASgIUgdhbGxvd2VkEh0KCm'
    'Vycm9yX2NvZGUYAiABKAlSCWVycm9yQ29kZRIjCg1lcnJvcl9tZXNzYWdlGAMgASgJUgxlcnJv'
    'ck1lc3NhZ2U=');

@$core.Deprecated('Use jobMetadataDescriptor instead')
const JobMetadata$json = {
  '1': 'JobMetadata',
  '2': [
    {'1': 'total_size', '3': 1, '4': 1, '5': 3, '10': 'totalSize'},
    {'1': 'total_chunks', '3': 2, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'compression', '3': 3, '4': 1, '5': 9, '10': 'compression'},
    {'1': 'total_pages', '3': 4, '4': 1, '5': 5, '10': 'totalPages'},
    {'1': 'datatype', '3': 5, '4': 1, '5': 9, '10': 'datatype'},
    {
      '1': 'extra',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.magic_printer.transport.JobMetadata.ExtraEntry',
      '10': 'extra'
    },
  ],
  '3': [JobMetadata_ExtraEntry$json],
};

@$core.Deprecated('Use jobMetadataDescriptor instead')
const JobMetadata_ExtraEntry$json = {
  '1': 'ExtraEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `JobMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jobMetadataDescriptor = $convert.base64Decode(
    'CgtKb2JNZXRhZGF0YRIdCgp0b3RhbF9zaXplGAEgASgDUgl0b3RhbFNpemUSIQoMdG90YWxfY2'
    'h1bmtzGAIgASgFUgt0b3RhbENodW5rcxIgCgtjb21wcmVzc2lvbhgDIAEoCVILY29tcHJlc3Np'
    'b24SHwoLdG90YWxfcGFnZXMYBCABKAVSCnRvdGFsUGFnZXMSGgoIZGF0YXR5cGUYBSABKAlSCG'
    'RhdGF0eXBlEkUKBWV4dHJhGAYgAygLMi8ubWFnaWNfcHJpbnRlci50cmFuc3BvcnQuSm9iTWV0'
    'YWRhdGEuRXh0cmFFbnRyeVIFZXh0cmEaOAoKRXh0cmFFbnRyeRIQCgNrZXkYASABKAlSA2tleR'
    'IUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use jobResultDescriptor instead')
const JobResult$json = {
  '1': 'JobResult',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.magic_printer.transport.JobStatus',
      '10': 'status'
    },
    {'1': 'spooler_job_id', '3': 2, '4': 1, '5': 5, '10': 'spoolerJobId'},
    {'1': 'printer_name', '3': 3, '4': 1, '5': 9, '10': 'printerName'},
    {'1': 'bytes_written', '3': 4, '4': 1, '5': 3, '10': 'bytesWritten'},
  ],
};

/// Descriptor for `JobResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jobResultDescriptor = $convert.base64Decode(
    'CglKb2JSZXN1bHQSOgoGc3RhdHVzGAEgASgOMiIubWFnaWNfcHJpbnRlci50cmFuc3BvcnQuSm'
    '9iU3RhdHVzUgZzdGF0dXMSJAoOc3Bvb2xlcl9qb2JfaWQYAiABKAVSDHNwb29sZXJKb2JJZBIh'
    'CgxwcmludGVyX25hbWUYAyABKAlSC3ByaW50ZXJOYW1lEiMKDWJ5dGVzX3dyaXR0ZW4YBCABKA'
    'NSDGJ5dGVzV3JpdHRlbg==');

@$core.Deprecated('Use printerInfoDescriptor instead')
const PrinterInfo$json = {
  '1': 'PrinterInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'driver_name', '3': 2, '4': 1, '5': 9, '10': 'driverName'},
    {'1': 'port_name', '3': 3, '4': 1, '5': 9, '10': 'portName'},
    {'1': 'location', '3': 4, '4': 1, '5': 9, '10': 'location'},
    {'1': 'comment', '3': 5, '4': 1, '5': 9, '10': 'comment'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.magic_printer.transport.PrinterStatus',
      '10': 'status'
    },
    {'1': 'job_count', '3': 7, '4': 1, '5': 5, '10': 'jobCount'},
    {'1': 'shared', '3': 8, '4': 1, '5': 8, '10': 'shared'},
    {'1': 'allowed_groups', '3': 9, '4': 3, '5': 9, '10': 'allowedGroups'},
  ],
};

/// Descriptor for `PrinterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List printerInfoDescriptor = $convert.base64Decode(
    'CgtQcmludGVySW5mbxISCgRuYW1lGAEgASgJUgRuYW1lEh8KC2RyaXZlcl9uYW1lGAIgASgJUg'
    'pkcml2ZXJOYW1lEhsKCXBvcnRfbmFtZRgDIAEoCVIIcG9ydE5hbWUSGgoIbG9jYXRpb24YBCAB'
    'KAlSCGxvY2F0aW9uEhgKB2NvbW1lbnQYBSABKAlSB2NvbW1lbnQSPgoGc3RhdHVzGAYgASgOMi'
    'YubWFnaWNfcHJpbnRlci50cmFuc3BvcnQuUHJpbnRlclN0YXR1c1IGc3RhdHVzEhsKCWpvYl9j'
    'b3VudBgHIAEoBVIIam9iQ291bnQSFgoGc2hhcmVkGAggASgIUgZzaGFyZWQSJQoOYWxsb3dlZF'
    '9ncm91cHMYCSADKAlSDWFsbG93ZWRHcm91cHM=');
