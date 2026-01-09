# Plano de Implementação - Média Prioridade

**Versão**: 1.0.0  
**Status**: 📋 Planejado  
**Última atualização**: 09 de janeiro de 2026

---

## 🎯 Visão Geral

Este documento detalha as funcionalidades de **MÉDIA PRIORIDADE** que devem ser implementadas após a conclusão das funcionalidades de alta prioridade. Essas features melhoram significativamente a usabilidade e controle do sistema.

**Foco Principal**: Relatórios detalhados, controle de acesso por usuários/grupos e ações proativas.

---

## 📊 1. Relatórios de Uso e Métricas Avançados

### Descrição

Desenvolver um sistema completo de relatórios que permita análise detalhada do uso das impressoras, identificação de padrões, desperdícios e otimizações. Os relatórios devem ser exportáveis e agendáveis.

### Tipos de Relatórios a Implementar

#### 1.1 Relatório de Uso por Usuário

**Descrição**: Mostra o volume de impressão por usuário, permitindo identificar usuários com maior consumo.

**Métricas:**
- Total de páginas impressas por usuário
- Total de jobs por usuário
- Volume de dados (MB/GB) por usuário
- Taxa de sucesso/falha por usuário
- Custo estimado por usuário (se implementado)
- Período: diário, semanal, mensal, anual, customizado

**Filtros:**
- Período (data inicial e final)
- Usuário específico ou todos
- Impressora específica ou todas
- Status do job (sucesso, falha, cancelado)
- Tipo de documento

**Visualizações:**
- Tabela com ranking de usuários
- Gráfico de barras (páginas por usuário)
- Gráfico de pizza (distribuição de uso)
- Gráfico de linha (tendência ao longo do tempo)

#### 1.2 Relatório de Uso por Impressora

**Descrição**: Análise detalhada do uso de cada impressora.

**Métricas:**
- Total de páginas impressas
- Total de jobs processados
- Taxa de sucesso/falha
- Tempo médio de impressão
- Tempo de inatividade
- Uptime percentage
- Níveis de suprimentos (histórico)
- Custo de manutenção

**Visualizações:**
- Tabela comparativa de impressoras
- Gráfico de barras (páginas por impressora)
- Gráfico de linha (uso ao longo do tempo)
- Heatmap de uso por hora do dia

#### 1.3 Relatório de Uso por Departamento/Grupo

**Descrição**: Análise de uso agrupado por departamento ou grupo de usuários.

**Métricas:**
- Total de páginas por departamento
- Total de jobs por departamento
- Média de páginas por usuário no departamento
- Custo por departamento
- Comparação entre departamentos

**Visualizações:**
- Tabela de departamentos
- Gráfico de barras comparativo
- Gráfico de pizza (distribuição)

#### 1.4 Relatório de Erros e Falhas

**Descrição**: Análise de erros e falhas para identificar problemas recorrentes.

**Métricas:**
- Total de erros por impressora
- Total de erros por tipo
- Taxa de erro por impressora
- Tempo médio de resolução
- Erros mais frequentes
- Jobs que falharam mais vezes

**Visualizações:**
- Tabela de erros
- Gráfico de barras (erros por impressora)
- Gráfico de linha (tendência de erros)
- Lista de erros críticos

#### 1.5 Relatório de Custos (Opcional)

**Descrição**: Estimativa de custos de impressão (se política de custo for implementada).

**Métricas:**
- Custo total por período
- Custo por usuário
- Custo por impressora
- Custo por departamento
- Custo por tipo de documento
- Economia estimada (se houver políticas de redução)

**Visualizações:**
- Tabela de custos
- Gráfico de barras (custo por categoria)
- Gráfico de linha (tendência de custos)

#### 1.6 Relatório de Manutenção

**Descrição**: Histórico e análise de manutenções realizadas.

**Métricas:**
- Total de manutenções por impressora
- Tipos de manutenção mais frequentes
- Tempo entre manutenções
- Custo de manutenção
- Próximas manutenções previstas

