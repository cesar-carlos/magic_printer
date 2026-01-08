@echo off
REM Script para gerar código Dart a partir dos arquivos .proto
REM Requisitos: protoc instalado (https://github.com/protocolbuffers/protobuf/releases)
REM             dart pub global activate protoc_plugin

echo Gerando código Dart a partir de job_transport.proto...

set PROTO_DIR=%~dp0
set OUT_DIR=%PROTO_DIR%..\lib\infrastructure\grpc\generated

if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

protoc --proto_path=%PROTO_DIR% ^
       --dart_out=grpc:%OUT_DIR% ^
       %PROTO_DIR%job_transport.proto

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Código gerado com sucesso em: %OUT_DIR%
    echo.
    echo Arquivos gerados:
    dir /b "%OUT_DIR%"
) else (
    echo.
    echo ERRO: Falha ao gerar código. Verifique se protoc está instalado.
    echo.
    echo Para instalar:
    echo   1. Baixe protoc de: https://github.com/protocolbuffers/protobuf/releases
    echo   2. Adicione ao PATH
    echo   3. Execute: dart pub global activate protoc_plugin
    echo   4. Adicione ao PATH: %%USERPROFILE%%\AppData\Local\Pub\Cache\bin
)

pause

