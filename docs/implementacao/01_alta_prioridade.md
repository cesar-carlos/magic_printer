# Plano de Implementação - Alta Prioridade

**Versão**: 1.0.0  
**Status**: 📋 Planejado  
**Última atualização**: 09 de janeiro de 2026

---

## 🎯 Visão Geral

Este documento detalha as funcionalidades de **ALTA PRIORIDADE** que devem ser implementadas para transformar o Magic Printer em um sistema completo de gerenciamento de impressoras.

**Foco Principal**: Dashboard centralizado com métricas em tempo real como página inicial do sistema.

---

## 📊 1. Dashboard Centralizado (Página Inicial)

### Descrição

Desenvolver um dashboard que servirá como página inicial do sistema, exibindo métricas em tempo real das impressoras e filas de impressão. O dashboard deve ser a primeira tela que o usuário vê ao abrir o aplicativo.

### KPIs a Implementar

#### KPIs Essenciais (Must Have)

1. **Status das Impressoras**

   - Total de impressoras: online, offline, em erro, pausadas
   - Gráfico de barras ou pie chart com distribuição
   - Atualização em tempo real

2. **Métricas da Fila de Impressão**

   - Jobs pendentes: total, aguardando, imprimindo
   - Taxa de conclusão: sucesso vs falha
   - Jobs completados nas últimas 24h/7d/30d

3. **Hosts Conectados**

   - Total de hosts: online, offline
   - Lista com status de cada host
   - Última atualização

4. **Alertas Ativos**
   - Contador de alertas não resolvidos
   - Categorização por tipo: crítico, aviso, info
   - Link para página de logs/alertas

#### KPIs Avançados (Nice to Have)

5. **Métricas de Uso por Impressora**

   - Gráfico de uso (número de jobs por dia/semana)
   - Top 5 impressoras mais usadas
   - Top 5 impressoras com mais erros

6. **Métricas de Performance**

   - Tempo médio de conclusão de jobs
   - Taxa de sucesso por impressora
   - Volume de dados impressos (MB/GB)

7. **Tendências**
   - Gráfico de uso ao longo do tempo
   - Previsão de necessidade de suprimentos (se implementado)
   - Detecção de padrões anormais

### Arquitetura do Dashboard

```
┌─────────────────────────────────────────────────────────┐
│                 HEADER (Filtros Globais)               │
│  [Últimas 24h] [Última Semana] [Último Mês] [Todo] │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐      │
│ │  IMPRESSORAS│ │    FILA     │ │    HOSTS    │      │
│ │  12 total   │ │  8 jobs     │ │  5 hosts    │      │
│ │  10 online  │ │  5 pending  │ │  4 online   │      │
│ │   2 offline │ │  2 printing │ │  1 offline  │      │
│ │   0 error   │ │  1 failed   │ │             │      │
│ └─────────────┘ └─────────────┘ └─────────────┘      │
├─────────────────────────────────────────────────────────┤
│              GRÁFICOS DE TENDÊNCIA                     │
│  ┌─────────────────────────────────────────────────┐   │
│  │  Uso de Impressoras (últimos 7 dias)          │   │
│  │  [Gráfico de linha com pontos]                │   │
│  └─────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────┤
│             LISTA DE IMPRESSORAS (Cards)              │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐             │
│  │ PRINTER1 │ │ PRINTER2 │ │ PRINTER3 │             │
│  │  Online  │ │  Error   │ │  Paused  │             │
│  │  5 jobs  │ │  0 jobs  │ │  2 jobs  │             │
│  └──────────┘ └──────────┘ └──────────┘             │
├─────────────────────────────────────────────────────────┤
│                ALERTAS RECENTES                        │
│  • [10:30] PRINTER2 offline                            │
│  • [09:15] JOB #1234 failed (erro toner)             │
└─────────────────────────────────────────────────────────┘
```

### Tarefas de Implementação