**Visualizações:**
- Tabela de manutenções
- Gráfico de barras (manutenções por tipo)
- Calendário de manutenções

### Arquitetura de Relatórios

```
┌─────────────────────────────────────────────────────────┐
│              REPORTING SERVICE                          │
├─────────────────────────────────────────────────────────┤
│  ReportGenerator                                        │
│    ├── UserUsageReportGenerator                         │
│    ├── PrinterUsageReportGenerator                      │
│    ├── DepartmentUsageReportGenerator                   │
│    ├── ErrorReportGenerator                             │
│    ├── CostReportGenerator                              │
│    └── MaintenanceReportGenerator                       │
├─────────────────────────────────────────────────────────┤
│  ReportExporter                                         │
│    ├── PDFExporter                                      │
│    ├── CSVExporter                                      │
│    ├── ExcelExporter                                    │
│    └── JSONExporter                                     │
├─────────────────────────────────────────────────────────┤
│  ReportScheduler                                        │
│    └── ScheduleReport (cron jobs)                       │
└─────────────────────────────────────────────────────────┘
```

### Tarefas de Implementação

#### Phase 1: Estrutura Base

- [ ] Criar `ReportService` em `application/services/report_service.dart`
- [ ] Criar interfaces `IReportGenerator` e `IReportExporter`
- [ ] Criar DTOs para parâmetros de relatórios em `application/dtos/report_dto.dart`
- [ ] Criar entidade `Report` em `domain/entities/report.dart`
- [ ] Criar `IReportRepository` em `domain/repositories/i_report_repository.dart`

#### Phase 2: Geradores de Relatórios

- [ ] Implementar `UserUsageReportGenerator`
- [ ] Implementar `PrinterUsageReportGenerator`
- [ ] Implementar `DepartmentUsageReportGenerator`
- [ ] Implementar `ErrorReportGenerator`
- [ ] Implementar `MaintenanceReportGenerator`
- [ ] Implementar `CostReportGenerator` (se custos forem implementados)

#### Phase 3: Exportadores

- [ ] Implementar `CSVExporter` (usar biblioteca csv)
- [ ] Implementar `PDFExporter` (usar biblioteca pdf)
- [ ] Implementar `ExcelExporter` (usar biblioteca excel)
- [ ] Implementar `JSONExporter`

#### Phase 4: UI de Relatórios

- [ ] Criar `ReportsPage` em `presentation/pages/reports_page.dart`
- [ ] Criar `ReportBuilderWidget` para configurar parâmetros
- [ ] Criar `ReportViewerWidget` para visualizar relatórios
- [ ] Implementar filtros avançados na UI
- [ ] Implementar preview de relatórios
- [ ] Implementar download de relatórios

#### Phase 5: Agendamento (Opcional)

- [ ] Criar `ReportScheduler` em `application/services/report_scheduler_service.dart`
- [ ] Implementar agendamento de relatórios recorrentes
- [ ] Implementar envio automático por email
- [ ] UI para gerenciar relatórios agendados

### Arquivos a Criar

```
lib/domain/entities/report.dart
lib/domain/repositories/i_report_repository.dart
lib/application/services/report_service.dart
lib/application/services/report_generators/
  ├── user_usage_report_generator.dart
  ├── printer_usage_report_generator.dart
  ├── department_usage_report_generator.dart
  ├── error_report_generator.dart
  ├── maintenance_report_generator.dart
  └── cost_report_generator.dart
lib/application/services/report_exporters/
  ├── csv_exporter.dart
  ├── pdf_exporter.dart
  ├── excel_exporter.dart
  └── json_exporter.dart
lib/application/dtos/report_dto.dart
lib/presentation/pages/reports_page.dart
lib/presentation/providers/report_provider.dart
lib/shared/widgets/report_builder_widget.dart
lib/shared/widgets/report_viewer_widget.dart
```

### Critérios de Aceite

