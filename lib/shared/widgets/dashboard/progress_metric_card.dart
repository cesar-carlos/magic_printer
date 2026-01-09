import 'package:fluent_ui/fluent_ui.dart';

import 'dashboard_card.dart';

class ProgressMetricCard extends StatelessWidget {
  final String title;
  final double value;
  final double max;
  final Color? color;
  final String? subtitle;
  final List<MetricRow>? metrics;

  const ProgressMetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.max,
    this.color,
    this.subtitle,
    this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = const Color(0xFF0078D4);
    final progressColor = color ?? defaultColor;
    final percentage = max > 0 ? (value / max) * 100 : 0.0;

    return DashboardCard(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (metrics != null) ...[
            ...metrics!.map((metric) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _MetricRow(
                    label: metric.label,
                    value: metric.value,
                    color: metric.color,
                  ),
                )),
            const SizedBox(height: 8),
          ],
          ProgressBar(
            value: percentage / 100,
            backgroundColor: progressColor.withValues(alpha: 0.1),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: progressColor,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 12,
                    color: progressColor.withValues(alpha: 0.6),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class MetricRow {
  final String label;
  final int value;
  final Color? color;

  const MetricRow({
    required this.label,
    required this.value,
    this.color,
  });
}

class _MetricRow extends StatelessWidget {
  final String label;
  final int value;
  final Color? color;

  const _MetricRow({
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = const Color(0xFF0078D4);
    final metricColor = color ?? defaultColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: metricColor.withValues(alpha: 0.8),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: metricColor,
          ),
        ),
      ],
    );
  }
}
