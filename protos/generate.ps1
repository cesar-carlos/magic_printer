# Script PowerShell para gerar código Dart a partir dos arquivos .proto
# Requisitos: protoc instalado (https://github.com/protocolbuffers/protobuf/releases)
#             dart pub global activate protoc_plugin

$ErrorActionPreference = "Stop"

$ProtoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$OutDir = Join-Path $ProtoDir "..\lib\infrastructure\grpc\generated"

Write-Host "Gerando código Dart a partir de job_transport.proto..." -ForegroundColor Cyan

# Criar diretório de saída se não existir
if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
}

try {
    # Gerar código Dart
    & protoc --proto_path="$ProtoDir" `
             --dart_out="grpc:$OutDir" `
             "$ProtoDir\job_transport.proto"

    Write-Host ""
    Write-Host "Código gerado com sucesso!" -ForegroundColor Green
    Write-Host "Diretório: $OutDir" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Arquivos gerados:" -ForegroundColor Yellow
    Get-ChildItem $OutDir | ForEach-Object { Write-Host "  - $($_.Name)" }
}
catch {
    Write-Host ""
    Write-Host "ERRO: Falha ao gerar código." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Write-Host "Para instalar as dependências:" -ForegroundColor Yellow
    Write-Host "  1. Baixe protoc de: https://github.com/protocolbuffers/protobuf/releases"
    Write-Host "  2. Adicione ao PATH"
    Write-Host "  3. Execute: dart pub global activate protoc_plugin"
    Write-Host "  4. Adicione ao PATH: `$env:USERPROFILE\AppData\Local\Pub\Cache\bin"
}

