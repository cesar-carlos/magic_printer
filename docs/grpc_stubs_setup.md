# Setup de Stubs gRPC (Regenerar)

Este projeto usa **stubs gerados** a partir de `protos/job_transport.proto`.

## Pré-requisitos

1. Instalar `protoc` e adicionar ao PATH:
   - `https://github.com/protocolbuffers/protobuf/releases`
2. Instalar o plugin Dart:

```bash
dart pub global activate protoc_plugin
```

3. Garantir que o PATH inclua:
   - Windows: `%USERPROFILE%\AppData\Local\Pub\Cache\bin`

## Gerar stubs

Na raiz do projeto:

```bash
protoc --dart_out=grpc:lib/infrastructure/grpc/generated ^
       -Iprotos ^
       protos/job_transport.proto
```

Arquivos esperados em `lib/infrastructure/grpc/generated/`:

- `job_transport.pb.dart`
- `job_transport.pbenum.dart`
- `job_transport.pbgrpc.dart`
- `job_transport.pbjson.dart`

## Validar

```bash
flutter analyze
```

## Quando usar

- Sempre que `protos/job_transport.proto` for alterado.


