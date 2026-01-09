import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../application/application.dart';
import '../../../core/routes/route_names.dart';
import 'dashboard_card.dart';

class DashboardPrinterCard extends StatelessWidget {
  final PrinterDTO printer;

  const DashboardPrinterCard({
    super.key,
    required this.printer,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(printer.status);
    final statusIcon = _getStatusIcon(printer.status);

    return DashboardCard(
      title: printer.displayName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      printer.displayName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getStatusLabel(printer.status),
                      style: TextStyle(
                        fontSize: 12,
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (printer.jobCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0078D4).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${printer.jobCount} job${printer.jobCount > 1 ? 's' : ''}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0078D4),
                    ),
                  ),
                ),
            ],
          ),
          if (printer.locationDescription != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  FluentIcons.location,
                  size: 14,
                  color: Color(0xFF999999),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    printer.locationDescription!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              _InfoChip(
                icon: printer.isLocal ? FluentIcons.print : FluentIcons.server,
                label: printer.isLocal ? 'Local' : 'Remota',
              ),
              const SizedBox(width: 8),
              if (printer.hostId != null)
                _InfoChip(
                  icon: FluentIcons.server,
                  label: 'Host: ${printer.hostId!.substring(0, 8)}...',
                ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: HyperlinkButton(
              onPressed: () {
                context.go('${RouteNames.printers}/${printer.id}');
              },
              child: const Text('Ver detalhes'),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'online':
        return const Color(0xFF107C10);
      case 'offline':
        return const Color(0xFF999999);
      case 'error':
        return const Color(0xFFD13438);
      case 'paused':
        return const Color(0xFFFF8C00);
      case 'printing':
        return const Color(0xFF0078D4);
      default:
        return const Color(0xFF999999);
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'online':
        return FluentIcons.check_mark;
      case 'offline':
        return FluentIcons.circle_stop;
      case 'error':
        return FluentIcons.error;
      case 'paused':
        return FluentIcons.pause;
      case 'printing':
        return FluentIcons.print;
      default:
        return FluentIcons.print;
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'online':
        return 'Online';
      case 'offline':
        return 'Offline';
      case 'error':
        return 'Erro';
      case 'paused':
        return 'Pausada';
      case 'printing':
        return 'Imprimindo';
      default:
        return status;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: const Color(0xFF999999),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}
