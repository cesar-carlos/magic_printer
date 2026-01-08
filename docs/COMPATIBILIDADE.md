# Compatibilidade do Magic Printer

## Visão Geral

Este documento descreve os requisitos de sistema e compatibilidade do Magic Printer.

---

## Sistemas Operacionais Suportados

### Windows Desktop

| Sistema Operacional | Versões Suportadas | Arquitetura | Status |
| ------------------ | ------------------- | ------------ | ------ |
| **Windows 10** | Todas as versões (1507+) | x64 (64 bits) | ✅ Suportado |
| **Windows 11** | Todas as versões | x64 (64 bits) | ✅ Suportado |

### Windows Server

| Sistema Operacional | Versões Suportadas | Arquitetura | Status | Observações |
| ------------------ | ------------------- | ------------ | ------ | ----------- |
| **Windows Server 2012 R2** | Todas as versões | x64 (64 bits) | ✅ Suportado | Requer VC++ Redistributable |
| **Windows Server 2016** | Todas as versões | x64 (64 bits) | ✅ Suportado | Nenhuma |
| **Windows Server 2019** | Todas as versões | x64 (64 bits) | ✅ Suportado | Nenhuma |
| **Windows Server 2022** | Todas as versões | x64 (64 bits) | ✅ Suportado | Nenhuma |

---

## Arquitetura

### Suportado
- ✅ **x64 (64 bits)**

### Não Suportado
- ❌ **x86 (32 bits)**
- ❌ **ARM64**
- ❌ **IA-64 (Itanium)**

---

## Dependências de Runtime

### .NET Runtime (Obrigatório)

