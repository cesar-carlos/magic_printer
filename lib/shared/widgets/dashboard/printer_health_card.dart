import 'package:fluent_ui/fluent_ui.dart';

import '../../../application/application.dart';
import '../../../domain/domain.dart';
import 'dashboard_card.dart';

class PrinterHealthCard extends StatelessWidget {
  final PrinterHealth health;
  final PrinterDTO? printer;

  const PrinterHealthCard({
    super.key,
    required this.health,
    this.printer,
  });

  @override
  Widget build(BuildContext context) {
    Color healthColor;
    String healthStatus;

    if (health.isHealthy) {
      healthColor = Colors.green;
      healthStatus = 'Saudável';
    } else if (health.isWarning) {
      healthColor = Colors.orange;
      healthStatus = 'Atenção';
    } else {
      healthColor = Colors.red;
      healthStatus = 'Crítico';
    }

    return DashboardCard(
      title: 'Saúde da Impressora',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                printer?.displayName ?? 'Impressora',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: healthColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  healthStatus,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetric(
                  'Health Score',
                  '${health.healthScore}',
                  healthColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetric(
                  'Disponibilidade',
                  '${(health.availability * 100).toStringAsFixed(1)}%',
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetric(
                  'Taxa de Erro',
                  '${(health.errorRate * 100).toStringAsFixed(1)}%',
                  health.errorRate > 0.1 ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetric(
                  'Suprimentos',
                  '${health.supplyScore}',
                  health.supplyScore > 50 ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