- ✅ Todos os tipos de relatórios são gerados corretamente
- ✅ Filtros funcionam em todos os relatórios
- ✅ Exportação em CSV, PDF, Excel e JSON funciona
- ✅ UI é intuitiva e responsiva
- ✅ Relatórios são gerados em tempo aceitável (< 5s para dados normais)
- ✅ Dados são precisos e consistentes
- ✅ Relatórios podem ser salvos e reabertos

---

## 👥 2. Controle por Usuário, Grupos e Políticas

### Descrição

Implementar um sistema completo de controle de acesso baseado em usuários, grupos e políticas. Isso permite gerenciar permissões de forma granular e aplicar políticas de uso.

### Funcionalidades a Implementar

#### 2.1 Gerenciamento de Usuários

**Descrição**: Interface para gerenciar usuários do sistema.

**Funcionalidades:**
- Listar todos os usuários
- Visualizar detalhes de um usuário
- Criar usuário manualmente
- Editar usuário (nome, departamento, email, grupos)
- Remover usuário
- Sincronizar com usuários Windows
- Buscar usuários
- Filtrar por departamento ou grupo

**UI:**
- Página `UsersPage` com lista de usuários
- Dialog `UserEditDialog` para criar/editar
- Card `UserCard` para exibir informações
- Filtros e busca

#### 2.2 Gerenciamento de Grupos

**Descrição**: Interface para gerenciar grupos e suas permissões.

**Funcionalidades:**
- Listar todos os grupos
- Criar grupo
- Editar grupo (nome, descrição, permissões, membros)
- Remover grupo
- Adicionar/remover usuários de grupos
- Definir permissões do grupo
- Visualizar membros do grupo

**UI:**
- Página `GroupsPage` com lista de grupos
- Dialog `GroupEditDialog` para criar/editar
- Card `GroupCard` para exibir informações
- Widget `PermissionSelector` para selecionar permissões
- Widget `MemberList` para gerenciar membros

#### 2.3 Políticas de Uso

**Descrição**: Definir políticas que controlam o uso das impressoras.

**Tipos de Políticas:**
- **Limite de Impressão**: Limitar número de páginas/jobs por usuário/grupo em um período
- **Horário de Uso**: Permitir impressão apenas em horários específicos
- **Impressoras Permitidas**: Restringir quais impressoras um usuário/grupo pode usar
- **Tipo de Documento**: Restringir tipos de documentos que podem ser impressos
- **Cota de Custo**: Limitar custo de impressão por período

**Funcionalidades:**
- Criar política
- Editar política
- Remover política
- Aplicar política a usuário, grupo ou impressora
- Visualizar políticas ativas
- Histórico de violações de políticas

**UI:**
- Página `PoliciesPage` com lista de políticas
- Dialog `PolicyEditDialog` para criar/editar
- Widget `PolicyRuleBuilder` para construir regras
- Visualização de políticas aplicadas

#### 2.4 Aplicação de Permissões

**Descrição**: Sistema que aplica permissões e políticas em tempo real.

**Pontos de Aplicação:**
- Antes de enviar job para impressora
- Ao acessar fila de impressão
- Ao cancelar job
- Ao pausar/retomar impressora
- Ao acessar configurações

**Validações:**
- Verificar se usuário tem permissão para imprimir
- Verificar se usuário pode usar a impressora específica
- Verificar se horário permite impressão
- Verificar se limite de páginas/jobs não foi excedido
- Verificar se tipo de documento é permitido

### Arquitetura

```
┌─────────────────────────────────────────────────────────┐
│           AUTHORIZATION & POLICY SYSTEM                 │
├─────────────────────────────────────────────────────────┤
│  AuthorizationService (já existe)                      │
│    └── Verifica permissões                             │
├─────────────────────────────────────────────────────────┤
│  PolicyService (novo)                                    │
│    ├── PolicyValidator                                  │
│    ├── PolicyEnforcer                                   │
│    └── PolicyViolationLogger                            │
├─────────────────────────────────────────────────────────┤
│  UserService (novo)                                      │
│    ├── UserManager                                      │
│    └── WindowsUserSync                                  │
├─────────────────────────────────────────────────────────┤
│  GroupService (novo)                                     │
│    └── GroupManager                                      │
└─────────────────────────────────────────────────────────┘
```

