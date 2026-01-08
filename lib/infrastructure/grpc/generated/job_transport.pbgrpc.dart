// This is a generated file - do not edit.
//
// Generated from job_transport.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'job_transport.pb.dart' as $0;

export 'job_transport.pb.dart';

/// Serviço de transporte de jobs de impressão
@$pb.GrpcServiceName('magic_printer.transport.JobTransport')
class JobTransportClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  JobTransportClient(super.channel, {super.options, super.interceptors});

  /// Inicia um novo job no Host
  $grpc.ResponseFuture<$0.BeginJobResponse> beginJob(
    $0.BeginJobRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$beginJob, request, options: options);
  }

  /// Envia um chunk de dados do job
  $grpc.ResponseFuture<$0.SendChunkResponse> sendChunk(
    $0.SendChunkRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendChunk, request, options: options);
  }

  /// Finaliza o job (todos os chunks enviados)
  $grpc.ResponseFuture<$0.EndJobResponse> endJob(
    $0.EndJobRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$endJob, request, options: options);
  }

  /// Cancela um job em andamento
  $grpc.ResponseFuture<$0.CancelJobResponse> cancelJob(
    $0.CancelJobRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cancelJob, request, options: options);
  }

  /// Verifica status de um job
  $grpc.ResponseFuture<$0.GetJobStatusResponse> getJobStatus(
    $0.GetJobStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getJobStatus, request, options: options);
  }

  /// Stream bidirecional para envio de chunks (opcional, alta performance)
  $grpc.ResponseStream<$0.ChunkAck> streamChunks(
    $async.Stream<$0.ChunkData> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$streamChunks, request, options: options);
  }

  // method descriptors

  static final _$beginJob =
      $grpc.ClientMethod<$0.BeginJobRequest, $0.BeginJobResponse>(
          '/magic_printer.transport.JobTransport/BeginJob',
          ($0.BeginJobRequest value) => value.writeToBuffer(),
          $0.BeginJobResponse.fromBuffer);
  static final _$sendChunk =
      $grpc.ClientMethod<$0.SendChunkRequest, $0.SendChunkResponse>(
          '/magic_printer.transport.JobTransport/SendChunk',
          ($0.SendChunkRequest value) => value.writeToBuffer(),
          $0.SendChunkResponse.fromBuffer);
  static final _$endJob =
      $grpc.ClientMethod<$0.EndJobRequest, $0.EndJobResponse>(
          '/magic_printer.transport.JobTransport/EndJob',
          ($0.EndJobRequest value) => value.writeToBuffer(),
          $0.EndJobResponse.fromBuffer);
  static final _$cancelJob =
      $grpc.ClientMethod<$0.CancelJobRequest, $0.CancelJobResponse>(
          '/magic_printer.transport.JobTransport/CancelJob',
          ($0.CancelJobRequest value) => value.writeToBuffer(),
          $0.CancelJobResponse.fromBuffer);
  static final _$getJobStatus =
      $grpc.ClientMethod<$0.GetJobStatusRequest, $0.GetJobStatusResponse>(
          '/magic_printer.transport.JobTransport/GetJobStatus',
          ($0.GetJobStatusRequest value) => value.writeToBuffer(),
          $0.GetJobStatusResponse.fromBuffer);
  static final _$streamChunks = $grpc.ClientMethod<$0.ChunkData, $0.ChunkAck>(
      '/magic_printer.transport.JobTransport/StreamChunks',
      ($0.ChunkData value) => value.writeToBuffer(),
      $0.ChunkAck.fromBuffer);
}

@$pb.GrpcServiceName('magic_printer.transport.JobTransport')
abstract class JobTransportServiceBase extends $grpc.Service {
  $core.String get $name => 'magic_printer.transport.JobTransport';

  JobTransportServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.BeginJobRequest, $0.BeginJobResponse>(
        'BeginJob',
        beginJob_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BeginJobRequest.fromBuffer(value),
        ($0.BeginJobResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendChunkRequest, $0.SendChunkResponse>(
        'SendChunk',
        sendChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendChunkRequest.fromBuffer(value),
        ($0.SendChunkResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EndJobRequest, $0.EndJobResponse>(
        'EndJob',
        endJob_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EndJobRequest.fromBuffer(value),
        ($0.EndJobResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CancelJobRequest, $0.CancelJobResponse>(
        'CancelJob',
        cancelJob_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CancelJobRequest.fromBuffer(value),
        ($0.CancelJobResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetJobStatusRequest, $0.GetJobStatusResponse>(
            'GetJobStatus',
            getJobStatus_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetJobStatusRequest.fromBuffer(value),
            ($0.GetJobStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChunkData, $0.ChunkAck>(
        'StreamChunks',
        streamChunks,
        true,
        true,
        ($core.List<$core.int> value) => $0.ChunkData.fromBuffer(value),
        ($0.ChunkAck value) => value.writeToBuffer()));
  }

  $async.Future<$0.BeginJobResponse> beginJob_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BeginJobRequest> $request) async {
    return beginJob($call, await $request);
  }

  $async.Future<$0.BeginJobResponse> beginJob(
      $grpc.ServiceCall call, $0.BeginJobRequest request);

  $async.Future<$0.SendChunkResponse> sendChunk_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SendChunkRequest> $request) async {
    return sendChunk($call, await $request);
  }

  $async.Future<$0.SendChunkResponse> sendChunk(
      $grpc.ServiceCall call, $0.SendChunkRequest request);

  $async.Future<$0.EndJobResponse> endJob_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.EndJobRequest> $request) async {
    return endJob($call, await $request);
  }

  $async.Future<$0.EndJobResponse> endJob(
      $grpc.ServiceCall call, $0.EndJobRequest request);

  $async.Future<$0.CancelJobResponse> cancelJob_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CancelJobRequest> $request) async {
    return cancelJob($call, await $request);
  }

  $async.Future<$0.CancelJobResponse> cancelJob(
      $grpc.ServiceCall call, $0.CancelJobRequest request);

  $async.Future<$0.GetJobStatusResponse> getJobStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetJobStatusRequest> $request) async {
    return getJobStatus($call, await $request);
  }

  $async.Future<$0.GetJobStatusResponse> getJobStatus(
      $grpc.ServiceCall call, $0.GetJobStatusRequest request);

  $async.Stream<$0.ChunkAck> streamChunks(
      $grpc.ServiceCall call, $async.Stream<$0.ChunkData> request);
}

/// Serviço de descoberta e informações do Host
@$pb.GrpcServiceName('magic_printer.transport.HostDiscovery')
class HostDiscoveryClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  HostDiscoveryClient(super.channel, {super.options, super.interceptors});

  /// Retorna informações do Host
  $grpc.ResponseFuture<$0.GetHostInfoResponse> getHostInfo(
    $0.GetHostInfoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getHostInfo, request, options: options);
  }

  /// Lista impressoras compartilhadas pelo Host
  $grpc.ResponseFuture<$0.ListPrintersResponse> listPrinters(
    $0.ListPrintersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listPrinters, request, options: options);
  }

  /// Verifica se o cliente tem permissão para uma impressora
  $grpc.ResponseFuture<$0.CheckPermissionResponse> checkPermission(
    $0.CheckPermissionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkPermission, request, options: options);
  }

  // method descriptors

  static final _$getHostInfo =
      $grpc.ClientMethod<$0.GetHostInfoRequest, $0.GetHostInfoResponse>(
          '/magic_printer.transport.HostDiscovery/GetHostInfo',
          ($0.GetHostInfoRequest value) => value.writeToBuffer(),
          $0.GetHostInfoResponse.fromBuffer);
  static final _$listPrinters =
      $grpc.ClientMethod<$0.ListPrintersRequest, $0.ListPrintersResponse>(
          '/magic_printer.transport.HostDiscovery/ListPrinters',
          ($0.ListPrintersRequest value) => value.writeToBuffer(),
          $0.ListPrintersResponse.fromBuffer);
  static final _$checkPermission =
      $grpc.ClientMethod<$0.CheckPermissionRequest, $0.CheckPermissionResponse>(
          '/magic_printer.transport.HostDiscovery/CheckPermission',
          ($0.CheckPermissionRequest value) => value.writeToBuffer(),
          $0.CheckPermissionResponse.fromBuffer);
}

@$pb.GrpcServiceName('magic_printer.transport.HostDiscovery')
abstract class HostDiscoveryServiceBase extends $grpc.Service {
  $core.String get $name => 'magic_printer.transport.HostDiscovery';

  HostDiscoveryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetHostInfoRequest, $0.GetHostInfoResponse>(
            'GetHostInfo',
            getHostInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetHostInfoRequest.fromBuffer(value),
            ($0.GetHostInfoResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListPrintersRequest, $0.ListPrintersResponse>(
            'ListPrinters',
            listPrinters_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListPrintersRequest.fromBuffer(value),
            ($0.ListPrintersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CheckPermissionRequest,
            $0.CheckPermissionResponse>(
        'CheckPermission',
        checkPermission_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CheckPermissionRequest.fromBuffer(value),
        ($0.CheckPermissionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetHostInfoResponse> getHostInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetHostInfoRequest> $request) async {
    return getHostInfo($call, await $request);
  }

  $async.Future<$0.GetHostInfoResponse> getHostInfo(
      $grpc.ServiceCall call, $0.GetHostInfoRequest request);

  $async.Future<$0.ListPrintersResponse> listPrinters_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListPrintersRequest> $request) async {
    return listPrinters($call, await $request);
  }

  $async.Future<$0.ListPrintersResponse> listPrinters(
      $grpc.ServiceCall call, $0.ListPrintersRequest request);

  $async.Future<$0.CheckPermissionResponse> checkPermission_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CheckPermissionRequest> $request) async {
    return checkPermission($call, await $request);
  }

  $async.Future<$0.CheckPermissionResponse> checkPermission(
      $grpc.ServiceCall call, $0.CheckPermissionRequest request);
}
