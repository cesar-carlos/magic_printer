import 'package:fluent_ui/fluent_ui.dart';

import '../../../application/application.dart';
import '../../../domain/domain.dart';
import 'dashboard_card.dart';

class PredictionCard extends StatelessWidget {
  final Prediction prediction;
  final PrinterDTO? printer;

  const PredictionCard({super.key, required this.prediction, this.printer});

  @override
  Widget build(BuildContext context) {
    String typeText;
    IconData icon;
    Color color;

    switch (prediction.type) {
      case PredictionType.tonerDepletion:
        typeText = 'Toner Acabando';
        icon = FluentIcons.print;
        color = Colors.orange;
        break;
      case PredictionType.paperDepletion:
        typeText = 'Papel Acabando';
        icon = FluentIcons.page;
        color = Colors.orange;
        break;
      case PredictionType.maintenanceNeeded:
        typeText = 'Manutenção Necessária';
        icon = FluentIcons.toolbox;
        color = Colors.blue;
        break;
      case PredictionType.failureLikelihood:
        typeText = 'Risco de Falha';
        icon = FluentIcons.warning;
        color = Colors.red;
        break;
      case PredictionType.queueOverload:
        typeText = 'Sobrecarga de Fila';
        icon = FluentIcons.list;
        color = Colors.yellow;
        break;
    }

    final daysUntil = prediction.predictedDate
        .difference(DateTime.now())
        .inDays;

    return DashboardCard(
      child: Row(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typeText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  printer?.displayName ?? 'Impressora',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  daysUntil > 0
                      ? 'Em $daysUntil dias'
                      : daysUntil == 0
                      ? 'Hoje'
                      : 'Atrasado',
                  style: TextStyle(
                    fontSize: 12,
                    color: daysUntil < 7 ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${(prediction.confidence * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