#### Phase 1: Estrutura e UI Básica

- [x] Criar `DashboardPage` em `lib/presentation/pages/dashboard_page.dart`
- [ ] Criar `DashboardProvider` em `lib/presentation/providers/dashboard_provider.dart`
- [ ] Definir layout responsivo com Fluent UI
- [ ] Implementar cards de KPIs principais (impressoras, fila, hosts)
- [ ] Adicionar filtros de período (24h, 7d, 30d, todo)
- [ ] Implementar atualização automática a cada 30 segundos

#### Phase 2: Coleta de Dados

- [ ] Criar `DashboardMetricsService` em `lib/application/services/dashboard_metrics_service.dart`
- [ ] Implementar método `getPrintersMetrics()` - status, distribuição
- [ ] Implementar método `getQueueMetrics()` - jobs pendentes, concluídos, falhados
- [ ] Implementar método `getHostsMetrics()` - hosts online/offline
- [ ] Implementar método `getActiveAlerts()` - alertas não resolvidos
- [ ] Implementar método `getUsageTrends()` - dados para gráficos
- [ ] Implementar método `getPerformanceMetrics()` - tempo médio, taxa sucesso

#### Phase 3: Visualizações e Gráficos

- [ ] Implementar gráfico de distribuição de status das impressoras (Pie Chart)
- [ ] Implementar gráfico de tendência de uso (Line Chart)
- [ ] Implementar lista de impressoras com cards
- [ ] Implementar seção de alertas recentes
- [ ] Adicionar animações suaves para atualizações

#### Phase 4: Integração e Roteamento

- [ ] Atualizar `lib/core/routes/app_router.dart` - definir `/` como dashboard
- [ ] Atualizar `lib/presentation/widgets/app_shell.dart` - sidebar navigation
- [ ] Configurar auto-refresh com StreamBuilder
- [ ] Implementar caching para evitar recarregamentos excessivos

#### Phase 5: Testes e Polimento

- [ ] Testes unitários do `DashboardMetricsService`
- [ ] Testes de widgets do dashboard
- [ ] Testes de integração com providers
- [ ] Testes de performance (renderização com muitos dados)
- [ ] Testes de atualização em tempo real
- [ ] Otimização de performance (lazy loading, virtualização)

### Arquivos a Criar

```
lib/presentation/pages/dashboard_page.dart          (novo)
lib/presentation/providers/dashboard_provider.dart   (novo)
lib/application/services/dashboard_metrics_service.dart (novo)
lib/application/dtos/metrics_dto.dart                 (novo)
lib/shared/widgets/dashboard_kpi_card.dart            (novo)
lib/shared/widgets/dashboard_chart.dart                (novo)
lib/shared/widgets/dashboard_printer_card.dart         (novo)
```

### Arquivos a Modificar

```
lib/core/routes/app_router.dart         - Adicionar rota `/` para dashboard
lib/presentation/widgets/app_shell.dart  - Atualizar navegação
lib/presentation/pages/home_page.dart    - Mover funcionalidade para dashboard
```

### Estrutura de Dados

```dart
// application/dtos/metrics_dto.dart

class DashboardMetrics {
  final PrinterMetrics printers;
  final QueueMetrics queue;
  final HostMetrics hosts;
  final List<Alert> activeAlerts;
  final DateTime lastUpdated;
}

class PrinterMetrics {
  final int total;
  final int online;
  final int offline;
  final int error;
  final int paused;
  final int printing;
}

class QueueMetrics {
  final int pending;
  final int printing;
  final int failed;
  final int completed24h;
  final int completed7d;
  final int completed30d;
}

class HostMetrics {
  final int total;
  final int online;
  final int offline;
  final List<HostStatus> hosts;
}

class UsageTrend {
  final DateTime date;
  final int totalJobs;
  final int successJobs;
  final int failedJobs;
}

class Alert {
  final String id;
  final AppLogLevel level;
  final String message;
  final DateTime timestamp;
  final String? printerId;
  final String? hostId;
}
```