### Tarefas de Implementação

#### Phase 1: Entidades e Repositories

- [ ] Entidade `User` já existe (ver alta prioridade)
- [ ] Entidade `Group` já existe
- [ ] Criar entidade `Policy` em `domain/entities/policy.dart`
- [ ] Criar entidade `PolicyViolation` em `domain/entities/policy_violation.dart`
- [ ] Criar `IPolicyRepository` em `domain/repositories/i_policy_repository.dart`
- [ ] Implementar `PolicyRepository` em `infrastructure/database/repositories/policy_repository.dart`
- [ ] Criar tabela `Policies` no banco de dados
- [ ] Criar tabela `PolicyViolations` no banco de dados

#### Phase 2: Services

- [ ] Implementar `UserService` em `application/services/user_service.dart`
- [ ] Implementar `GroupService` em `application/services/group_service.dart`
- [ ] Implementar `PolicyService` em `application/services/policy_service.dart`
- [ ] Implementar `WindowsUserSyncService` em `application/services/windows_user_sync_service.dart`
- [ ] Integrar validação de políticas em `PrintJobService`

#### Phase 3: UI - Usuários

- [ ] Criar `UsersPage` em `presentation/pages/users_page.dart`
- [ ] Criar `UserProvider` em `presentation/providers/user_provider.dart`
- [ ] Criar `UserCard` widget
- [ ] Criar `UserEditDialog`
- [ ] Implementar busca e filtros

#### Phase 4: UI - Grupos

- [ ] Criar `GroupsPage` em `presentation/pages/groups_page.dart`
- [ ] Criar `GroupProvider` em `presentation/providers/group_provider.dart`
- [ ] Criar `GroupCard` widget
- [ ] Criar `GroupEditDialog`
- [ ] Criar `PermissionSelector` widget
- [ ] Criar `MemberList` widget

#### Phase 5: UI - Políticas

- [ ] Criar `PoliciesPage` em `presentation/pages/policies_page.dart`
- [ ] Criar `PolicyProvider` em `presentation/providers/policy_provider.dart`
- [ ] Criar `PolicyCard` widget
- [ ] Criar `PolicyEditDialog`
- [ ] Criar `PolicyRuleBuilder` widget
- [ ] Criar página de violações de políticas

#### Phase 6: Integração

- [ ] Integrar validação de políticas em `SendPrintJob` use case
- [ ] Integrar validação de políticas em `PrintQueueService`
- [ ] Adicionar logs de violações de políticas
- [ ] Implementar notificações para violações de políticas

### Arquivos a Criar

```
lib/domain/entities/policy.dart
lib/domain/entities/policy_violation.dart
lib/domain/repositories/i_policy_repository.dart
lib/infrastructure/database/tables/policies_table.dart
lib/infrastructure/database/tables/policy_violations_table.dart
lib/infrastructure/database/repositories/policy_repository.dart
lib/application/services/user_service.dart
lib/application/services/group_service.dart
lib/application/services/policy_service.dart
lib/application/services/windows_user_sync_service.dart
lib/presentation/pages/users_page.dart
lib/presentation/pages/groups_page.dart
lib/presentation/pages/policies_page.dart
lib/presentation/providers/user_provider.dart
lib/presentation/providers/group_provider.dart
lib/presentation/providers/policy_provider.dart
lib/shared/widgets/user_card.dart
lib/shared/widgets/group_card.dart
lib/shared/widgets/policy_card.dart
lib/shared/widgets/permission_selector.dart
lib/shared/widgets/policy_rule_builder.dart
```

### Critérios de Aceite

