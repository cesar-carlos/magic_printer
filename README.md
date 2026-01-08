# 🖨️ Magic Printer

[![Flutter](https://img.shields.io/badge/Flutter-3.10.4-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10.4-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows)](https://www.microsoft.com/windows)

**Magic Printer** é uma solução P2P (peer-to-peer) para compartilhamento de impressoras em rede local (LAN) sem necessidade de servidor central. Cada cliente pode atuar como **Host** (compartilhando impressoras) ou **Guest** (consumindo impressoras remotas), permitindo impressão distribuída e resiliente.

---

## 📋 Índice

- [Características](#-características)
- [Arquitetura](#-arquitetura)
- [Tecnologias](#-tecnologias)
- [Pré-requisitos](#-pré-requisitos)
- [Compatibilidade e Dependências](#-compatibilidade-e-dependências)
- [Instalação](#-instalação)
- [Uso Rápido](#-uso-rápido)
- [Documentação](#-documentação)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Desenvolvimento](#-desenvolvimento)
- [Testes](#-testes)
- [Roadmap](#-roadmap)
- [Contribuindo](#-contribuindo)
- [Licença](#-licença)

---

## ✨ Características

### Funcionalidades Principais

- ✅ **Modo Dual-Role**: Cada instância pode ser Host, Guest ou ambos
- ✅ **Descoberta Automática**: Detecta hosts na LAN via multicast/broadcast
- ✅ **Transporte gRPC**: Comunicação eficiente e robusta entre peers
- ✅ **Windows Integration**: Integração nativa com Windows Spooler via FFI
- ✅ **Autenticação**: Sistema de grupos e permissões por impressora
- ✅ **Persistência Local**: Cache de configurações e histórico (SQLite)
- ✅ **UI Moderna**: Interface Flutter responsiva e intuitiva

### Diferenciais

- 🚀 **P2P Puro**: Sem servidor central, cada nó é autônomo
- 🔒 **Seguro**: TLS/SSL para gRPC + autenticação por grupo
- 📊 **Auditoria**: Log completo de todas as operações
- 🔄 **Resiliente**: Reconexão automática e retry inteligente
- 🎯 **Performance**: Chunks otimizados e compressão de dados

---

## 🏗️ Arquitetura

### Clean Architecture + DDD

```
┌─────────────────────────────────────────────────────┐
│                   Presentation                       │
│        (UI - Flutter Widgets, Pages, Providers)      │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────┴──────────────────────────────────┐
│                   Application                        │
│           (Services, DTOs, Use Cases)                │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────┴──────────────────────────────────┐
│                     Domain                           │
│      (Entities, Value Objects, Repositories)         │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────┴──────────────────────────────────┐
│                Infrastructure                        │
│  (gRPC, Windows FFI, Database, Security, Network)    │
└─────────────────────────────────────────────────────┘
```

### Fluxo de Impressão

```
┌──────────┐     gRPC      ┌──────────┐
│  Guest   │─────────────>│   Host   │
│ (Client) │               │ (Server) │
└──────────┘               └────┬─────┘
                                │
                                │ Windows FFI
                                ▼
                           ┌─────────┐
                           │ Spooler │
                           └─────────┘
                                │
                                ▼
                           [Impressora]
```

**Veja**: `docs/README.md` para mais detalhes

---

## 🛠️ Tecnologias

### Core

- **Flutter** 3.10.4 - Framework multiplataforma
- **Dart** 3.10.4 - Linguagem de programação
- **gRPC** 5.1.0 - Comunicação entre peers
- **Protocol Buffers** 6.0.0 - Serialização de mensagens
- **Windows FFI** - Integração com Win32 API

### Arquitetura

- **Clean Architecture** - Separação de camadas
- **Domain-Driven Design (DDD)** - Modelagem de domínio
- **SOLID Principles** - Princípios de design
- **Result Pattern** - Tratamento funcional de erros

### Principais Dependências

| Biblioteca      | Versão | Finalidade                    |
| --------------- | ------ | ----------------------------- |
| `go_router`     | 14.8.1 | Navegação e rotas             |
| `get_it`        | 8.3.0  | Injeção de dependências       |
| `provider`      | 6.1.0  | Gerenciamento de estado       |
| `dio`           | 5.4.0  | Cliente HTTP/REST             |
| `drift`         | 2.23.0 | Banco de dados local (SQLite) |
| `win32`         | 5.8.0  | API Windows nativa            |
| `grpc`          | 5.1.0  | Cliente/servidor gRPC         |
| `result_dart`   | 2.1.1  | Tratamento de erros           |
| `brasil_fields` | 2.0.0  | Formatação BR                 |
| `uuid`          | 4.3.0  | Geração de IDs únicos         |

**Veja**: `pubspec.yaml` para lista completa

---

## 📦 Pré-requisitos

### Sistema Operacional

#### Sistemas Suportados

- **Windows 10** (qualquer versão) ou **Windows 11**
- **Windows Server 2012 R2** ou superior
  - Windows Server 2016
  - Windows Server 2019
  - Windows Server 2022

#### Arquitetura

- **x64 (64 bits)** apenas
- ❌ Sem suporte para x86 (32 bits) ou ARM64

### Dependências de Runtime

#### .NET Runtime (Obrigatório)

- **Windows 10/11**: .NET Runtime 8.0 ou superior
- **Windows Server 2012 R2**: 
  - .NET Runtime 8.0 ou superior
  - **Microsoft Visual C++ 2015-2019 Redistributable (x64)** - obrigatório

> **Nota**: O pacote `win32` e `ffi` do Dart dependem do .NET Runtime para funcionar corretamente no Windows.

### Ferramentas de Desenvolvimento

- **Flutter SDK** 3.10.4 ou superior
- **Dart SDK** 3.10.4 ou superior
- **Git** para versionamento
- **Visual Studio Code** (recomendado) com extensões:
  - Flutter
  - Dart
  - Cursor Rules (opcional)

### Para Compilação de Protobuf (opcional)

- **protoc** 33.2+ - Protocol Buffer Compiler
- **protoc_plugin** 25.0.0+ - Dart plugin para protoc

> **Nota**: Os stubs gRPC já estão gerados em `lib/infrastructure/grpc/generated/`

---

## 📋 Compatibilidade e Dependências

### Análise de Dependências por Camada

#### Core / Domain Layer

| Biblioteca | Versão | Finalidade | Compatibilidade |
| ---------- | ------ | ---------- | --------------- |
| `go_router` | 14.6.2 | Navegação e rotas | ✅ Windows 10+/Server 2012 R2+ |
| `get_it` | 8.0.3 | Injeção de dependências | ✅ Plataforma independente |
| `provider` | 6.1.2 | Gerenciamento de estado | ✅ Plataforma independente |
| `flutter_dotenv` | 5.2.1 | Variáveis de ambiente | ✅ Plataforma independente |
| `uuid` | 4.5.1 | Geração de IDs | ✅ Plataforma independente |
| `zard` | 0.0.25 | Validação | ✅ Plataforma independente |
| `result_dart` | 2.1.1 | Tratamento de erros | ✅ Plataforma independente |
| `logger` | 2.5.0 | Logging | ✅ Plataforma independente |

#### Infrastructure Layer

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

#### Presentation Layer

| Biblioteca | Versão | Finalidade | Compatibilidade | Requisitos Específicos |
| ---------- | ------ | ---------- | --------------- | --------------------- |
| `fluent_ui` | 4.13.0 | Interface Fluent Design | ✅ Windows 10+ | Nenhum |
| `window_manager` | 0.5.1 | Gerenciamento de janelas | ✅ Windows 10+ | Nenhum |
| `tray_manager` | 0.5.2 | System tray | ✅ Windows 10+ | Nenhum |

#### Outras

| Biblioteca | Versão | Finalidade | Compatibilidade | Requisitos Específicos |
| ---------- | ------ | ---------- | --------------- | --------------------- |
| `mailer` | 6.6.0 | Envio de e-mail SMTP | ✅ Plataforma independente | Requer servidor SMTP configurado |
| `cupertino_icons` | 1.0.8 | Ícones iOS | ✅ Plataforma independente | Não usado no Windows |

### Dependências Incompatíveis

As seguintes combinações **não são suportadas**:

- ❌ **x86 (32 bits)**: O projeto é compilado apenas para x64
- ❌ **ARM64**: Não há suporte para arquitetura ARM
- ❌ **Windows 7/8**: Não suportado (limitado a Windows 10+ e Server 2012 R2+)
- ❌ **macOS/Linux**: Não suportado nesta versão (apenas Windows)
- ❌ **Sem .NET Runtime**: O pacote `win32` e `ffi` não funcionam sem o .NET Runtime instalado

### Notas de Compatibilidade

1. **Windows Server 2012 R2**: Requer instalação adicional do Microsoft Visual C++ 2015-2019 Redistributable (x64)
2. **.NET Runtime**: Windows 10 e 11 já possuem .NET Runtime pré-instalado, mas certifique-se de que a versão seja 8.0 ou superior
3. **Permissões de Administrador**: Algumas operações (como gerenciamento de impressoras) podem exigir execução como administrador
4. **Firewall**: A porta padrão do gRPC (50051) deve estar liberada no firewall

---

---

## 🚀 Instalação

### 1. Clone o Repositório

```bash
git clone https://github.com/seu-usuario/magic_printer.git
cd magic_printer
```

### 2. Instale as Dependências

```bash
flutter pub get
```

### 3. Configure o Ambiente

```bash
# Copie o arquivo .env de exemplo
copy .env.example .env

# Edite .env com suas configurações
notepad .env
```

### 4. Verifique a Instalação

```bash
# Análise de código
flutter analyze

# Deve retornar: No issues found!
```

### 5. Execute a Aplicação

```bash
flutter run -d windows
```

---

## ⚡ Uso Rápido

### Modo Host (Compartilhar Impressoras)

1. **Abra o Magic Printer**
2. **Navegue para "Configurações"**
3. **Ative "Modo Host"**
4. **Selecione impressoras para compartilhar**
5. **Configure grupos e permissões**
6. **Salve e ative o servidor gRPC**

### Modo Guest (Usar Impressoras Remotas)

1. **Abra o Magic Printer**
2. **Navegue para "Catálogo de Impressoras"**
3. **Clique em "Descobrir Hosts"**
4. **Selecione um host disponível**
5. **Autentique (se necessário)**
6. **Imprima normalmente**

**Veja**: `docs/GUIA_RAPIDO.md` para tutorial completo

---

## 📚 Documentação

### Documentação Principal

- 📄 **[docs/README.md](docs/README.md)** - Índice da documentação
- 📄 **[GUIA_RAPIDO.md](docs/GUIA_RAPIDO.md)** - Tutorial de uso
- 📄 **[PLANO_FEATURES_MVP.md](docs/PLANO_FEATURES_MVP.md)** - Plano de features do MVP

### Desenvolvimento

- 📄 **[grpc_stubs_setup.md](docs/grpc_stubs_setup.md)** - Setup de stubs gRPC
- 📄 **[TESTE_GRPC_COMPLETO.md](docs/TESTE_GRPC_COMPLETO.md)** - Testes manuais gRPC
- 📄 **[SPIKE_COMPLETO.md](docs/SPIKE_COMPLETO.md)** - Spike técnico (captura/reinjeção)

### Regras de Código

- 📁 **[.cursor/rules/](.cursor/rules/)** - Regras de arquitetura e estilo

---

## 📁 Estrutura do Projeto

```
magic_printer/
├── lib/
│   ├── domain/                 # Camada de Domínio
│   │   ├── entities/           # Entidades do negócio
│   │   ├── repositories/       # Interfaces de repositórios
│   │   ├── use_cases/          # Casos de uso
│   │   └── value_objects/      # Objetos de valor
│   ├── application/            # Camada de Aplicação
│   │   ├── dtos/               # Data Transfer Objects
│   │   ├── mappers/            # Conversores de dados
│   │   └── services/           # Serviços de aplicação
│   ├── infrastructure/         # Camada de Infraestrutura
│   │   ├── datasources/
│   │   │   └── windows/        # Windows FFI (Spooler)
│   │   ├── grpc/
│   │   │   ├── client/         # Cliente gRPC
│   │   │   ├── server/         # Servidor gRPC
│   │   │   └── generated/      # Stubs Protobuf
│   │   ├── database/           # Drift (SQLite)
│   │   ├── security/           # Autenticação e auditoria
│   │   └── repositories/       # Implementações de repositórios
│   ├── presentation/           # Camada de Apresentação
│   │   ├── providers/          # Providers (estado)
│   │   ├── pages/              # Páginas da UI
│   │   └── widgets/            # Widgets reutilizáveis
│   └── core/                   # Componentes centrais
│       ├── di/                 # Dependency Injection
│       ├── routes/             # Configuração de rotas
│       ├── constants/          # Constantes
│       └── theme/              # Tema da aplicação
├── bin/
│   └── spike_test.dart         # Spike test (CLI)
├── protos/
│   └── job_transport.proto     # Definição Protobuf
├── docs/                       # Documentação
├── test/                       # Testes (a implementar)
├── .cursor/                    # Regras Cursor
├── pubspec.yaml                # Dependências
└── README.md                   # Este arquivo
```

---

## 🔨 Desenvolvimento

### Executar em Modo Debug

```bash
flutter run -d windows
```

### Análise de Código

```bash
flutter analyze
```

### Formatar Código

```bash
dart format .
```

### Compilar Executável

```bash
flutter build windows --release
```

### Gerar Stubs gRPC (se modificar .proto)

```bash
protoc --dart_out=grpc:lib/infrastructure/grpc/generated ^
       -Iprotos ^
       protos/job_transport.proto
```

### Executar Spike Test

```bash
# Compilar
dart compile exe bin/spike_test.dart -o spike_test.exe

# Executar como Admin
.\spike_test.exe list
.\spike_test.exe spool-dir
.\spike_test.exe jobs "Nome da Impressora"
```

**Veja**: `docs/SPIKE_COMPLETO.md` para mais comandos

---

## 🧪 Testes

### Estrutura de Testes (a implementar)

```bash
test/
├── unit/               # Testes unitários
├── widget/             # Testes de widgets
├── integration/        # Testes de integração
└── e2e/                # Testes end-to-end
```

### Executar Testes

```bash
# Todos os testes
flutter test

# Específico
flutter test test/unit/domain/

# Com cobertura
flutter test --coverage
```

> **Nota**: Testes ainda não foram implementados

---

## 🗺️ Roadmap

### ✅ Fase 1: Fundação (Concluída)

- ✅ Arquitetura Clean Architecture + DDD
- ✅ Camadas Domain, Application, Infrastructure, Presentation, Core
- ✅ Integração Windows FFI (Spooler)
- ✅ Cliente e Servidor gRPC funcionais
- ✅ Stubs Protobuf gerados
- ✅ Database (Drift) configurado
- ✅ Sistema de autenticação e auditoria

### 🚧 Fase 2: MVP P2P LAN (Em Andamento)

- ⏸️ Completar spike test (capture/inject .spl/.shd)
- ⏸️ Testar gRPC end-to-end (cliente-servidor)
- ⏸️ Implementar descoberta de hosts (multicast)
- ⏸️ UI completa (catálogo, configurações, histórico)
- ⏸️ Testes automatizados (unit, widget, integration)

### 📅 Fase 3: Produção

- 🔜 TLS/SSL para gRPC
- 🔜 Instalador Windows
- 🔜 Documentação de usuário
- 🔜 Monitoramento e alertas
- 🔜 Release 1.0.0

### 🚀 Futuro

- 💡 Suporte a Linux/macOS
- 💡 Cloud sync opcional
- 💡 App mobile (Android/iOS) como Guest
- 💡 Dashboard web de administração

**Veja**: `docs/PLANO_FEATURES_MVP.md` para detalhes

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor:

1. **Fork** o repositório
2. **Crie** uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. **Push** para a branch (`git push origin feature/AmazingFeature`)
5. **Abra** um Pull Request

### Diretrizes de Código

- Siga as regras em `.cursor/rules/`
- Execute `flutter analyze` antes de commitar
- Documente apenas quando necessário (código autoexplicativo)
- Use nomenclatura clara e descritiva
- Siga princípios SOLID

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

## 👥 Autores

- **Equipe de Desenvolvimento** - [Magic Printer Team](https://github.com/magic-printer)

---

## 🙏 Agradecimentos

- **Flutter Team** - Framework incrível
- **gRPC Team** - Protocolo robusto
- **Dart Team** - Linguagem moderna
- **Comunidade Open Source** - Inspiração e suporte

---

## 📞 Suporte

- 📧 **Email**: suporte@magicprinter.com
- 💬 **Issues**: [GitHub Issues](https://github.com/seu-usuario/magic_printer/issues)
- 📖 **Docs**: [Documentação Completa](docs/)

---

**Made with ❤️ by Magic Printer Team**

---

## 🔗 Links Úteis

- [Flutter Documentation](https://docs.flutter.dev/)
- [gRPC Documentation](https://grpc.io/docs/)
- [Protocol Buffers](https://protobuf.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Domain-Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)