### Critérios de Aceite

- ✅ Dashboard é a página inicial ao abrir o aplicativo
- ✅ KPIs principais são exibidos corretamente
- ✅ Dados são atualizados automaticamente a cada 30s
- ✅ Gráficos funcionam e são interativos
- ✅ Filtros de período funcionam
- ✅ Performance aceitável (<100ms para carregar)
- ✅ Responsivo em diferentes tamanhos de tela
- ✅ Acessível (leitor de tela, keyboard navigation)

---

## 📋 2. Coleta de Dados Adicionais para Relatórios

### Descrição

Expandir a coleta de dados para permitir relatórios mais detalhados e análise de tendências. Algumas informações já são coletadas mas precisam ser melhoradas.

### Dados Atuais vs Dados Necessários

#### ✅ Dados Já Coletados

**PrintJob:**

- ✅ documentName
- ✅ printerName
- ✅ hostId
- ✅ status
- ✅ totalSize, sentBytes, totalChunks, sentChunks
- ✅ totalPages, printedPages
- ✅ createdAt, startedAt, completedAt
- ✅ errorCode, errorMessage

**AppLog:**

- ✅ level, category, title, message, details
- ✅ printerId, hostId, jobId
- ✅ createdAt

**Printer:**

- ✅ name, alias, hostId
- ✅ status (online, offline, error, paused, printing)
- ✅ jobCount
- ✅ lastSeen

**Host:**

- ✅ name, address
- ✅ status (online, offline, connecting, error)
- ✅ lastSeen, supportedFeatures, version

#### ❌ Dados Faltantes

**Para PrintJob:**

- ❌ userId - Quem enviou o job
- ❌ username - Nome do usuário (para relatórios)
- ❌ documentType - Tipo de documento (PDF, Word, imagem, etc.)
- ❌ department - Departamento/área do usuário
- ❌ estimatedCost - Custo estimado (se houver política de custo)

**Para Printer:**

- ❌ totalPagesCounter - Contador total de páginas (durabilidade)
- ❌ tonerLevel - Nível de toner (0-100%)
- ❌ paperLevel - Nível de papel (estimativa)
- ❌ lastMaintenanceDate - Data da última manutenção
- ❌ maintenanceHistory - Histórico de manutenções

**Para Host:**

- ❌ totalJobsProcessed - Total de jobs processados
- ❌ uptimePercentage - Percentual de tempo online
- ❌ version - Já existe, mas não sendo usado

### Novas Tabelas do Banco de Dados

#### Tabela: Users (Usuários Locais)

```dart
@DataClassName('UserData')
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get displayName => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get email => text().nullable()();
  ListColumn<String> get groupIds => text().map(const StringConverter()).nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastSeen => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Tabela: PrinterSupplies (Níveis de Suprimentos)

```dart
@DataClassName('PrinterSupplyData')
class PrinterSupplies extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  TextColumn get supplyType => text()(); // 'toner', 'paper', 'ink', etc.
  IntColumn get level => integer()(); // 0-100
  TextColumn get unit => text()(); // '%', 'sheets', 'ml'
  DateTimeColumn get lastChecked => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Tabela: PrinterMaintenance (Histórico de Manutenção)

```dart
@DataClassName('PrinterMaintenanceData')
class PrinterMaintenances extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  TextColumn get maintenanceType => text()(); // 'cleaning', 'toner_change', 'repair', etc.
  TextColumn get description => text().nullable()();
  TextColumn get performedBy => text().nullable()(); // userId ou username
  DateTimeColumn get performedAt => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
```

#### Tabela: PrinterCounters (Contadores de Impressão)

