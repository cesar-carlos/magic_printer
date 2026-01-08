import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../../shared/shared.dart';
import '../providers/providers.dart';

class PrintQueuePage extends StatefulWidget {
  const PrintQueuePage({super.key});

  @override
  State<PrintQueuePage> createState() => _PrintQueuePageState();
}

class _PrintQueuePageState extends State<PrintQueuePage> {
  @override
  void initState() {
    super.initState();
    // O provider já se inscreve nos streams automaticamente
  }

  void _cancelAll() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Cancelar Todos'),
        content: const Text('Deseja cancelar todos os jobs pendentes?'),
        actions: [
          ActionButton(
            label: 'Não',
            onPressed: () => Navigator.pop(context, false),
          ),
          AppButton(
            label: 'Sim',
            onPressed: () => Navigator.pop(context, true),
            isPrimary: true,
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      context.read<PrintQueueProvider>().cancelAll();
    }
  }

  void _clearCompleted() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Limpar Concluídos'),
        content: const Text('Deseja remover todos os jobs concluídos da fila?'),
        actions: [
          ActionButton(
            label: 'Não',
            onPressed: () => Navigator.pop(context, false),
          ),
          AppButton(
            label: 'Sim',
            onPressed: () => Navigator.pop(context, true),
            isPrimary: true,
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      context.read<PrintQueueProvider>().clearCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrintQueueProvider>(
      builder: (context, provider, child) {
        return ScaffoldPage.scrollable(
          header: PageHeader(
            title: Text(
              'Fila de Impressão  '
              '${provider.pendingCount} pendente${provider.pendingCount != 1 ? 's' : ''} • '
              '${provider.completedCount} concluído${provider.completedCount != 1 ? 's' : ''}',
            ),
          ),
          children: [
            // Botões de ação
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (provider.isProcessing)
                    ActionButton(
                      label: 'Parar',
                      icon: FluentIcons.stop,
                      onPressed: () => provider.stop(),
                    )
                  else
                    AppButton(
                      label: 'Iniciar',
                      icon: FluentIcons.play,
                      onPressed: provider.pendingCount > 0
                          ? () => provider.start()
                          : null,
                      isPrimary: true,
                    ),
                  const SizedBox(width: 8),
                  ActionButton(
                    label: 'Limpar',
                    icon: FluentIcons.delete,
                    onPressed: provider.completedCount > 0
                        ? _clearCompleted
                        : null,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Job Atual
            if (provider.currentItem != null) ...[
              _buildCurrentJobCard(context, provider.currentItem!, provider),
              const SizedBox(height: 16),
            ],

            // Jobs Pendentes
            if (provider.pendingItems.isNotEmpty) ...[
              _buildSectionHeader(
                context,
                title: 'Jobs Pendentes (${provider.pendingItems.length})',
                icon: FluentIcons.all_apps,
                trailing: provider.pendingItems.length > 1
                    ? ActionButton(
                        label: 'Cancelar Todos',
                        onPressed: _cancelAll,
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              ...provider.pendingItems.map(
                (item) => _buildQueueItemCard(
                  context,
                  item,
                  provider,
                  isCurrent: false,
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Jobs Concluídos
            if (provider.completedItems.isNotEmpty) ...[
              _buildSectionHeader(
                context,
                title: 'Concluídos (${provider.completedItems.length})',
                icon: FluentIcons.check_mark,
              ),
              const SizedBox(height: 8),
              ...provider.completedItems
                  .take(10)
                  .map(
                    (item) => _buildQueueItemCard(
                      context,
                      item,
                      provider,
                      isCurrent: false,
                    ),
                  ),
            ],

            // Estado Vazio
            if (provider.pendingItems.isEmpty &&
                provider.completedItems.isEmpty &&
                provider.currentItem == null)
              _buildEmptyState(context),
          ],
        );
      },
    );
  }

  Widget _buildCurrentJobCard(
    BuildContext context,
    PrintQueueItem item,
    PrintQueueProvider provider,
  ) {
    final theme = FluentTheme.of(context);

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.accentColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Imprimindo Agora', style: theme.typography.caption),
                    const SizedBox(height: 4),
                    Text(
                      item.documentName,
                      style: theme.typography.title?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const ProgressRing(value: null),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(FluentIcons.print, size: 16),
              const SizedBox(width: 8),
              Text(item.printerName),
              const Spacer(),
              if (item.totalPages > 0)
                Text(
                  '${item.totalPages} página${item.totalPages > 1 ? 's' : ''}',
                  style: const TextStyle(fontSize: 12),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQueueItemCard(
    BuildContext context,
    PrintQueueItem item,
    PrintQueueProvider provider, {
    required bool isCurrent,
  }) {
    final theme = FluentTheme.of(context);

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildStatusIcon(item.status),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.documentName, style: theme.typography.bodyStrong),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          item.printerName,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                        ),
                        if (item.totalPages > 0) ...[
                          const SizedBox(width: 8),
                          Text(
                            '• ${item.totalPages} pág',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(item.status),
            ],
          ),
          if (item.errorMessage != null) ...[
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
                      item.errorMessage!,
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
          const SizedBox(height: 8),
          Row(
            children: [
              if (item.retryCount > 0)
                InfoLabel(
                  label: 'Tentativas: ${item.retryCount}',
                  child: const SizedBox.shrink(),
                ),
              const Spacer(),
              if (item.status == PrintQueueItemStatus.pending ||
                  item.status == PrintQueueItemStatus.failed)
                ActionButton(
                  label: 'Cancelar',
                  icon: FluentIcons.cancel,
                  onPressed: () => provider.cancel(item.id),
                  iconSize: 14,
                ),
                if (item.status == PrintQueueItemStatus.failed)
                 AppButton(
                    label: 'Tentar Novamente',
                    icon: FluentIcons.refresh,
                    onPressed: () => provider.retry(item.id),
                    isPrimary: true,
                  ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    required IconData icon,
    Widget? trailing,
  }) {
    final theme = FluentTheme.of(context);

    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Text(title, style: theme.typography.title),
        const Spacer(),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _buildStatusIcon(PrintQueueItemStatus status) {
    switch (status) {
      case PrintQueueItemStatus.pending:
        return const Icon(
          FluentIcons.all_apps,
          size: 20,
          color: Color(0xFF0078D4),
        );
      case PrintQueueItemStatus.waitingPrinter:
        return const Icon(
          FluentIcons.clock,
          size: 20,
          color: Color(0xFFFF8C00),
        );
      case PrintQueueItemStatus.sending:
        return const Icon(FluentIcons.send, size: 20, color: Color(0xFF0078D4));
      case PrintQueueItemStatus.sent:
        return const Icon(
          FluentIcons.check_mark,
          size: 20,
          color: Color(0xFF107C10),
        );
      case PrintQueueItemStatus.failed:
        return const Icon(
          FluentIcons.error,
          size: 20,
          color: Color(0xFFD13438),
        );
      case PrintQueueItemStatus.cancelled:
        return const Icon(
          FluentIcons.cancel,
          size: 20,
          color: Color(0xFF999999),
        );
    }
  }

  Widget _buildStatusBadge(PrintQueueItemStatus status) {
    String label;
    Color color;

    switch (status) {
      case PrintQueueItemStatus.pending:
        label = 'Pendente';
        color = const Color(0xFF0078D4);
        break;
      case PrintQueueItemStatus.waitingPrinter:
        label = 'Aguardando';
        color = const Color(0xFFFF8C00);
        break;
      case PrintQueueItemStatus.sending:
        label = 'Enviando';
        color = const Color(0xFF0078D4);
        break;
      case PrintQueueItemStatus.sent:
        label = 'Enviado';
        color = const Color(0xFF107C10);
        break;
      case PrintQueueItemStatus.failed:
        label = 'Falhou';
        color = const Color(0xFFD13438);
        break;
      case PrintQueueItemStatus.cancelled:
        label = 'Cancelado';
        color = const Color(0xFF999999);
        break;
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

  Widget _buildEmptyState(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FluentIcons.print, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('Fila Vazia', style: theme.typography.title),
            const SizedBox(height: 8),
            const Text(
              'Não há jobs de impressão na fila',
              style: TextStyle(color: Color(0xFF999999)),
            ),
          ],
        ),
      ),
    );
  }
}
