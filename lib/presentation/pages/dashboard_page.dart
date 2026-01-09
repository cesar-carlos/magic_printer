import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/application.dart';
import '../../core/routes/route_names.dart';
import '../../domain/domain.dart';
import '../../shared/shared.dart';
import '../providers/providers.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrinterProvider>().loadPrinters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: const Text('Dashboard'),
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            CommandBarButton(
              icon: const Icon(FluentIcons.refresh),
              label: const Text('Atualizar'),
              onPressed: () {
                context.read<DashboardProvider>().loadMetrics();
              },
            ),
          ],
        ),
      ),
      children: [
        _BuildFiltersSection(),
        const SizedBox(height: 16),
        _BuildDashboardContent(),
      ],
    );
  }
}

class _BuildFiltersSection extends StatelessWidget {
  const _BuildFiltersSection();

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, PrinterProvider>(
      builder: (context, dashboardProvider, printerProvider, child) {
        final printers = printerProvider.printers;
        final selectedPrinterId = dashboardProvider.selectedPrinterId;
        PrinterDTO? selectedPrinter;

        if (selectedPrinterId != null && printers.isNotEmpty) {
          try {
            selectedPrinter = printers.firstWhere(
              (p) => p.id == selectedPrinterId,
            );
          } catch (e) {
            selectedPrinter = null;
          }
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: AppCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FluentIcons.filter, size: 20),
                const SizedBox(width: 12),
                const Text(
                  'Filtro:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  flex: 2,
                  child: printers.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Nenhuma impressora disponível',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF999999),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : ComboBox<PrinterDTO?>(
                          value: selectedPrinter,
                          items: [
                            const ComboBoxItem(
                              value: null,
                              child: Text('Todas as impressoras'),
                            ),
                            ...printers.map(
                              (printer) => ComboBoxItem(
                                value: printer,
                                child: Text(printer.name),
                              ),
                            ),
                          ],
                          onChanged: (printer) {
                            dashboardProvider.setPrinterFilter(printer?.id);
                          },
                          placeholder: const Text('Selecione uma impressora'),
                        ),
                ),
                if (selectedPrinterId != null) ...[
                  const SizedBox(width: 12),
                  ActionButton(
                    label: 'Limpar filtro',
                    icon: FluentIcons.clear,
                    onPressed: () {
                      dashboardProvider.clearPrinterFilter();
                    },
                  ),
                ],
                const SizedBox(width: 16),
                const Text(
                  'Período:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                ToggleButton(
                  checked: dashboardProvider.selectedPeriod == TimePeriod.last24h,
                  onChanged: (_) {
                    dashboardProvider.setTimePeriod(TimePeriod.last24h);
                  },
                  child: const Text('24h'),
                ),
                const SizedBox(width: 8),
                ToggleButton(
                  checked: dashboardProvider.selectedPeriod == TimePeriod.last7d,
                  onChanged: (_) {
                    dashboardProvider.setTimePeriod(TimePeriod.last7d);
                  },
                  child: const Text('7d'),
                ),
                const SizedBox(width: 8),
                ToggleButton(
                  checked: dashboardProvider.selectedPeriod == TimePeriod.last30d,
                  onChanged: (_) {
                    dashboardProvider.setTimePeriod(TimePeriod.last30d);
                  },
                  child: const Text('30d'),
                ),
                const SizedBox(width: 8),
                ToggleButton(
                  checked: dashboardProvider.selectedPeriod == TimePeriod.all,
                  onChanged: (_) {
                    dashboardProvider.setTimePeriod(TimePeriod.all);
                  },
                  child: const Text('Todo'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuildDashboardContent extends StatelessWidget {
  const _BuildDashboardContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: ProgressRing()),
          );
        }

        if (provider.error != null) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: CenteredMessage(
              icon: FluentIcons.error,
              title: 'Erro ao carregar métricas',
              message: provider.error!,
            ),
          );
        }

        final metrics = provider.metrics;
        if (metrics == null) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: CenteredMessage(
              icon: FluentIcons.info,
              title: 'Nenhuma métrica disponível',
              message: 'Não há métricas para exibir no momento.',
            ),
          );
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Padding(
            key: ValueKey(metrics.lastUpdated),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BuildOverviewSection(metrics: metrics),
                const SizedBox(height: 24),
                _BuildPrintersSection(metrics: metrics),
                const SizedBox(height: 24),
                _BuildQueueSection(metrics: metrics),
                const SizedBox(height: 24),
                _BuildTrendsSection(),
                const SizedBox(height: 24),
                _BuildPrintersListSection(),
                const SizedBox(height: 24),
                _BuildHostsSection(metrics: metrics),
                const SizedBox(height: 24),
                _BuildAlertsSection(metrics: metrics),
                const SizedBox(height: 24),
                _BuildHealthSection(),
                const SizedBox(height: 24),
                _BuildPredictionsSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuildOverviewSection extends StatelessWidget {
  final DashboardMetrics metrics;

  const _BuildOverviewSection({required this.metrics});

  @override
  Widget build(BuildContext context) {
    final hasFilter = context.watch<DashboardProvider>().selectedPrinterId != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Visão Geral',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (hasFilter) ...[
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8C00).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xFFFF8C00).withValues(alpha: 0.3),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FluentIcons.filter,
                      size: 14,
                      color: Color(0xFFFF8C00),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Filtrado',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFF8C00),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: KPIBadge(
                  icon: FluentIcons.print,
                  count: metrics.printers.total,
                  color: const Color(0xFF0078D4),
                  label: 'Impressoras',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: KPIBadge(
                  icon: FluentIcons.list,
                  count: metrics.queue.total,
                  color: const Color(0xFFFF8C00),
                  label: 'Fila',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: KPIBadge(
                  icon: FluentIcons.server,
                  count: metrics.hosts.total,
                  color: const Color(0xFF107C10),
                  label: 'Hosts',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Última atualização: ${_formatTime(metrics.lastUpdated)}',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF999999),
          ),
        ),
      ],
    );
  }
}