```dart
@DataClassName('PrinterCounterData')
class PrinterCounters extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  IntColumn get totalPagesPrinted => integer().withDefault(const Constant(0))();
  IntColumn get totalJobsProcessed => integer().withDefault(const Constant(0))();
  IntColumn get totalBytesPrinted => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastReset => dateTime().nullable()(); // Quando os contadores foram zerados

  @override
  Set<Column> get primaryKey => {printerId};
}
```

### Modificações em Tabelas Existentes

#### Tabela: Jobs

**Adicionar colunas:**

```dart
TextColumn get userId => text().nullable()();
TextColumn get username => text().nullable()();
TextColumn get documentType => text().nullable()();
TextColumn get department => text().nullable()();
TextColumn get estimatedCost => integer().nullable()(); // em centavos
```

#### Tabela: Printers

**Adicionar colunas:**

```dart
IntColumn get totalPagesPrinted => integer().withDefault(const Constant(0))();
TextColumn get tonerLevel => text().withDefault(const Constant('unknown'))();
TextColumn get paperLevel => text().withDefault(const Constant('unknown'))();
DateTimeColumn get lastMaintenanceDate => dateTime().nullable()();
```

### Entidades do Domínio

#### Entidade User

```dart
// domain/entities/user.dart

class User {
  final String id;
  final String username;
  final String? displayName;
  final String? department;
  final String? email;
  final List<String> groupIds;
  final DateTime createdAt;
  final DateTime? lastSeen;

  const User({
    required this.id,
    required this.username,
    this.displayName,
    this.department,
    this.email,
    this.groupIds = const [],
    required this.createdAt,
    this.lastSeen,
  });

  User copyWith({
    String? id,
    String? username,
    String? displayName,
    String? department,
    String? email,
    List<String>? groupIds,
    DateTime? createdAt,
    DateTime? lastSeen,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      department: department ?? this.department,
      email: email ?? this.email,
      groupIds: groupIds ?? this.groupIds,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is User && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'User($username)';
}
```

#### Entidade PrinterSupply

```dart
// domain/entities/printer_supply.dart

enum SupplyType {
  toner,
  ink,
  paper,
  drum,
  fuser,
  other,
}

class PrinterSupply {
  final String id;
  final String printerId;
  final SupplyType type;
  final int level; // 0-100
  final String unit; // '%', 'sheets', 'ml'
  final DateTime lastChecked;

  const PrinterSupply({
    required this.id,
    required this.printerId,
    required this.type,
    required this.level,
    required this.unit,
    required this.lastChecked,
  });

  bool get isLow => level < 20;
  bool get isCritical => level < 10;

  PrinterSupply copyWith({
    String? id,
    String? printerId,
    SupplyType? type,
    int? level,
    String? unit,
    DateTime? lastChecked,
  }) {
    return PrinterSupply(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      type: type ?? this.type,
      level: level ?? this.level,
      unit: unit ?? this.unit,
      lastChecked: lastChecked ?? this.lastChecked,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PrinterSupply && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'PrinterSupply($printerId, $type: $level$unit)';
}
```

#### Entidade PrinterMaintenance

```dart
// domain/entities/printer_maintenance.dart

enum MaintenanceType {
  cleaning,
  tonerChange,
  inkChange,
  paperRefill,
  repair,
  replacement,
  other,
}

class PrinterMaintenance {
  final String id;
  final String printerId;
  final MaintenanceType type;
  final String? description;
  final String? performedBy;
  final DateTime performedAt;
  final String? notes;

  const PrinterMaintenance({
    required this.id,
    required this.printerId,
    required this.type,
    this.description,
    this.performedBy,
    required this.performedAt,
    this.notes,
  });

  PrinterMaintenance copyWith({
    String? id,
    String? printerId,
    MaintenanceType? type,
    String? description,
    String? performedBy,
    DateTime? performedAt,
    String? notes,
  }) {
    return PrinterMaintenance(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      type: type ?? this.type,
      description: description ?? this.description,
      performedBy: performedBy ?? this.performedBy,
      performedAt: performedAt ?? this.performedAt,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PrinterMaintenance && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'PrinterMaintenance($printerId, $type at $performedAt)';
}
```

