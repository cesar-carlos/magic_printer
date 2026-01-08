import 'package:fluent_ui/fluent_ui.dart';

import '../../application/dtos/host_dto.dart';
import '../../shared/shared.dart';

class HostCard extends StatelessWidget {
  final HostDTO host;
  final VoidCallback? onTap;
  final VoidCallback? onRefresh;
  final VoidCallback? onConfigure;

  const HostCard({
    super.key,
    required this.host,
    this.onTap,
    this.onRefresh,
    this.onConfigure,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final statusColor = _statusColor(host.status);

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
                  _StatusDot(color: statusColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      host.name,
                      style: theme.typography.subtitle?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (host.requiresAuth)
                    _Badge(
                      label: host.isAuthenticated ? 'AUTENTICADO' : 'AUTH',
                      color: host.isAuthenticated
                          ? const Color(0xFF107C10)
                          : const Color(0xFFFF8C00),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                host.fullAddress,
                style: theme.typography.body,
              ),
              if (host.version != null && host.version!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  'Versão: ${host.version}',
                  style: theme.typography.caption,
                ),
              ],
              if (host.lastSeen != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Último contato: ${host.lastSeen}',
                  style: theme.typography.caption,
                ),
              ],
              if (host.supportedFeatures.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Features: ${host.supportedFeatures.join(', ')}',
                  style: theme.typography.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.end,
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (onRefresh != null)
                    ActionButton(
                      label: 'Atualizar',
                      icon: FluentIcons.refresh,
                      onPressed: onRefresh,
                    ),
                  if (onConfigure != null)
                    ActionButton(
                      label: 'Configurar',
                      icon: FluentIcons.settings,
                      onPressed: onConfigure,
                    ),
                  if (onTap != null)
                    ActionButton(
                      label: 'Detalhes',
                      icon: FluentIcons.info,
                      onPressed: onTap,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'online':
        return const Color(0xFF107C10);
      case 'offline':
        return const Color(0xFFD13438);
      case 'error':
        return const Color(0xFFD13438);
      case 'connecting':
        return const Color(0xFF0078D4);
      default:
        return const Color(0xFF808080);
    }
  }
}

class _StatusDot extends StatelessWidget {
  final Color color;

  const _StatusDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: theme.typography.caption?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

