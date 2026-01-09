import 'package:fluent_ui/fluent_ui.dart';

import '../../../application/application.dart';
import '../../../domain/domain.dart';
import 'dashboard_card.dart';

class ActionHistoryCard extends StatelessWidget {
  final AutomatedAction action;
  final PrinterDTO? printer;

  const ActionHistoryCard({
    super.key,
    required this.action,
    this.printer,
  });

  @override
  Widget build(BuildContext context) {
    String actionText;
    IconData icon;
    Color color;

    switch (action.actionType) {
      case ActionType.pausePrinter:
        actionText = 'Impressora Pausada';
        icon = FluentIcons.pause;
        color = Colors.orange;
        break;
      case ActionType.redirectJobs:
        actionText = 'Jobs Redirecionados';
        icon = FluentIcons.forward;
        color = Colors.blue;
        break;
      case ActionType.clearQueue:
        actionText = 'Fila Limpa';
        icon = FluentIcons.delete;
        color = Colors.red;
        break;
      case ActionType.restartService:
        actionText = 'Serviço Reiniciado';
        icon = FluentIcons.refresh;
        color = Colors.blue;
        break;
      case ActionType.sendAlert:
        actionText = 'Alerta Enviado';
        icon = FluentIcons.warning;
        color = Colors.yellow;
        break;
    }

    String resultText;
    Color resultColor;

    switch (action.result) {
      case ActionResult.success:
        resultText = 'Sucesso';
        resultColor = Colors.green;
        break;
      case ActionResult.failed:
        resultText = 'Falhou';
        resultColor = Colors.red;
        break;
      case ActionResult.skipped:
        resultText = 'Ignorado';
        resultColor = Colors.grey;
        break;
    }

    final timeAgo = DateTime.now().difference(action.executedAt);

    return DashboardCard(
      child: Row(
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actionText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  printer?.displayName ?? 'Impressora',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                if (action.errorMessage != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    action.errorMessage!,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: resultColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  resultText,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: resultColor,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatTimeAgo(timeAgo),
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(Duration duration) {
    if (duration.inMinutes < 1) {
      return 'Agora';
    } else if (duration.inHours < 1) {
      return '${duration.inMinutes}m atrás';
    } else if (duration.inDays < 1) {
      return '${duration.inHours}h atrás';
    } else {
      return '${duration.inDays}d atrás';
    }
  }
}