### Repositories Interfaces

```dart
// domain/repositories/i_user_repository.dart

import 'package:result_dart/result_dart.dart';
import '../entities/user.dart';

abstract class IUserRepository {
  Future<Result<List<User>>> getAll();

  Future<Result<User>> getById(String id);

  Future<Result<User>> getByUsername(String username);

  Future<Result<User>> create(User user);

  Future<Result<User>> update(User user);

  Future<Result<Unit>> delete(String id);

  Future<Result<List<User>>> getByDepartment(String department);

  Future<Result<Unit>> updateLastSeen(String userId);
}
```

```dart
// domain/repositories/i_printer_supply_repository.dart

import 'package:result_dart/result_dart.dart';
import '../entities/printer_supply.dart';

abstract class IPrinterSupplyRepository {
  Future<Result<List<PrinterSupply>>> getAll();

  Future<Result<List<PrinterSupply>>> getByPrinterId(String printerId);

  Future<Result<PrinterSupply>> getById(String id);

  Future<Result<PrinterSupply>> create(PrinterSupply supply);

  Future<Result<PrinterSupply>> update(PrinterSupply supply);

  Future<Result<Unit>> delete(String id);

  Future<Result<List<PrinterSupply>>> getLowSupplies({int threshold = 20});

  Future<Result<List<PrinterSupply>>> getCriticalSupplies({int threshold = 10});
}
```

```dart
// domain/repositories/i_printer_maintenance_repository.dart

import 'package:result_dart/result_dart.dart';
import '../entities/printer_maintenance.dart';

abstract class IPrinterMaintenanceRepository {
  Future<Result<List<PrinterMaintenance>>> getAll();

  Future<Result<List<PrinterMaintenance>>> getByPrinterId(String printerId);

  Future<Result<PrinterMaintenance>> getById(String id);

  Future<Result<PrinterMaintenance>> create(PrinterMaintenance maintenance);

  Future<Result<PrinterMaintenance>> update(PrinterMaintenance maintenance);

  Future<Result<Unit>> delete(String id);

  Future<Result<List<PrinterMaintenance>>> getRecentMaintenance({
    String? printerId,
    int limit = 50,
  });

  Future<Result<List<PrinterMaintenance>>> getByType({
    required MaintenanceType type,
    String? printerId,
  });
}
```

### Serviços do Domínio

```dart
// domain/services/i_user_service.dart

import 'package:result_dart/result_dart.dart';

abstract class IUserService {
  Future<Result<User>> getCurrentUser();

  Future<Result<List<User>>> getAllUsers();

  Future<Result<Unit>> syncWithWindowsUsers();

  Future<Result<User>> createOrUpdateUser({
    required String username,
    String? displayName,
    String? department,
    String? email,
  });
}
```

### Migrações do Banco de Dados

```dart
// infrastructure/database/migrations/add_user_table.dart
// infrastructure/database/migrations/add_printer_supplies_table.dart
// infrastructure/database/migrations/add_printer_maintenance_table.dart
// infrastructure/database/migrations/update_jobs_table.dart
// infrastructure/database/migrations/update_printers_table.dart
```

### Tarefas de Implementação

#### Phase 1: Modelos e Entidades

- [ ] Criar entidade `User` em `domain/entities/user.dart`
- [ ] Criar entidade `PrinterSupply` em `domain/entities/printer_supply.dart`
- [ ] Criar entidade `PrinterMaintenance` em `domain/entities/printer_maintenance.dart`
- [ ] Criar DTOs relacionados em `application/dtos/`
- [ ] Criar mappers em `application/mappers/`

#### Phase 2: Banco de Dados

