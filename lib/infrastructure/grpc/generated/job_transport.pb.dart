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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'job_transport.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'job_transport.pbenum.dart';

class BeginJobRequest extends $pb.GeneratedMessage {
  factory BeginJobRequest({
    $core.String? jobId,
    $core.String? printerName,
    $core.String? documentName,
    $core.String? clientId,
    $core.String? authToken,
    JobMetadata? metadata,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (printerName != null) result.printerName = printerName;
    if (documentName != null) result.documentName = documentName;
    if (clientId != null) result.clientId = clientId;
    if (authToken != null) result.authToken = authToken;
    if (metadata != null) result.metadata = metadata;
    return result;
  }

  BeginJobRequest._();

  factory BeginJobRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeginJobRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeginJobRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOS(2, _omitFieldNames ? '' : 'printerName')
    ..aOS(3, _omitFieldNames ? '' : 'documentName')
    ..aOS(4, _omitFieldNames ? '' : 'clientId')
    ..aOS(5, _omitFieldNames ? '' : 'authToken')
    ..aOM<JobMetadata>(6, _omitFieldNames ? '' : 'metadata',
        subBuilder: JobMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginJobRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginJobRequest copyWith(void Function(BeginJobRequest) updates) =>
      super.copyWith((message) => updates(message as BeginJobRequest))
          as BeginJobRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeginJobRequest create() => BeginJobRequest._();
  @$core.override
  BeginJobRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BeginJobRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeginJobRequest>(create);
  static BeginJobRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get printerName => $_getSZ(1);
  @$pb.TagNumber(2)
  set printerName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrinterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrinterName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentName => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get clientId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clientId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasClientId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get authToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set authToken($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthToken() => $_clearField(5);

  @$pb.TagNumber(6)
  JobMetadata get metadata => $_getN(5);
  @$pb.TagNumber(6)
  set metadata(JobMetadata value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetadata() => $_clearField(6);
  @$pb.TagNumber(6)
  JobMetadata ensureMetadata() => $_ensure(5);
}

class BeginJobResponse extends $pb.GeneratedMessage {
  factory BeginJobResponse({
    $core.bool? success,
    $core.String? errorCode,
    $core.String? errorMessage,
    $core.String? hostJobId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (hostJobId != null) result.hostJobId = hostJobId;
    return result;
  }

  BeginJobResponse._();

  factory BeginJobResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeginJobResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeginJobResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(4, _omitFieldNames ? '' : 'hostJobId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginJobResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeginJobResponse copyWith(void Function(BeginJobResponse) updates) =>
      super.copyWith((message) => updates(message as BeginJobResponse))
          as BeginJobResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeginJobResponse create() => BeginJobResponse._();
  @$core.override
  BeginJobResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BeginJobResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeginJobResponse>(create);
  static BeginJobResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get hostJobId => $_getSZ(3);
  @$pb.TagNumber(4)
  set hostJobId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHostJobId() => $_has(3);
  @$pb.TagNumber(4)
  void clearHostJobId() => $_clearField(4);
}

class SendChunkRequest extends $pb.GeneratedMessage {
  factory SendChunkRequest({
    $core.String? jobId,
    $core.int? chunkIndex,
    $core.int? totalChunks,
    $core.List<$core.int>? data,
    $core.String? checksum,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (chunkIndex != null) result.chunkIndex = chunkIndex;
    if (totalChunks != null) result.totalChunks = totalChunks;
    if (data != null) result.data = data;
    if (checksum != null) result.checksum = checksum;
    return result;
  }

  SendChunkRequest._();

  factory SendChunkRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendChunkRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendChunkRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aI(2, _omitFieldNames ? '' : 'chunkIndex')
    ..aI(3, _omitFieldNames ? '' : 'totalChunks')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(5, _omitFieldNames ? '' : 'checksum')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendChunkRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendChunkRequest copyWith(void Function(SendChunkRequest) updates) =>
      super.copyWith((message) => updates(message as SendChunkRequest))
          as SendChunkRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendChunkRequest create() => SendChunkRequest._();
  @$core.override
  SendChunkRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendChunkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendChunkRequest>(create);
  static SendChunkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunkIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunkIndex($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunkIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalChunks => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalChunks($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalChunks() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalChunks() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get checksum => $_getSZ(4);
  @$pb.TagNumber(5)
  set checksum($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChecksum() => $_has(4);
  @$pb.TagNumber(5)
  void clearChecksum() => $_clearField(5);
}

class SendChunkResponse extends $pb.GeneratedMessage {
  factory SendChunkResponse({
    $core.bool? success,
    $core.String? errorCode,
    $core.String? errorMessage,
    $core.int? chunkIndex,
    $core.bool? checksumValid,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (chunkIndex != null) result.chunkIndex = chunkIndex;
    if (checksumValid != null) result.checksumValid = checksumValid;
    return result;
  }

  SendChunkResponse._();

  factory SendChunkResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendChunkResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendChunkResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..aI(4, _omitFieldNames ? '' : 'chunkIndex')
    ..aOB(5, _omitFieldNames ? '' : 'checksumValid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendChunkResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendChunkResponse copyWith(void Function(SendChunkResponse) updates) =>
      super.copyWith((message) => updates(message as SendChunkResponse))
          as SendChunkResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendChunkResponse create() => SendChunkResponse._();
  @$core.override
  SendChunkResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendChunkResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendChunkResponse>(create);
  static SendChunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get chunkIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set chunkIndex($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChunkIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearChunkIndex() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get checksumValid => $_getBF(4);
  @$pb.TagNumber(5)
  set checksumValid($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChecksumValid() => $_has(4);
  @$pb.TagNumber(5)
  void clearChecksumValid() => $_clearField(5);
}

class EndJobRequest extends $pb.GeneratedMessage {
  factory EndJobRequest({
    $core.String? jobId,
    $core.int? totalChunks,
    $core.String? fullChecksum,
    $fixnum.Int64? originalSize,
    $fixnum.Int64? compressedSize,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (totalChunks != null) result.totalChunks = totalChunks;
    if (fullChecksum != null) result.fullChecksum = fullChecksum;
    if (originalSize != null) result.originalSize = originalSize;
    if (compressedSize != null) result.compressedSize = compressedSize;
    return result;
  }

  EndJobRequest._();

  factory EndJobRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndJobRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndJobRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aI(2, _omitFieldNames ? '' : 'totalChunks')
    ..aOS(3, _omitFieldNames ? '' : 'fullChecksum')
    ..aInt64(4, _omitFieldNames ? '' : 'originalSize')
    ..aInt64(5, _omitFieldNames ? '' : 'compressedSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndJobRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndJobRequest copyWith(void Function(EndJobRequest) updates) =>
      super.copyWith((message) => updates(message as EndJobRequest))
          as EndJobRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndJobRequest create() => EndJobRequest._();
  @$core.override
  EndJobRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndJobRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndJobRequest>(create);
  static EndJobRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalChunks => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalChunks($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalChunks() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalChunks() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullChecksum => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullChecksum($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFullChecksum() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullChecksum() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get originalSize => $_getI64(3);
  @$pb.TagNumber(4)
  set originalSize($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOriginalSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearOriginalSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get compressedSize => $_getI64(4);
  @$pb.TagNumber(5)
  set compressedSize($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCompressedSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompressedSize() => $_clearField(5);
}

class EndJobResponse extends $pb.GeneratedMessage {
  factory EndJobResponse({
    $core.bool? success,
    $core.String? errorCode,
    $core.String? errorMessage,
    JobResult? result,
  }) {
    final result$ = create();
    if (success != null) result$.success = success;
    if (errorCode != null) result$.errorCode = errorCode;
    if (errorMessage != null) result$.errorMessage = errorMessage;
    if (result != null) result$.result = result;
    return result$;
  }

  EndJobResponse._();

  factory EndJobResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndJobResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndJobResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<JobResult>(4, _omitFieldNames ? '' : 'result',
        subBuilder: JobResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndJobResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndJobResponse copyWith(void Function(EndJobResponse) updates) =>
      super.copyWith((message) => updates(message as EndJobResponse))
          as EndJobResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndJobResponse create() => EndJobResponse._();
  @$core.override
  EndJobResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndJobResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndJobResponse>(create);
  static EndJobResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  JobResult get result => $_getN(3);
  @$pb.TagNumber(4)
  set result(JobResult value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearResult() => $_clearField(4);
  @$pb.TagNumber(4)
  JobResult ensureResult() => $_ensure(3);
}

class CancelJobRequest extends $pb.GeneratedMessage {
  factory CancelJobRequest({
    $core.String? jobId,
    $core.String? reason,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (reason != null) result.reason = reason;
    return result;
  }

  CancelJobRequest._();

  factory CancelJobRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelJobRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelJobRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelJobRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelJobRequest copyWith(void Function(CancelJobRequest) updates) =>
      super.copyWith((message) => updates(message as CancelJobRequest))
          as CancelJobRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelJobRequest create() => CancelJobRequest._();
  @$core.override
  CancelJobRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelJobRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelJobRequest>(create);
  static CancelJobRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class CancelJobResponse extends $pb.GeneratedMessage {
  factory CancelJobResponse({
    $core.bool? success,
    $core.String? errorCode,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  CancelJobResponse._();

  factory CancelJobResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelJobResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelJobResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelJobResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelJobResponse copyWith(void Function(CancelJobResponse) updates) =>
      super.copyWith((message) => updates(message as CancelJobResponse))
          as CancelJobResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelJobResponse create() => CancelJobResponse._();
  @$core.override
  CancelJobResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelJobResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelJobResponse>(create);
  static CancelJobResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);
}

class GetJobStatusRequest extends $pb.GeneratedMessage {
  factory GetJobStatusRequest({
    $core.String? jobId,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    return result;
  }

  GetJobStatusRequest._();

  factory GetJobStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetJobStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetJobStatusRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusRequest copyWith(void Function(GetJobStatusRequest) updates) =>
      super.copyWith((message) => updates(message as GetJobStatusRequest))
          as GetJobStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetJobStatusRequest create() => GetJobStatusRequest._();
  @$core.override
  GetJobStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetJobStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetJobStatusRequest>(create);
  static GetJobStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);
}

class GetJobStatusResponse extends $pb.GeneratedMessage {
  factory GetJobStatusResponse({
    $core.bool? found,
    JobStatus? status,
    $core.int? chunksReceived,
    $core.int? totalChunks,
    $core.String? errorCode,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (found != null) result.found = found;
    if (status != null) result.status = status;
    if (chunksReceived != null) result.chunksReceived = chunksReceived;
    if (totalChunks != null) result.totalChunks = totalChunks;
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  GetJobStatusResponse._();

  factory GetJobStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetJobStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetJobStatusResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'found')
    ..aE<JobStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: JobStatus.values)
    ..aI(3, _omitFieldNames ? '' : 'chunksReceived')
    ..aI(4, _omitFieldNames ? '' : 'totalChunks')
    ..aOS(5, _omitFieldNames ? '' : 'errorCode')
    ..aOS(6, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusResponse copyWith(void Function(GetJobStatusResponse) updates) =>
      super.copyWith((message) => updates(message as GetJobStatusResponse))
          as GetJobStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetJobStatusResponse create() => GetJobStatusResponse._();
  @$core.override
  GetJobStatusResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetJobStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetJobStatusResponse>(create);
  static GetJobStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get found => $_getBF(0);
  @$pb.TagNumber(1)
  set found($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFound() => $_has(0);
  @$pb.TagNumber(1)
  void clearFound() => $_clearField(1);

  @$pb.TagNumber(2)
  JobStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(JobStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get chunksReceived => $_getIZ(2);
  @$pb.TagNumber(3)
  set chunksReceived($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChunksReceived() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunksReceived() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalChunks => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalChunks($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalChunks() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalChunks() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get errorCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set errorCode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasErrorCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearErrorCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get errorMessage => $_getSZ(5);
  @$pb.TagNumber(6)
  set errorMessage($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasErrorMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearErrorMessage() => $_clearField(6);
}

/// Stream de chunks (alta performance)
class ChunkData extends $pb.GeneratedMessage {
  factory ChunkData({
    $core.String? jobId,
    $core.int? chunkIndex,
    $core.List<$core.int>? data,
    $core.String? checksum,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (chunkIndex != null) result.chunkIndex = chunkIndex;
    if (data != null) result.data = data;
    if (checksum != null) result.checksum = checksum;
    return result;
  }

  ChunkData._();

  factory ChunkData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChunkData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChunkData',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aI(2, _omitFieldNames ? '' : 'chunkIndex')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'checksum')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChunkData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChunkData copyWith(void Function(ChunkData) updates) =>
      super.copyWith((message) => updates(message as ChunkData)) as ChunkData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkData create() => ChunkData._();
  @$core.override
  ChunkData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChunkData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkData>(create);
  static ChunkData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunkIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunkIndex($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunkIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get checksum => $_getSZ(3);
  @$pb.TagNumber(4)
  set checksum($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChecksum() => $_has(3);
  @$pb.TagNumber(4)
  void clearChecksum() => $_clearField(4);
}

class ChunkAck extends $pb.GeneratedMessage {
  factory ChunkAck({
    $core.String? jobId,
    $core.int? chunkIndex,
    $core.bool? success,
    $core.String? errorCode,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (chunkIndex != null) result.chunkIndex = chunkIndex;
    if (success != null) result.success = success;
    if (errorCode != null) result.errorCode = errorCode;
    return result;
  }

  ChunkAck._();

  factory ChunkAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChunkAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChunkAck',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..aI(2, _omitFieldNames ? '' : 'chunkIndex')
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..aOS(4, _omitFieldNames ? '' : 'errorCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChunkAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChunkAck copyWith(void Function(ChunkAck) updates) =>
      super.copyWith((message) => updates(message as ChunkAck)) as ChunkAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkAck create() => ChunkAck._();
  @$core.override
  ChunkAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChunkAck getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkAck>(create);
  static ChunkAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunkIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunkIndex($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunkIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get errorCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorCode($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorCode() => $_clearField(4);
}

class GetHostInfoRequest extends $pb.GeneratedMessage {
  factory GetHostInfoRequest({
    $core.String? clientId,
  }) {
    final result = create();
    if (clientId != null) result.clientId = clientId;
    return result;
  }

  GetHostInfoRequest._();

  factory GetHostInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetHostInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetHostInfoRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHostInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHostInfoRequest copyWith(void Function(GetHostInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetHostInfoRequest))
          as GetHostInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHostInfoRequest create() => GetHostInfoRequest._();
  @$core.override
  GetHostInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetHostInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetHostInfoRequest>(create);
  static GetHostInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

class GetHostInfoResponse extends $pb.GeneratedMessage {
  factory GetHostInfoResponse({
    $core.String? hostId,
    $core.String? hostName,
    $core.String? version,
    $core.int? port,
    $core.bool? requiresAuth,
    $core.Iterable<$core.String>? supportedFeatures,
  }) {
    final result = create();
    if (hostId != null) result.hostId = hostId;
    if (hostName != null) result.hostName = hostName;
    if (version != null) result.version = version;
    if (port != null) result.port = port;
    if (requiresAuth != null) result.requiresAuth = requiresAuth;
    if (supportedFeatures != null)
      result.supportedFeatures.addAll(supportedFeatures);
    return result;
  }

  GetHostInfoResponse._();

  factory GetHostInfoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetHostInfoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetHostInfoResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostId')
    ..aOS(2, _omitFieldNames ? '' : 'hostName')
    ..aOS(3, _omitFieldNames ? '' : 'version')
    ..aI(4, _omitFieldNames ? '' : 'port')
    ..aOB(5, _omitFieldNames ? '' : 'requiresAuth')
    ..pPS(6, _omitFieldNames ? '' : 'supportedFeatures')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHostInfoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHostInfoResponse copyWith(void Function(GetHostInfoResponse) updates) =>
      super.copyWith((message) => updates(message as GetHostInfoResponse))
          as GetHostInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHostInfoResponse create() => GetHostInfoResponse._();
  @$core.override
  GetHostInfoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetHostInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetHostInfoResponse>(create);
  static GetHostInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get hostName => $_getSZ(1);
  @$pb.TagNumber(2)
  set hostName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHostName() => $_has(1);
  @$pb.TagNumber(2)
  void clearHostName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get port => $_getIZ(3);
  @$pb.TagNumber(4)
  set port($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearPort() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get requiresAuth => $_getBF(4);
  @$pb.TagNumber(5)
  set requiresAuth($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRequiresAuth() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequiresAuth() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get supportedFeatures => $_getList(5);
}

class ListPrintersRequest extends $pb.GeneratedMessage {
  factory ListPrintersRequest({
    $core.String? authToken,
  }) {
    final result = create();
    if (authToken != null) result.authToken = authToken;
    return result;
  }

  ListPrintersRequest._();

  factory ListPrintersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPrintersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPrintersRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'authToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPrintersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPrintersRequest copyWith(void Function(ListPrintersRequest) updates) =>
      super.copyWith((message) => updates(message as ListPrintersRequest))
          as ListPrintersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPrintersRequest create() => ListPrintersRequest._();
  @$core.override
  ListPrintersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListPrintersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPrintersRequest>(create);
  static ListPrintersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set authToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthToken() => $_clearField(1);
}

class ListPrintersResponse extends $pb.GeneratedMessage {
  factory ListPrintersResponse({
    $core.bool? success,
    $core.String? errorCode,
    $core.String? errorMessage,
    $core.Iterable<PrinterInfo>? printers,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (printers != null) result.printers.addAll(printers);
    return result;
  }

  ListPrintersResponse._();

  factory ListPrintersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPrintersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPrintersResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..pPM<PrinterInfo>(4, _omitFieldNames ? '' : 'printers',
        subBuilder: PrinterInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPrintersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPrintersResponse copyWith(void Function(ListPrintersResponse) updates) =>
      super.copyWith((message) => updates(message as ListPrintersResponse))
          as ListPrintersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPrintersResponse create() => ListPrintersResponse._();
  @$core.override
  ListPrintersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListPrintersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPrintersResponse>(create);
  static ListPrintersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<PrinterInfo> get printers => $_getList(3);
}

class CheckPermissionRequest extends $pb.GeneratedMessage {
  factory CheckPermissionRequest({
    $core.String? authToken,
    $core.String? printerName,
    $core.String? permission,
  }) {
    final result = create();
    if (authToken != null) result.authToken = authToken;
    if (printerName != null) result.printerName = printerName;
    if (permission != null) result.permission = permission;
    return result;
  }

  CheckPermissionRequest._();

  factory CheckPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPermissionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'authToken')
    ..aOS(2, _omitFieldNames ? '' : 'printerName')
    ..aOS(3, _omitFieldNames ? '' : 'permission')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionRequest copyWith(
          void Function(CheckPermissionRequest) updates) =>
      super.copyWith((message) => updates(message as CheckPermissionRequest))
          as CheckPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest create() => CheckPermissionRequest._();
  @$core.override
  CheckPermissionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPermissionRequest>(create);
  static CheckPermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set authToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get printerName => $_getSZ(1);
  @$pb.TagNumber(2)
  set printerName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrinterName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrinterName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get permission => $_getSZ(2);
  @$pb.TagNumber(3)
  set permission($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermission() => $_clearField(3);
}

class CheckPermissionResponse extends $pb.GeneratedMessage {
  factory CheckPermissionResponse({
    $core.bool? allowed,
    $core.String? errorCode,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (allowed != null) result.allowed = allowed;
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  CheckPermissionResponse._();

  factory CheckPermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPermissionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowed')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionResponse copyWith(
          void Function(CheckPermissionResponse) updates) =>
      super.copyWith((message) => updates(message as CheckPermissionResponse))
          as CheckPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse create() => CheckPermissionResponse._();
  @$core.override
  CheckPermissionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPermissionResponse>(create);
  static CheckPermissionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allowed => $_getBF(0);
  @$pb.TagNumber(1)
  set allowed($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAllowed() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowed() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);
}

class JobMetadata extends $pb.GeneratedMessage {
  factory JobMetadata({
    $fixnum.Int64? totalSize,
    $core.int? totalChunks,
    $core.String? compression,
    $core.int? totalPages,
    $core.String? datatype,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? extra,
  }) {
    final result = create();
    if (totalSize != null) result.totalSize = totalSize;
    if (totalChunks != null) result.totalChunks = totalChunks;
    if (compression != null) result.compression = compression;
    if (totalPages != null) result.totalPages = totalPages;
    if (datatype != null) result.datatype = datatype;
    if (extra != null) result.extra.addEntries(extra);
    return result;
  }

  JobMetadata._();

  factory JobMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JobMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JobMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalSize')
    ..aI(2, _omitFieldNames ? '' : 'totalChunks')
    ..aOS(3, _omitFieldNames ? '' : 'compression')
    ..aI(4, _omitFieldNames ? '' : 'totalPages')
    ..aOS(5, _omitFieldNames ? '' : 'datatype')
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'extra',
        entryClassName: 'JobMetadata.ExtraEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('magic_printer.transport'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobMetadata copyWith(void Function(JobMetadata) updates) =>
      super.copyWith((message) => updates(message as JobMetadata))
          as JobMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobMetadata create() => JobMetadata._();
  @$core.override
  JobMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JobMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JobMetadata>(create);
  static JobMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalSize => $_getI64(0);
  @$pb.TagNumber(1)
  set totalSize($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalChunks => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalChunks($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalChunks() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalChunks() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get compression => $_getSZ(2);
  @$pb.TagNumber(3)
  set compression($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCompression() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompression() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalPages => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalPages($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalPages() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalPages() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get datatype => $_getSZ(4);
  @$pb.TagNumber(5)
  set datatype($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDatatype() => $_has(4);
  @$pb.TagNumber(5)
  void clearDatatype() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.String> get extra => $_getMap(5);
}

class JobResult extends $pb.GeneratedMessage {
  factory JobResult({
    JobStatus? status,
    $core.int? spoolerJobId,
    $core.String? printerName,
    $fixnum.Int64? bytesWritten,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (spoolerJobId != null) result.spoolerJobId = spoolerJobId;
    if (printerName != null) result.printerName = printerName;
    if (bytesWritten != null) result.bytesWritten = bytesWritten;
    return result;
  }

  JobResult._();

  factory JobResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JobResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JobResult',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aE<JobStatus>(1, _omitFieldNames ? '' : 'status',
        enumValues: JobStatus.values)
    ..aI(2, _omitFieldNames ? '' : 'spoolerJobId')
    ..aOS(3, _omitFieldNames ? '' : 'printerName')
    ..aInt64(4, _omitFieldNames ? '' : 'bytesWritten')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JobResult copyWith(void Function(JobResult) updates) =>
      super.copyWith((message) => updates(message as JobResult)) as JobResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JobResult create() => JobResult._();
  @$core.override
  JobResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JobResult getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JobResult>(create);
  static JobResult? _defaultInstance;

  @$pb.TagNumber(1)
  JobStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(JobStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get spoolerJobId => $_getIZ(1);
  @$pb.TagNumber(2)
  set spoolerJobId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSpoolerJobId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpoolerJobId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get printerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set printerName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrinterName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrinterName() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get bytesWritten => $_getI64(3);
  @$pb.TagNumber(4)
  set bytesWritten($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBytesWritten() => $_has(3);
  @$pb.TagNumber(4)
  void clearBytesWritten() => $_clearField(4);
}

class PrinterInfo extends $pb.GeneratedMessage {
  factory PrinterInfo({
    $core.String? name,
    $core.String? driverName,
    $core.String? portName,
    $core.String? location,
    $core.String? comment,
    PrinterStatus? status,
    $core.int? jobCount,
    $core.bool? shared,
    $core.Iterable<$core.String>? allowedGroups,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (driverName != null) result.driverName = driverName;
    if (portName != null) result.portName = portName;
    if (location != null) result.location = location;
    if (comment != null) result.comment = comment;
    if (status != null) result.status = status;
    if (jobCount != null) result.jobCount = jobCount;
    if (shared != null) result.shared = shared;
    if (allowedGroups != null) result.allowedGroups.addAll(allowedGroups);
    return result;
  }

  PrinterInfo._();

  factory PrinterInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrinterInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrinterInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'magic_printer.transport'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'driverName')
    ..aOS(3, _omitFieldNames ? '' : 'portName')
    ..aOS(4, _omitFieldNames ? '' : 'location')
    ..aOS(5, _omitFieldNames ? '' : 'comment')
    ..aE<PrinterStatus>(6, _omitFieldNames ? '' : 'status',
        enumValues: PrinterStatus.values)
    ..aI(7, _omitFieldNames ? '' : 'jobCount')
    ..aOB(8, _omitFieldNames ? '' : 'shared')
    ..pPS(9, _omitFieldNames ? '' : 'allowedGroups')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrinterInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrinterInfo copyWith(void Function(PrinterInfo) updates) =>
      super.copyWith((message) => updates(message as PrinterInfo))
          as PrinterInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrinterInfo create() => PrinterInfo._();
  @$core.override
  PrinterInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrinterInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrinterInfo>(create);
  static PrinterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get driverName => $_getSZ(1);
  @$pb.TagNumber(2)
  set driverName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDriverName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDriverName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get portName => $_getSZ(2);
  @$pb.TagNumber(3)
  set portName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPortName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPortName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);
  @$pb.TagNumber(4)
  set location($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(5)
  set comment($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(5)
  void clearComment() => $_clearField(5);

  @$pb.TagNumber(6)
  PrinterStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(PrinterStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get jobCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set jobCount($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasJobCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearJobCount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get shared => $_getBF(7);
  @$pb.TagNumber(8)
  set shared($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasShared() => $_has(7);
  @$pb.TagNumber(8)
  void clearShared() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get allowedGroups => $_getList(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