- ✅ Usuários podem ser gerenciados (criar, editar, remover)
- ✅ Grupos podem ser gerenciados com permissões
- ✅ Políticas podem ser criadas e aplicadas
- ✅ Políticas são validadas antes de permitir impressão
- ✅ Violações de políticas são registradas
- ✅ Sincronização com usuários Windows funciona
- ✅ UI é intuitiva e completa
- ✅ Permissões são aplicadas corretamente em todos os pontos

---

## ⚡ 3. Capacidade de Atuar Proativamente

### Descrição

Implementar mecanismos que permitam detectar problemas antes que impactem os usuários e executar ações automáticas para resolvê-los.

### Funcionalidades a Implementar

#### 3.1 Detecção Preditiva de Problemas

**Descrição**: Analisar padrões e métricas para prever problemas.

**Indicadores a Monitorar:**
- Taxa de erro crescente em uma impressora
- Tempo de resposta aumentando
- Nível de suprimentos baixando rapidamente
- Padrões anormais de uso
- Jobs falhando repetidamente
- Impressoras ficando offline frequentemente

**Algoritmos:**
- Análise de tendências (regressão linear simples)
- Detecção de anomalias (desvio padrão)
- Análise de padrões históricos
- Machine Learning básico (opcional)

#### 3.2 Ações Automáticas

**Descrição**: Executar ações automaticamente quando problemas são detectados.

**Tipos de Ações:**
- **Reiniciar Serviço de Impressão**: Se detectar que o serviço está travado
- **Limpar Fila**: Se detectar jobs travados
- **Pausar Impressora**: Se detectar muitos erros consecutivos
- **Enviar Alerta**: Notificar administrador sobre problema detectado
- **Redirecionar Jobs**: Se impressora estiver com problemas, redirecionar para outra
- **Agendar Manutenção**: Se detectar necessidade de manutenção

**Configuração:**
- Permitir habilitar/desabilitar cada ação
- Definir thresholds para cada ação
- Definir período de cooldown entre ações
- Log de todas as ações executadas

#### 3.3 Monitoramento de Saúde

**Descrição**: Dashboard de saúde do sistema com indicadores de problemas potenciais.

**Métricas de Saúde:**
- Health Score geral (0-100)
- Health Score por impressora
- Health Score por host
- Indicadores de problemas potenciais
- Recomendações de ações

**Cálculo de Health Score:**
```
Health Score = 100 - (erros * peso_erro) - (tempo_resposta * peso_tempo) - (suprimentos_baixos * peso_suprimentos)
```

#### 3.4 Alertas Preventivos

**Descrição**: Alertas que são enviados antes que um problema se torne crítico.

**Tipos de Alertas Preventivos:**
- "Impressora X está com taxa de erro aumentando"
- "Suprimentos da impressora Y estão acabando"
- "Host Z está ficando offline frequentemente"
- "Fila de impressão está crescendo além do normal"
- "Tempo de resposta está aumentando"

### Arquitetura

```
┌─────────────────────────────────────────────────────────┐
│         PROACTIVE MONITORING SYSTEM                     │
├─────────────────────────────────────────────────────────┤
│  PredictiveAnalyzer                                     │
│    ├── TrendAnalyzer                                    │
│    ├── AnomalyDetector                                  │
│    └── PatternAnalyzer                                   │
├─────────────────────────────────────────────────────────┤
│  ActionExecutor                                         │
│    ├── ServiceRestarter                                 │
│    ├── QueueCleaner                                     │
│    ├── PrinterPauser                                    │
│    ├── JobRedirector                                    │
│    └── MaintenanceScheduler                             │
├─────────────────────────────────────────────────────────┤
│  HealthMonitor                                          │
│    ├── HealthScoreCalculator                            │
│    └── RecommendationEngine                             │
└─────────────────────────────────────────────────────────┘
```

### Tarefas de Implementação

#### Phase 1: Análise Preditiva