- [ ] Adicionar tabela `Users` no `database/tables/users_table.dart`
- [ ] Adicionar tabela `PrinterSupplies` no `database/tables/printer_supplies_table.dart`
- [ ] Adicionar tabela `PrinterMaintenances` no `database/tables/printer_maintenances_table.dart`
- [ ] Modificar tabela `Jobs` para adicionar userId, username, documentType, department
- [ ] Modificar tabela `Printers` para adicionar totalPagesPrinted, tonerLevel, paperLevel, lastMaintenanceDate
- [ ] Criar migrações Drift
- [ ] Executar migrações no `AppDatabase`

#### Phase 3: Repositories

- [ ] Implementar `UserRepository` em `infrastructure/database/repositories/user_repository.dart`
- [ ] Implementar `PrinterSupplyRepository` em `infrastructure/database/repositories/printer_supply_repository.dart`
- [ ] Implementar `PrinterMaintenanceRepository` em `infrastructure/database/repositories/printer_maintenance_repository.dart`
- [ ] Atualizar `JobRepository` para incluir novos campos
- [ ] Atualizar `PrinterRepository` para incluir novos campos

#### Phase 4: Services

- [ ] Implementar `UserService` em `application/services/user_service.dart`
- [ ] Implementar `PrinterSupplyService` em `application/services/printer_supply_service.dart`
- [ ] Implementar `PrinterMaintenanceService` em `application/services/printer_maintenance_service.dart`
- [ ] Criar `WindowsUserService` para sincronizar com usuários Windows

#### Phase 5: Coleta de Dados

- [ ] Integrar captura de userId em `PrintJobCaptureService`
- [ ] Detectar documentType a partir do arquivo
- [ ] Criar serviço para detectar departamento (baseado em OU do AD ou config local)
- [ ] Implementar atualização de totalPagesPrinted quando job for impresso
- [ ] Implementar coleta de níveis de suprimentos (SNMP ou API do driver)
- [ ] Implementar registro automático de manutenções

### Critérios de Aceite

- ✅ Todas as novas tabelas são criadas e funcionam
- ✅ Usuários são sincronizados com usuários do Windows
- ✅ Jobs registram userId e username
- ✅ DocumentType é detectado automaticamente
- ✅ Níveis de suprimentos são coletados (pelo menos toner)
- ✅ Manutenções podem ser registradas manualmente
- ✅ Repositories e Services seguem Clean Architecture
- ✅ Migrações funcionam sem perda de dados

---

## 📝 Checklist de Implementação

### Dashboard Centralizado

- [ ] Criar estrutura de arquivos
- [ ] Implementar UI básica
- [ ] Implementar Provider
- [ ] Implementar MetricsService
- [ ] Implementar KPIs cards
- [ ] Implementar gráficos
- [ ] Integrar rotas
- [ ] Testes unitários
- [ ] Testes de widgets
- [ ] Testes de performance

### Coleta de Dados Adicionais

- [ ] Criar entidades do domínio
- [ ] Criar DTOs e mappers
- [ ] Criar tabelas do banco
- [ ] Criar migrações
- [ ] Implementar repositories
- [ ] Implementar services
- [ ] Sincronizar usuários Windows
- [ ] Capturar userId em jobs
- [ ] Detectar documentType
- [ ] Coletar níveis de suprimentos
- [ ] Testes de integração

---

## 📅 Estimativa de Tempo

- **Dashboard Centralizado**: 5-7 dias
- **Coleta de Dados Adicionais**: 7-10 dias

**Total (Alta Prioridade)**: 12-17 dias (~2.5-3.5 semanas)

---

## 🔗 Referências

- [Boas Práticas para Dashboard de KPIs](https://dkro.com.br/boas-praticas-para-criar-dashboard-de-indicadores-que-realmente-impulsionam-a-sua-operacao/)
- [Printer Monitoring com PRTG](https://www.paessler.com/br/monitoring/hardware/printer-monitoring)
- [PaperCut Features](https://www.papercut.com/products/features/)
