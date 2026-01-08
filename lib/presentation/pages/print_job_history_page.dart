import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../application/dtos/print_job_dto.dart';
import '../../shared/shared.dart';
import '../providers/providers.dart';

class PrintJobHistoryPage extends StatefulWidget {
  const PrintJobHistoryPage({super.key});

  @override
  State<PrintJobHistoryPage> createState() => _PrintJobHistoryPageState();
}

class _PrintJobHistoryPageState extends State<PrintJobHistoryPage> {
  String _selectedFilter = 'all';

  final List<Map<String, dynamic>> _filters = [
    {'value': 'all', 'label': 'Todos', 'icon': FluentIcons.all_apps},
    {'value': 'pending', 'label': 'Pendentes', 'icon': FluentIcons.all_apps},
    {'value': 'progress', 'label': 'Em Progresso', 'icon': FluentIcons.refresh},
    {
      'value': 'completed',
      'label': 'Concluídos',
      'icon': FluentIcons.check_mark,
    },
    {'value': 'failed', 'label': 'Falhados', 'icon': FluentIcons.error},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrintJobProvider>().loadJobHistory();
    });
  }

  List<PrintJobDTO> _getFilteredJobs(PrintJobProvider provider) {
    switch (_selectedFilter) {
      case 'pending':
        return provider.pendingJobs;
      case 'progress':
        return provider.inProgressJobs;
      case 'completed':
        return provider.completedJobs;
      case 'failed':
        return provider.failedJobs;
      default:
        return provider.jobs;
    }
  }

  void _refreshJobs() {
    context.read<PrintJobProvider>().loadJobHistory();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Consumer<PrintJobProvider>(
      builder: (context, provider, child) {
        final filteredJobs = _getFilteredJobs(provider);

        return ScaffoldPage.scrollable(
          header: PageHeader(
            title: Text(
              'Histórico de Jobs  '
              '${provider.jobs.length} job${provider.jobs.length != 1 ? 's' : ''}',
            ),
          ),
          children: [
            // Botão de atualização
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ActionButton(
                    label: 'Atualizar',
                    icon: FluentIcons.refresh,
                    onPressed: _refreshJobs,
                    isLoading: provider.isLoading,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Filtros
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter['value'];
                  final count = filter['value'] != 'all'
                      ? _getCount(
                          provider,
                          filter['value'] as String,
                        ).toString()
                      : null;
                  
                  return FilterButton(
                    label: filter['label'] as String,
                    icon: filter['icon'] as IconData,
                    isSelected: isSelected,
                    count: count,
                    onPressed: () {
                      setState(() {
                        _selectedFilter = filter['value'] as String;
                      });
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Lista de Jobs
            if (provider.isLoading)
              const Center(child: ProgressRing())
            else if (provider.error != null)
              _buildErrorCard(context, provider.error!)
            else if (filteredJobs.isEmpty)
              _buildEmptyState(context)
            else
              ...filteredJobs.map((job) => _buildJobCard(context, job)),

            const SizedBox(height: 48),
          ],
        );
      },
    );
  }

  int _getCount(PrintJobProvider provider, String filter) {
    switch (filter) {
      case 'pending':
        return provider.pendingJobs.length;
      case 'progress':
        return provider.inProgressJobs.length;
      case 'completed':
        return provider.completedJobs.length;
      case 'failed':
        return provider.failedJobs.length;
      default:
        return 0;
    }
  }

  Widget _buildJobCard(BuildContext context, PrintJobDTO job) {
    final theme = FluentTheme.of(context);

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              _buildJobStatusIcon(job.status),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.documentName, style: theme.typography.bodyStrong),
                    const SizedBox(height: 2),
                    Text(
                      job.printerName,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
              _buildJobStatusBadge(job.status),
            ],
          ),

          // Progresso
          if (job.isInProgress && job.totalChunks > 0) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: ProgressBar(value: job.progress)),
                const SizedBox(width: 12),
                Text(
                  '${(job.progress * 100).toInt()}%',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${job.sentChunks}/${job.totalChunks} chunks',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF999999),
                  ),
                ),
                if (job.totalPages > 0) ...[
                  const SizedBox(width: 16),
                  Text(
                    '${job.printedPages}/${job.totalPages} páginas',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ],
            ),
          ],

          // Detalhes
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              if (job.totalSize > 0)
                _buildInfoChip(
                  context,
                  icon: FluentIcons.document,
                  label: _formatBytes(job.totalSize),
                ),
              if (job.duration != null)
                _buildInfoChip(
                  context,
                  icon: FluentIcons.clock,
                  label: _formatDuration(job.duration!),
                ),
              _buildInfoChip(
                context,
                icon: FluentIcons.calendar,
                label: _formatDate(job.createdAt),
              ),
            ],
          ),

          // Erro
          if (job.errorMessage != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3F3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(
                    FluentIcons.error,
                    size: 16,
                    color: Color(0xFFD13438),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      job.errorMessage!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFD13438),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildJobStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return const Icon(
          FluentIcons.all_apps,
          size: 20,
          color: Color(0xFF0078D4),
        );
      case 'preparing':
      case 'sending':
      case 'spooled':
      case 'printing':
        return const Icon(
          FluentIcons.refresh,
          size: 20,
          color: Color(0xFFFF8C00),
        );
      case 'printed':
      case 'sent':
        return const Icon(
          FluentIcons.check_mark,
          size: 20,
          color: Color(0xFF107C10),
        );
      case 'failed':
        return const Icon(
          FluentIcons.error,
          size: 20,
          color: Color(0xFFD13438),
        );
      case 'cancelled':
        return const Icon(
          FluentIcons.cancel,
          size: 20,
          color: Color(0xFF999999),
        );
      default:
        return const Icon(FluentIcons.document, size: 20);
    }
  }

  Widget _buildJobStatusBadge(String status) {
    String label;
    Color color;

    switch (status) {
      case 'pending':
        label = 'Pendente';
        color = const Color(0xFF0078D4);
        break;
      case 'preparing':
        label = 'Preparando';
        color = const Color(0xFFFF8C00);
        break;
      case 'sending':
        label = 'Enviando';
        color = const Color(0xFFFF8C00);
        break;
      case 'spooled':
        label = 'Na Fila';
        color = const Color(0xFFFF8C00);
        break;
      case 'printing':
        label = 'Imprimindo';
        color = const Color(0xFFFF8C00);
        break;
      case 'printed':
      case 'sent':
        label = 'Concluído';
        color = const Color(0xFF107C10);
        break;
      case 'failed':
        label = 'Falhou';
        color = const Color(0xFFD13438);
        break;
      case 'cancelled':
        label = 'Cancelado';
        color = const Color(0xFF999999);
        break;
      default:
        label = status;
        color = const Color(0xFF999999);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF999999)),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF999999)),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FluentIcons.history, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('Nenhum Job Encontrado', style: theme.typography.title),
            const SizedBox(height: 8),
            const Text(
              'Não há jobs com o filtro selecionado',
              style: TextStyle(color: Color(0xFF999999)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, String error) {
    return AppCard(
      child: Row(
        children: [
          const Icon(FluentIcons.error, size: 24, color: Color(0xFFD13438)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Erro ao carregar histórico',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  error,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
          AppButton(
            label: 'Tentar Novamente',
            onPressed: _refreshJobs,
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Hoje ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Ontem ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} dias atrás';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