String _formatTime(DateTime dateTime) {
  return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
}

class _BuildPrintersSection extends StatelessWidget {
  final DashboardMetrics metrics;

  const _BuildPrintersSection({required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Métricas de Impressoras',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: MetricCard(
                  label: 'Total',
                  value: metrics.printers.total,
                  icon: FluentIcons.print,
                  color: const Color(0xFF0078D4),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Online',
                  value: metrics.printers.online,
                  icon: FluentIcons.check_mark,
                  color: const Color(0xFF107C10),
                  subtitle: '${metrics.printers.onlinePercentage.toStringAsFixed(0)}% do total',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Offline',
                  value: metrics.printers.offline,
                  icon: FluentIcons.circle_stop,
                  color: const Color(0xFF999999),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Erro',
                  value: metrics.printers.error,
                  icon: FluentIcons.error,
                  color: const Color(0xFFD13438),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ProgressMetricCard(
                title: 'Status das Impressoras',
                value: metrics.printers.online.toDouble(),
                max: metrics.printers.total.toDouble(),
                color: const Color(0xFF107C10),
                subtitle: '${metrics.printers.online} de ${metrics.printers.total} online',
                metrics: [
                  MetricRow(
                    label: 'Imprimindo',
                    value: metrics.printers.printing,
                    color: const Color(0xFFFF8C00),
                  ),
                  MetricRow(
                    label: 'Pausadas',
                    value: metrics.printers.paused,
                    color: const Color(0xFF999999),
                  ),
                  MetricRow(
                    label: 'Com erro',
                    value: metrics.printers.error,
                    color: const Color(0xFFD13438),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: DashboardCard(
                title: 'Distribuição de Status',
                child: PrinterStatusPieChart(metrics: metrics.printers),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BuildQueueSection extends StatelessWidget {
  final DashboardMetrics metrics;

  const _BuildQueueSection({required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Métricas de Fila',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: MetricCard(
                  label: 'Pendentes',
                  value: metrics.queue.pending,
                  icon: FluentIcons.clock,
                  color: const Color(0xFF0078D4),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Imprimindo',
                  value: metrics.queue.printing,
                  icon: FluentIcons.print,
                  color: const Color(0xFFFF8C00),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Falhados',
                  value: metrics.queue.failed,
                  icon: FluentIcons.error,
                  color: const Color(0xFFD13438),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Últimas 24h',
                  value: metrics.queue.completed24h,
                  icon: FluentIcons.check_mark,
                  color: const Color(0xFF107C10),
                  subtitle: '${metrics.queue.successRate.toStringAsFixed(1)}% sucesso',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DashboardCard(
                title: 'Completados (7 dias)',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metrics.queue.completed7d.toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF107C10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Impressões concluídas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Completados (30 dias)',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metrics.queue.completed30d.toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF107C10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Impressões concluídas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BuildTrendsSection extends StatelessWidget {
  const _BuildTrendsSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        final trends = provider.usageTrends;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tendências de Uso',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DashboardCard(
              title: 'Uso ao Longo do Tempo',
              child: trends == null || trends.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(32),
                      child: Center(
                        child: Text(
                          'Carregando tendências...',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ),
                    )
                  : UsageTrendLineChart(trends: trends),
            ),
          ],
        );
      },
    );
  }
}

class _BuildPrintersListSection extends StatelessWidget {
  const _BuildPrintersListSection();

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, PrinterProvider>(
      builder: (context, dashboardProvider, printerProvider, child) {
        final printers = printerProvider.printers;
        final selectedPrinterId = dashboardProvider.selectedPrinterId;

        List<PrinterDTO> displayPrinters = printers;
        if (selectedPrinterId != null) {
          displayPrinters = printers
              .where((p) => p.id == selectedPrinterId)
              .toList();
        }

        if (displayPrinters.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Impressoras',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              DashboardCard(
                title: 'Nenhuma impressora disponível',
                child: const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: Text(
                      'Não há impressoras para exibir',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Impressoras',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0078D4).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${displayPrinters.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0078D4),
                    ),
                  ),
                ),
                const Spacer(),
                HyperlinkButton(
                  onPressed: () {
                    context.go('/printers');
                  },
                  child: const Text('Ver todas'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: displayPrinters.length > 6 ? 6 : displayPrinters.length,
              itemBuilder: (context, index) {
                return DashboardPrinterCard(
                  printer: displayPrinters[index],
                );
              },
            ),
            if (displayPrinters.length > 6) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: HyperlinkButton(
                  onPressed: () {
                    context.go('/printers');
                  },
                  child: Text('Ver mais ${displayPrinters.length - 6} impressoras'),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _BuildHostsSection extends StatelessWidget {
  final DashboardMetrics metrics;

  const _BuildHostsSection({required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hosts Conectados',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: MetricCard(
                  label: 'Total',
                  value: metrics.hosts.total,
                  icon: FluentIcons.server,
                  color: const Color(0xFF0078D4),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Online',
                  value: metrics.hosts.online,
                  icon: FluentIcons.check_mark,
                  color: const Color(0xFF107C10),
                  subtitle: '${metrics.hosts.onlinePercentage.toStringAsFixed(0)}% do total',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MetricCard(
                  label: 'Offline',
                  value: metrics.hosts.offline,
                  icon: FluentIcons.circle_stop,
                  color: const Color(0xFF999999),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ProgressMetricCard(
          title: 'Status dos Hosts',
          value: metrics.hosts.online.toDouble(),
          max: metrics.hosts.total.toDouble(),
          color: const Color(0xFF107C10),
          subtitle: '${metrics.hosts.online} de ${metrics.hosts.total} online',
        ),
      ],
    );
  }
}

class _BuildAlertsSection extends StatelessWidget {
  final DashboardMetrics metrics;

  const _BuildAlertsSection({required this.metrics});

  @override
  Widget build(BuildContext context) {
    final alerts = metrics.activeAlerts;

    if (alerts.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alertas Recentes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          DashboardCard(
            title: 'Nenhum alerta ativo',
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    FluentIcons.accept,
                    color: Color(0xFF107C10),
                    size: 24,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Não há alertas ativos no momento',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Alertas Recentes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFD13438).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${alerts.length}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD13438),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        DashboardCard(
          title: 'Alertas Ativos',
          child: Column(
            children: alerts.take(5).map((alert) {
              Color alertColor;
              IconData alertIcon;

              switch (alert.level) {
                case AppLogLevel.fatal:
                case AppLogLevel.error:
                  alertColor = const Color(0xFFD13438);
                  alertIcon = FluentIcons.error;
                  break;
                case AppLogLevel.warning:
                  alertColor = const Color(0xFFFF8C00);
                  alertIcon = FluentIcons.warning;
                  break;
                default:
                  alertColor = const Color(0xFF0078D4);
                  alertIcon = FluentIcons.info;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      alertIcon,
                      color: alertColor,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alert.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (alert.message.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              alert.message,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF999999),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                          const SizedBox(height: 4),
                          Text(
                            _formatAlertTime(alert.createdAt),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        if (alerts.length > 5) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: HyperlinkButton(
              onPressed: () {
                context.go(RouteNames.logs);
              },
              child: const Text('Ver todos os alertas'),
            ),
          ),
        ],
      ],
    );
  }

  String _formatAlertTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Agora';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m atrás';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h atrás';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d atrás';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }
}

class _BuildHealthSection extends StatelessWidget {
  const _BuildHealthSection();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final healthMetrics = provider.healthMetrics;
    final printers = context.watch<PrinterProvider>().printers;

    if (healthMetrics == null || healthMetrics.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Saúde das Impressoras',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: healthMetrics.map((health) {
            final printer = printers.where((p) => p.id == health.printerId).firstOrNull;
            return SizedBox(
              width: 400,
              child: PrinterHealthCard(
                health: health,
                printer: printer,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _BuildPredictionsSection extends StatelessWidget {
  const _BuildPredictionsSection();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final predictions = provider.predictions;
    final printers = context.watch<PrinterProvider>().printers;

    if (predictions == null || predictions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Previsões',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: predictions.take(5).map((prediction) {
            final printer = printers.where((p) => p.id == prediction.printerId).firstOrNull;
            return SizedBox(
              width: 400,
              child: PredictionCard(
                prediction: prediction,
                printer: printer,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
