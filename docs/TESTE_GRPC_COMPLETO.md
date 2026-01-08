# 🧪 Magic Printer - Teste gRPC Completo

**Objetivo**: Validar comunicação gRPC end-to-end entre Cliente e Servidor

**Tempo estimado**: 30-45 minutos

---

## 📋 Índice

1. [Pré-requisitos](#1-pré-requisitos)
2. [Preparação do Ambiente](#2-preparação-do-ambiente)
3. [Teste 1: Servidor Standalone](#3-teste-1-servidor-standalone)
4. [Teste 2: Cliente-Servidor Local](#4-teste-2-cliente-servidor-local)
5. [Teste 3: Cliente-Servidor Rede](#5-teste-3-cliente-servidor-rede)
6. [Validação de Resultados](#6-validação-de-resultados)
7. [Troubleshooting](#7-troubleshooting)

---

## 1. Pré-requisitos

### ✅ Verificações Iniciais

```bash
# Compilação limpa
flutter analyze
# Deve retornar: No issues found!

# Dependências atualizadas
flutter pub get

# Stubs gRPC gerados
dir lib\infrastructure\grpc\generated\*.pb*.dart
# Deve listar: job_transport.pb.dart, .pbenum.dart, .pbgrpc.dart, .pbjson.dart
```

### 📦 Materiais Necessários

- ✅ 2 máquinas Windows (ou 1 máquina com 2 instâncias)
- ✅ Mesma rede local (LAN)
- ✅ Porta `50051` liberada no firewall
- ✅ Impressora configurada (física ou virtual)

---

## 2. Preparação do Ambiente

### 2.1. Liberar Porta no Firewall

**Máquina Host (Servidor)**:

```powershell
# Execute como Administrador
New-NetFirewallRule `
  -DisplayName "Magic Printer gRPC" `
  -Direction Inbound `
  -LocalPort 50051 `
  -Protocol TCP `
  -Action Allow
```

**Verificar regra**:

```powershell
Get-NetFirewallRule -DisplayName "Magic Printer gRPC"
```

### 2.2. Descobrir IP Local

```powershell
# Host (Servidor)
ipconfig

# Anote o IP local (ex: 192.168.1.100)
```

### 2.3. Configurar .env

**Host (Servidor)** - `.env`:

```env
GRPC_SERVER_HOST=0.0.0.0
GRPC_SERVER_PORT=50051
GRPC_ENABLE_TLS=false
```

**Guest (Cliente)** - `.env`:

```env
GRPC_DEFAULT_HOST=192.168.1.100
GRPC_DEFAULT_PORT=50051
GRPC_ENABLE_TLS=false
```

---

## 3. Teste 1: Servidor Standalone

**Objetivo**: Validar que o servidor gRPC inicia corretamente

### 3.1. Criar Script de Teste

**`test/manual/grpc_server_test.dart`**:

```dart
import 'package:magic_printer/infrastructure/grpc/server/grpc_server.dart';
import 'package:magic_printer/infrastructure/grpc/server/job_transport_service.dart';
import 'package:magic_printer/infrastructure/grpc/server/host_discovery_service.dart';

void main() async {
  print('🚀 Iniciando servidor gRPC de teste...');

  final server = GrpcServer(
    host: '0.0.0.0',
    port: 50051,
  );

  try {
    await server.start();
    print('✅ Servidor iniciado em ${server.host}:${server.port}');
    print('🔊 Aguardando conexões...');
    print('⏹️  Pressione Ctrl+C para parar');

    // Manter servidor ativo
    await Future.delayed(Duration(hours: 24));
  } catch (e) {
    print('❌ Erro ao iniciar servidor: $e');
  }
}
```

### 3.2. Executar Servidor

```bash
# Terminal 1 (Host)
dart test/manual/grpc_server_test.dart
```

**Saída esperada**:

```
🚀 Iniciando servidor gRPC de teste...
✅ Servidor iniciado em 0.0.0.0:50051
🔊 Aguardando conexões...
⏹️  Pressione Ctrl+C para parar
```

### 3.3. Verificar Porta Aberta

```bash
# Terminal 2
netstat -ano | findstr :50051
```

**Saída esperada**:

```
TCP    0.0.0.0:50051          0.0.0.0:0              LISTENING       12345
```

✅ **Teste 1 aprovado!** Servidor está ativo e escutando.

---

## 4. Teste 2: Cliente-Servidor Local

**Objetivo**: Validar comunicação gRPC na mesma máquina

### 4.1. Criar Script de Cliente

**`test/manual/grpc_client_test.dart`**:

```dart
import 'package:magic_printer/infrastructure/grpc/client/job_transport_client.dart';
import 'package:magic_printer/infrastructure/grpc/client/host_discovery_client.dart';

void main() async {
  print('🔌 Conectando ao servidor gRPC...');

  final client = JobTransportClient(
    host: 'localhost',
    port: 50051,
  );

  try {
    await client.connect();
    print('✅ Conectado com sucesso!');

    // Teste 1: Host Info
    print('\n📡 Teste 1: Obter informações do host...');
    final hostInfo = await HostDiscoveryClient(
      host: 'localhost',
      port: 50051,
    ).getHostInfo();

    hostInfo.fold(
      (info) {
        print('✅ Host Info:');
        print('   - Nome: ${info.hostname}');
        print('   - IP: ${info.ipAddress}');
        print('   - Impressoras: ${info.availablePrinters}');
      },
      (error) => print('❌ Erro: $error'),
    );

    // Teste 2: Listar Impressoras
    print('\n🖨️  Teste 2: Listar impressoras...');
    final printers = await HostDiscoveryClient(
      host: 'localhost',
      port: 50051,
    ).listPrinters();

    printers.fold(
      (list) {
        print('✅ Impressoras disponíveis: ${list.length}');
        for (var printer in list) {
          print('   - ${printer.name} (${printer.status})');
        }
      },
      (error) => print('❌ Erro: $error'),
    );

    // Teste 3: Enviar Job Simulado
    print('\n📄 Teste 3: Enviar job de teste...');
    final jobId = 'TEST-JOB-001';
    final result = await client.sendJob(
      jobId: jobId,
      printerName: 'Microsoft Print to PDF',
      jobData: [72, 101, 108, 108, 111], // "Hello"
    );

    result.fold(
      (_) => print('✅ Job enviado com sucesso!'),
      (error) => print('❌ Erro: $error'),
    );

    await client.disconnect();
    print('\n✅ Todos os testes concluídos!');
  } catch (e) {
    print('❌ Erro na conexão: $e');
  }
}
```

### 4.2. Executar Teste

**Terminal 1** (mantém servidor rodando):

```bash
dart test/manual/grpc_server_test.dart
```

**Terminal 2** (executa cliente):

```bash
dart test/manual/grpc_client_test.dart
```

### 4.3. Saída Esperada

**Terminal 2 (Cliente)**:

```
🔌 Conectando ao servidor gRPC...
✅ Conectado com sucesso!

📡 Teste 1: Obter informações do host...
✅ Host Info:
   - Nome: DESKTOP-ABC123
   - IP: 192.168.1.100
   - Impressoras: 2

🖨️  Teste 2: Listar impressoras...
✅ Impressoras disponíveis: 2
   - Microsoft Print to PDF (Online)
   - HP LaserJet Pro (Online)

📄 Teste 3: Enviar job de teste...
✅ Job enviado com sucesso!

✅ Todos os testes concluídos!
```

**Terminal 1 (Servidor)**:

```
🔊 Conexão recebida de 127.0.0.1
📡 getHostInfo() chamado
🖨️  listPrinters() chamado
📄 beginJob() - JOB ID: TEST-JOB-001
✅ Job recebido com sucesso
```

✅ **Teste 2 aprovado!** Cliente e servidor se comunicam localmente.

---

## 5. Teste 3: Cliente-Servidor Rede

**Objetivo**: Validar comunicação gRPC entre máquinas diferentes na LAN

### 5.1. Configurar Máquina Host

**Máquina 1 (Host/Servidor)**:

1. Configure `.env`:

   ```env
   GRPC_SERVER_HOST=0.0.0.0
   GRPC_SERVER_PORT=50051
   ```

2. Execute servidor:

   ```bash
   dart test/manual/grpc_server_test.dart
   ```

3. Anote o IP local:
   ```bash
   ipconfig
   # Ex: 192.168.1.100
   ```

### 5.2. Configurar Máquina Guest

**Máquina 2 (Guest/Cliente)**:

1. Configure `.env`:

   ```env
   GRPC_DEFAULT_HOST=192.168.1.100
   GRPC_DEFAULT_PORT=50051
   ```

2. Modifique `grpc_client_test.dart`:

   ```dart
   final client = JobTransportClient(
     host: '192.168.1.100',  // IP do host
     port: 50051,
   );
   ```

3. Execute cliente:
   ```bash
   dart test/manual/grpc_client_test.dart
   ```

### 5.3. Validação

**Se tudo funcionar**:

- ✅ Cliente se conecta ao servidor remoto
- ✅ Servidor recebe requisições do cliente remoto
- ✅ Dados são trocados corretamente

✅ **Teste 3 aprovado!** Comunicação na LAN funciona.

---

## 6. Validação de Resultados

### ✅ Checklist de Sucesso

| Teste                     | Validação                  | Status |
| ------------------------- | -------------------------- | ------ |
| Servidor inicia           | Porta 50051 aberta         | ⬜     |
| Servidor escuta           | `netstat` mostra LISTENING | ⬜     |
| Cliente conecta (local)   | Sem erros de conexão       | ⬜     |
| `getHostInfo()` funciona  | Retorna dados do host      | ⬜     |
| `listPrinters()` funciona | Lista impressoras          | ⬜     |
| `beginJob()` funciona     | Job é recebido             | ⬜     |
| Cliente conecta (rede)    | Conexão remota OK          | ⬜     |
| Dados transportados       | Job completo recebido      | ⬜     |

### 📊 Métricas Esperadas

- **Latência**: < 100ms (LAN)
- **Throughput**: > 10 MB/s para chunks
- **Taxa de erro**: 0%
- **Reconexão**: < 5s em caso de falha

---

## 7. Troubleshooting

### ❌ "Erro: Failed to connect to server"

**Causa**: Servidor não está ativo ou porta bloqueada

**Solução**:

```bash
# Verificar se servidor está rodando
netstat -ano | findstr :50051

# Verificar firewall
Get-NetFirewallRule -DisplayName "Magic Printer gRPC"

# Reiniciar servidor
dart test/manual/grpc_server_test.dart
```

### ❌ "Erro: Connection refused"

**Causa**: IP/porta incorretos ou firewall bloqueando

**Solução**:

1. Confirme IP do host: `ipconfig`
2. Teste ping: `ping 192.168.1.100`
3. Teste telnet: `telnet 192.168.1.100 50051`
4. Se telnet falha, libere porta no firewall

### ❌ "Erro: RPC failed with status UNAVAILABLE"

**Causa**: Servidor caiu ou rede instável

**Solução**:

1. Verifique se servidor ainda está rodando
2. Verifique logs do servidor
3. Reinicie servidor e tente novamente

### ❌ "Erro: PERMISSION_DENIED"

**Causa**: Problema de autenticação

**Solução**:

1. Verifique credenciais no `.env`
2. Confirme que autenticação está desabilitada para testes
3. Verifique logs de autenticação no servidor

---

## 📝 Logs de Teste

### Template para Documentar Resultados

```markdown
## Teste Realizado em: [DATA]

### Ambiente

- Host OS: Windows 11
- Guest OS: Windows 10
- Rede: LAN 192.168.1.x
- Firewall: Porta 50051 liberada

### Resultados

- ✅ Servidor iniciou: SIM
- ✅ Cliente conectou (local): SIM
- ✅ Cliente conectou (rede): SIM
- ✅ Jobs transportados: SIM
- ❌ Erros encontrados: NENHUM

### Métricas

- Latência média: 45ms
- Throughput: 12 MB/s
- Taxa de sucesso: 100%

### Observações

- Todos os testes passaram
- Pronto para produção
```

---

## 🎯 Próximos Passos

Após validar gRPC:

1. ✅ **Teste completo do spike** (capture/inject)
2. ✅ **Integração com UI** (Flutter pages)
3. ✅ **Testes automatizados** (unit + integration)
4. ✅ **TLS/SSL** (produção)

---

## 📚 Referências

- [gRPC Documentation](https://grpc.io/docs/)
- [grpc-dart Package](https://pub.dev/packages/grpc)
- [README.md (docs)](README.md)
- [README.md (docs)](README.md)

---

**Bons testes! 🧪✨**