#### Windows 10 e Windows 11
- **Versão mínima**: .NET Runtime 8.0
- **Status**: Geralmente pré-instalado
- **Verificação**: `dotnet --list-runtimes`
- **Download**: [https://dotnet.microsoft.com/download/dotnet/8.0](https://dotnet.microsoft.com/download/dotnet/8.0)

#### Windows Server 2012 R2
- **Versão mínima**: .NET Runtime 8.0
- **Requisito adicional**: Microsoft Visual C++ 2015-2019 Redistributable (x64)
- **Status**: Não pré-instalado, deve ser instalado manualmente
- **Download .NET**: [https://dotnet.microsoft.com/download/dotnet/8.0](https://dotnet.microsoft.com/download/dotnet/8.0)
- **Download VC++**: [https://aka.ms/vs/17/release/vc_redist.x64.exe](https://aka.ms/vs/17/release/vc_redist.x64.exe)

> **Nota**: O pacote `win32` e `ffi` do Dart dependem do .NET Runtime para funcionar corretamente no Windows.

---

## Análise de Dependências

### Core / Domain Layer

| Biblioteca | Versão | Finalidade | Compatibilidade | Dependências Específicas |
| ---------- | ------ | ---------- | --------------- | ----------------------- |
| `go_router` | 14.6.2 | Navegação e rotas | ✅ Windows 10+/Server 2012 R2+ | Nenhuma |
| `get_it` | 8.0.3 | Injeção de dependências | ✅ Plataforma independente | Nenhuma |
| `provider` | 6.1.2 | Gerenciamento de estado | ✅ Plataforma independente | Nenhuma |
| `flutter_dotenv` | 5.2.1 | Variáveis de ambiente | ✅ Plataforma independente | Nenhuma |
| `uuid` | 4.5.1 | Geração de IDs | ✅ Plataforma independente | Nenhuma |
| `zard` | 0.0.25 | Validação | ✅ Plataforma independente | Nenhuma |
| `result_dart` | 2.1.1 | Tratamento de erros | ✅ Plataforma independente | Nenhuma |
| `logger` | 2.5.0 | Logging | ✅ Plataforma independente | Nenhuma |

### Infrastructure Layer

| Biblioteca | Versão | Finalidade | Compatibilidade | Requisitos Específicos |
| ---------- | ------ | ---------- | --------------- | --------------------- |
| `win32` | 5.15.0 | API Windows nativa | ✅ Windows 7+ (limitado a 10+/Server 2012 R2+) | Requer .NET Runtime |
| `ffi` | 2.1.5 | Foreign Function Interface | ✅ Windows 7+ (limitado a 10+/Server 2012 R2+) | Requer .NET Runtime |
| `drift` | 2.22.1 | Banco de dados SQLite | ✅ Plataforma independente | Nenhum |
| `sqlite3_flutter_libs` | 0.5.28 | SQLite nativo | ✅ x64 | Apenas x64 |
| `path_provider` | 2.1.5 | Caminhos do sistema | ✅ Windows 10+ | Nenhum |
| `grpc` | 5.1.0 | Cliente/servidor gRPC | ✅ Windows 10+ | Nenhum |
| `protobuf` | 6.0.0 | Serialização Protobuf | ✅ Plataforma independente | Nenhum |
| `fixnum` | 1.1.1 | Números de precisão fixa | ✅ Plataforma independente | Nenhum |
| `crypto` | 3.0.6 | Criptografia | ✅ Plataforma independente | Nenhum |
| `archive` | 3.6.1 | Compressão | ✅ Plataforma independente | Nenhum |

### Presentation Layer

| Biblioteca | Versão | Finalidade | Compatibilidade | Requisitos Específicos |
| ---------- | ------ | ---------- | --------------- | --------------------- |
| `fluent_ui` | 4.13.0 | Interface Fluent Design | ✅ Windows 10+ | Nenhum |
| `window_manager` | 0.5.1 | Gerenciamento de janelas | ✅ Windows 10+ | Nenhum |
| `tray_manager` | 0.5.2 | System tray | ✅ Windows 10+ | Nenhum |

### Outras

| Biblioteca | Versão | Finalidade | Compatibilidade | Requisitos Específicos |
| ---------- | ------ | ---------- | --------------- | --------------------- |
| `mailer` | 6.6.0 | Envio de e-mail SMTP | ✅ Plataforma independente | Requer servidor SMTP configurado |
| `cupertino_icons` | 1.0.8 | Ícones iOS | ✅ Plataforma independente | Não usado no Windows |

---

## Dependências Incompatíveis

As seguintes combinações **não são suportadas**:

- ❌ **x86 (32 bits)**: O projeto é compilado apenas para x64
- ❌ **ARM64**: Não há suporte para arquitetura ARM
- ❌ **Windows 7/8**: Não suportado (limitado a Windows 10+ e Server 2012 R2+)
- ❌ **macOS/Linux**: Não suportado nesta versão (apenas Windows)
- ❌ **Sem .NET Runtime**: O pacote `win32` e `ffi` não funcionam sem o .NET Runtime instalado

---

## Notas de Compatibilidade

### Windows Server 2012 R2

1. **Requisito obrigatório**: Instalar Microsoft Visual C++ 2015-2019 Redistributable (x64)
2. **Link para download**: [https://aka.ms/vs/17/release/vc_redist.x64.exe](https://aka.ms/vs/17/release/vc_redist.x64.exe)
3. **Verificar instalação**: Verificar em "Programas e Recursos" se o redistributable está instalado

### .NET Runtime

1. **Windows 10 e 11**: Geralmente possuem .NET Runtime pré-instalado, mas certifique-se de que a versão seja 8.0 ou superior
2. **Windows Server**: Pode não ter o .NET Runtime instalado, verificar com `dotnet --list-runtimes`
3. **Instalação**: Baixar e instalar o .NET Runtime 8.0 ou superior do site oficial da Microsoft

### Permissões de Administrador

Algumas operações podem exigir execução como administrador:

- Gerenciamento de impressoras (adicionar/remover/configurar)
- Modificação de portas de impressora
- Acesso ao Windows Spooler
- Configuração de firewall (liberar porta 50051)

### Firewall

- A porta padrão do gRPC (50051) deve estar liberada no firewall
- Windows Firewall pode bloquear conexões gRPC por padrão
- Recomenda-se criar uma regra de firewall específica para o Magic Printer

### Redes

- O Magic Printer funciona apenas em redes locais (LAN)
- Não suporta conexões WAN/Internet sem VPN ou relay (planejado para versões futuras)
- Descoberta de hosts via multicast/broadcast pode não funcionar em redes corporativas restritas

---

## Verificação de Compatibilidade

### Verificar Arquitetura

```powershell
# PowerShell
$env:PROCESSOR_ARCHITECTURE
```

Saída esperada: `AMD64` (x64)

### Verificar Versão do Windows

```powershell
# PowerShell
Get-ComputerInfo
```

Procure por `WindowsProductName` e `OsVersion`

### Verificar .NET Runtime

```cmd
# Command Prompt
dotnet --list-runtimes
```

Saída esperada: Deve listar `Microsoft.NETCore.App 8.0.x` ou superior

### Verificar VC++ Redistributable (Server 2012 R2)

```powershell
# PowerShell
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -like "*Visual C++ 2015*"}
```

Ou verificar manualmente em "Painel de Controle" > "Programas e Recursos"

---

## Suporte e Troubleshooting

### Problemas Comuns

#### Erro: "O aplicativo não pode ser iniciado"

**Causa provável**: .NET Runtime não instalado ou versão incorreta

**Solução**: Instalar .NET Runtime 8.0 ou superior

#### Erro: "api-ms-win-crt-runtime-l1-1-0.dll está faltando"

**Causa provável**: Microsoft Visual C++ 2015-2019 Redistributable não instalado (Windows Server 2012 R2)

**Solução**: Instalar VC++ Redistributable x64

#### Erro: "Arquitetura não suportada"

**Causa provável**: Tentando executar em sistema x86 (32 bits)

**Solução**: Instalar versão x64 (64 bits) do Windows

#### Erro: "Conexão gRPC falhou"

**Causa provável**: Firewall bloqueando a porta 50051

**Solução**: Liberar a porta 50051 no firewall do Windows

---

## Recursos Adicionais

- [Download do .NET Runtime 8.0](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Download do Microsoft Visual C++ Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe)
- [Documentação do win32 Dart](https://pub.dev/packages/win32)
- [Documentação do FFI Dart](https://dart.dev/guides/libraries/c-interop)
- [Documentação do Fluent UI](https://pub.dev/packages/fluent_ui)

---

## Contato

Para suporte adicional, consulte:

- 📧 **Email**: suporte@magicprinter.com
- 💬 **Issues**: [GitHub Issues](https://github.com/seu-usuario/magic_printer/issues)
- 📖 **Documentação**: [Documentação Completa](../docs/)

---

**Última atualização**: 2025-01-08