- [ ] Criar `PredictiveAnalyzer` em `application/services/predictive_analyzer_service.dart`
- [ ] Implementar `TrendAnalyzer` para análise de tendências
- [ ] Implementar `AnomalyDetector` para detecção de anomalias
- [ ] Implementar `PatternAnalyzer` para análise de padrões
- [ ] Criar testes unitários para algoritmos

#### Phase 2: Executor de Ações

- [ ] Criar `ActionExecutor` em `application/services/action_executor_service.dart`
- [ ] Implementar ações automáticas (reiniciar, limpar, pausar, etc.)
- [ ] Criar sistema de configuração de ações
- [ ] Implementar cooldown entre ações
- [ ] Implementar logging de ações

#### Phase 3: Monitor de Saúde

- [ ] Criar `HealthMonitor` em `application/services/health_monitor_service.dart`
- [ ] Implementar cálculo de Health Score
- [ ] Implementar geração de recomendações
- [ ] Criar DTOs para métricas de saúde

#### Phase 4: Alertas Preventivos

- [ ] Integrar alertas preventivos no `NotificationService`
- [ ] Criar templates de alertas preventivos
- [ ] Implementar configuração de thresholds

#### Phase 5: UI

- [ ] Criar seção de "Saúde do Sistema" no dashboard
- [ ] Criar página de configuração de ações automáticas
- [ ] Criar página de recomendações
- [ ] Adicionar indicadores visuais de saúde

### Arquivos a Criar

```
lib/application/services/predictive_analyzer_service.dart
lib/application/services/action_executor_service.dart
lib/application/services/health_monitor_service.dart
lib/application/services/analyzers/
  ├── trend_analyzer.dart
  ├── anomaly_detector.dart
  └── pattern_analyzer.dart
lib/application/services/actions/
  ├── service_restarter.dart
  ├── queue_cleaner.dart
  ├── printer_pauser.dart
  ├── job_redirector.dart
  └── maintenance_scheduler.dart
lib/application/dtos/health_dto.dart
lib/presentation/pages/health_page.dart
lib/presentation/pages/automation_settings_page.dart
lib/presentation/providers/health_provider.dart
```

### Critérios de Aceite

- ✅ Problemas são detectados antes de impactar usuários
- ✅ Ações automáticas são executadas corretamente
- ✅ Health Score é calculado e exibido
- ✅ Alertas preventivos são enviados
- ✅ Configuração de ações é flexível
- ✅ Logs de ações são mantidos
- ✅ Sistema não executa ações desnecessárias (cooldown funciona)

---

## 📝 Checklist de Implementação

### Relatórios Avançados

- [ ] Criar estrutura de serviços de relatórios
- [ ] Implementar geradores de relatórios
- [ ] Implementar exportadores (CSV, PDF, Excel, JSON)
- [ ] Criar UI de relatórios
- [ ] Implementar filtros avançados
- [ ] Testes de geração de relatórios
- [ ] Testes de exportação

### Controle de Acesso

- [ ] Criar entidades Policy
- [ ] Implementar repositories
- [ ] Implementar services
- [ ] Criar UI de usuários
- [ ] Criar UI de grupos
- [ ] Criar UI de políticas
- [ ] Integrar validação de políticas
- [ ] Testes de permissões

### Ações Proativas

- [ ] Implementar análise preditiva
- [ ] Implementar executor de ações
- [ ] Implementar monitor de saúde
- [ ] Criar UI de configuração
- [ ] Integrar alertas preventivos
- [ ] Testes de detecção
- [ ] Testes de ações automáticas

---

## 📅 Estimativa de Tempo

- **Relatórios Avançados**: 10-14 dias
- **Controle de Acesso**: 8-12 dias
- **Ações Proativas**: 7-10 dias

**Total (Média Prioridade)**: 25-36 dias (~5-7 semanas)

---

## 🔗 Referências

- [PrintSpy - Print Management Software](https://printspy.com/)
- [PaperCut - Print Management Features](https://www.papercut.com/products/features/)
- [Printer Monitoring Best Practices](https://www.paessler.com/br/monitoring/hardware/printer-monitoring)
