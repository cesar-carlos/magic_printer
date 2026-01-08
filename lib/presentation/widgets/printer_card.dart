import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;

import '../../application/application.dart';
import '../../shared/shared.dart';

class PrinterCard extends StatelessWidget {
  final PrinterDTO printer;
  final VoidCallback? onTap;
  final VoidCallback? onTest;
  final VoidCallback? onConfigure;
  final VoidCallback? onDelete;

  const PrinterCard({
    super.key,
    required this.printer,
    this.onTap,
    this.onTest,
    this.onConfigure,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final statusColor = _getStatusColor(context);

    return AppCard(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _StatusIndicator(status: printer.status, color: statusColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          printer.displayName,
                          style: theme.typography.subtitle?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Mostrar nome original se houver apelido
                        if (printer.alias != null &&
                            printer.alias!.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            'Original: ${printer.name}',
                            style: theme.typography.caption?.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Badge de tipo
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: printer.isRemote
                          ? const Color(0xFF0078D4).withValues(alpha: 0.1)
                          : const Color(0xFF107C10).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      printer.isRemote ? 'REMOTA' : 'LOCAL',
                      style: theme.typography.caption?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: printer.isRemote
                            ? const Color(0xFF0078D4)
                            : const Color(0xFF107C10),
                      ),
                    ),
                  ),
                ],
              ),
              // Descrição personalizada (comment)
              if (printer.comment != null && printer.comment!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  printer.comment!,
                  style: theme.typography.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (printer.hostId != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Host: ${printer.hostId}',
                  style: theme.typography.caption,
                ),
              ],
              if (printer.locationDescription != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Localização: ${printer.locationDescription!}',
                  style: theme.typography.caption,
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.end,
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (onTest != null)
                    ActionButton(
                      label: 'Testar',
                      icon: Icons.print,
                      onPressed: onTest,
                    ),
                  if (onConfigure != null)
                    ActionButton(
                      label: 'Configurar',
                      icon: Icons.settings,
                      onPressed: onConfigure,
                    ),
                  if (onTap != null)
                    ActionButton(
                      label: 'Detalhes',
                      icon: Icons.info_outline,
                      onPressed: onTap,
                    ),
                  // Botão de remover apenas para impressoras remotas
                  if (printer.isRemote && onDelete != null)
                    ActionButton(
                      label: 'Remover',
                      icon: Icons.delete_outline,
                      onPressed: onDelete,
                      isDestructive: true,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context) {
    switch (printer.status) {
      case 'online':
        return const Color(0xFF107C10); // Green
      case 'offline':
        return const Color(0xFFD13438); // Red
      case 'paused':
        return const Color(0xFFFF8C00); // Orange
      default:
        return FluentTheme.of(
              context,
            ).typography.body?.color?.withValues(alpha: 0.5) ??
            const Color(0xFF808080);
    }
  }
}

class _StatusIndicator extends StatelessWidget {
  final String status;
  final Color color;

  const _StatusIndicator({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
