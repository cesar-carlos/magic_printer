import 'package:fluent_ui/fluent_ui.dart';

import '../../infrastructure/network/host_discovery_listener.dart';
import 'common/app_card.dart';
import 'common/action_button.dart';

class DiscoveredHostCard extends StatelessWidget {
  final DiscoveredHost host;
  final VoidCallback? onAdd;
  final bool isAlreadyAdded;

  const DiscoveredHostCard({
    super.key,
    required this.host,
    this.onAdd,
    this.isAlreadyAdded = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF107C10),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    host.hostName,
                    style: theme.typography.subtitle?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isAlreadyAdded)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0078D4).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'JÁ ADICIONADO',
                      style: theme.typography.caption?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0078D4),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${host.ip}:${host.port}',
              style: theme.typography.body,
            ),
            if (host.version.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Versão: ${host.version}',
                style: theme.typography.caption,
              ),
            ],
            const SizedBox(height: 4),
            Text(
              'Descoberto: ${_formatDateTime(host.discoveredAt)}',
              style: theme.typography.caption,
            ),
            const SizedBox(height: 12),
            if (onAdd != null && !isAlreadyAdded)
              Align(
                alignment: Alignment.centerRight,
                child: ActionButton(
                  label: 'Adicionar',
                  icon: FluentIcons.add,
                  onPressed: onAdd,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'há ${difference.inSeconds}s';
    } else if (difference.inMinutes < 60) {
      return 'há ${difference.inMinutes}min';
    } else if (difference.inHours < 24) {
      return 'há ${difference.inHours}h';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
