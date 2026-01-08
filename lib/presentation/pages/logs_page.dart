import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../../shared/shared.dart';
import '../providers/providers.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  final _searchController = TextEditingController();
  List<AppLogLevel>? _selectedLevels;
  List<AppLogCategory>? _selectedCategories;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: const Text('Logs do Sistema'),
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            CommandBarButton(
              icon: const Icon(FluentIcons.refresh),
              label: const Text('Atualizar'),
              onPressed: () {
                context.read<LogProvider>().loadLogs();
              },
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.export),
              label: const Text('Exportar'),
              onPressed: () => _showExportDialog(context),
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.delete),
              label: const Text('Limpar Antigos'),
              onPressed: () => _showDeleteDialog(context),
            ),
          ],
        ),
      ),
      children: [_buildFilters(), const SizedBox(height: 16), _buildLogsList()],
    );
  }

  Widget _buildFilters() {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filtros',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 36,
                child: TextBox(
                  controller: _searchController,
                  placeholder: 'Buscar...',
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(FluentIcons.search),
                  ),
                  suffix: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(FluentIcons.clear),
                          onPressed: () {
                            _searchController.clear();
                            context.read<LogProvider>().setSearchQuery('');
                          },
                        )
                      : null,
                  onChanged: (value) {
                    context.read<LogProvider>().setSearchQuery(value);
                  },
                ),
              ),
              SizedBox(width: 150, child: _buildLevelFilter()),
              SizedBox(width: 150, child: _buildCategoryFilter()),
              SizedBox(width: 150, child: _buildDateFilter()),
              if (_hasActiveFilters())
                AppButton(
                  label: 'Limpar Filtros',
                  onPressed: _clearFilters,
                  isPrimary: false,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelFilter() {
    return ComboBox<String>(
      isExpanded: true,
      placeholder: const Text('Nível'),
      items: const [
        ComboBoxItem(value: 'debug', child: Text('Debug')),
        ComboBoxItem(value: 'info', child: Text('Info')),
        ComboBoxItem(value: 'warning', child: Text('Aviso')),
        ComboBoxItem(value: 'error', child: Text('Erro')),
        ComboBoxItem(value: 'fatal', child: Text('Fatal')),
      ],
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedLevels = [
              AppLogLevel.values.firstWhere((e) => e.name == value),
            ];
          });
          _applyFilters();
        }
      },
    );
  }

  Widget _buildCategoryFilter() {
    return ComboBox<String>(
      isExpanded: true,
      placeholder: const Text('Categoria'),
      items: const [
        ComboBoxItem(value: 'print', child: Text('Impressão')),
        ComboBoxItem(value: 'host', child: Text('Host')),
        ComboBoxItem(value: 'auth', child: Text('Autenticação')),
        ComboBoxItem(value: 'system', child: Text('Sistema')),
      ],
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedCategories = [
              AppLogCategory.values.firstWhere((e) => e.name == value),
            ];
          });
          _applyFilters();
        }
      },
    );
  }

  Widget _buildDateFilter() {
    return Button(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
      ),
      onPressed: () async {
        final result = await showDialog<DateTime>(
          context: context,
          builder: (context) => ContentDialog(
            title: const Text('Selecionar Data'),
            content: DatePicker(
              selected: _startDate ?? DateTime.now(),
              onChanged: (date) => Navigator.pop(context, date),
            ),
            actions: [
              CancelButton(
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
        if (result != null) {
          setState(() {
            _startDate = result;
          });
          _applyFilters();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(FluentIcons.calendar, size: 16),
          const SizedBox(width: 6),
          Text(
            _startDate == null ? 'Data Inicial' : _formatDate(_startDate!),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildLogsList() {
    return Consumer<LogProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: ProgressRing());
        }

        if (provider.error != null) {
          return CenteredMessage(
            icon: FluentIcons.error,
            title: 'Erro',
            message: provider.error!,
          );
        }

        final logs = provider.filteredLogs;

        if (logs.isEmpty) {
          return const CenteredMessage(
            icon: FluentIcons.text_document,
            title: 'Nenhum log encontrado',
            message: 'Não há logs no sistema ainda.',
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: logs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) => _buildLogCard(logs[index]),
        );
      },
    );
  }

  Widget _buildLogCard(AppLog log) {
    final color = _getLogLevelColor(log.level);
    final icon = _getLogLevelIcon(log.level);

    return Expander(
      leading: Icon(icon, color: color, size: 24),
      header: Row(
        children: [
          Text(
            _formatTime(log.createdAt),
            style: const TextStyle(fontFamily: 'monospace'),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              log.level.name.toUpperCase(),
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              log.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      content: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[190],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(log.message),
            if (log.details != null) ...[
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Detalhes:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              SelectableText(
                log.details!,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ],
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 4,
              children: [
                Text(
                  'Categoria: ${log.category.name}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (log.printerId != null)
                  Text(
                    'Impressora: ${log.printerId}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                if (log.hostId != null)
                  Text(
                    'Host: ${log.hostId}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                if (log.jobId != null)
                  Text(
                    'Job: ${log.jobId}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _applyFilters() {
    final filters = AppLogFilters(
      levels: _selectedLevels,
      categories: _selectedCategories,
      startDate: _startDate,
      endDate: _endDate,
    );
    context.read<LogProvider>().setFilters(filters);
  }

  void _clearFilters() {
    setState(() {
      _selectedLevels = null;
      _selectedCategories = null;
      _startDate = null;
      _endDate = null;
      _searchController.clear();
    });
    context.read<LogProvider>().setFilters(null);
    context.read<LogProvider>().setSearchQuery('');
  }

  bool _hasActiveFilters() {
    return _selectedLevels != null ||
        _selectedCategories != null ||
        _startDate != null ||
        _endDate != null ||
        _searchController.text.isNotEmpty;
  }

  Future<void> _showExportDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Exportar Logs'),
        content: const Text('Escolha o formato para exportação:'),
        actions: [
          AppButton(
            label: 'CSV',
            onPressed: () async {
              Navigator.pop(context);
              final path = await context.read<LogProvider>().exportToCsv();
              if (path != null && context.mounted) {
                ToastManager.showSuccess(
                  context,
                  'Exportação Concluída',
                  'Arquivo salvo em: $path',
                );
              }
            },
          ),
          AppButton(
            label: 'JSON',
            onPressed: () async {
              Navigator.pop(context);
              final path = await context.read<LogProvider>().exportToJson();
              if (path != null && context.mounted) {
                ToastManager.showSuccess(
                  context,
                  'Exportação Concluída',
                  'Arquivo salvo em: $path',
                );
              }
            },
            isPrimary: false,
          ),
          AppButton(
            label: 'Cancelar',
            onPressed: () => Navigator.pop(context),
            isPrimary: false,
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) async {
    final result = await MessageModal.showConfirmation(
      context,
      title: 'Limpar Logs Antigos',
      message: 'Deseja remover logs com mais de 30 dias?',
      confirmLabel: 'Confirmar',
      cancelLabel: 'Cancelar',
      type: MessageType.warning,
    );

    if (result == true && context.mounted) {
      await context.read<LogProvider>().deleteOldLogs();
      if (context.mounted) {
        ToastManager.showSuccess(
          context,
          'Limpeza Concluída',
          'Logs antigos foram removidos.',
        );
      }
    }
  }

  Color _getLogLevelColor(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return Colors.grey;
      case AppLogLevel.info:
        return Colors.blue;
      case AppLogLevel.warning:
        return Colors.orange;
      case AppLogLevel.error:
        return Colors.red;
      case AppLogLevel.fatal:
        return Colors.red.darker;
    }
  }

  IconData _getLogLevelIcon(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return FluentIcons.developer_tools;
      case AppLogLevel.info:
        return FluentIcons.info;
      case AppLogLevel.warning:
        return FluentIcons.warning;
      case AppLogLevel.error:
        return FluentIcons.error_badge;
      case AppLogLevel.fatal:
        return FluentIcons.status_error_full;
    }
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }
}
