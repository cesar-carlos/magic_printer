import 'package:fluent_ui/fluent_ui.dart';

class MetricCard extends StatelessWidget {
  final String label;
  final int value;
  final Color? color;
  final IconData? icon;
  final String? subtitle;

  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    this.color,
    this.icon,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = const Color(0xFF0078D4);
    final metricColor = color ?? defaultColor;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: metricColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: metricColor.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: metricColor,
              size: 32,
            ),
            const SizedBox(height: 12),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: metricColor.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: metricColor,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12,
                color: metricColor.withValues(alpha: 0.6),
              ),
            ),
          ],
          if (subtitle == null) const SizedBox(height: 4),
        ],
      ),
    );
  }
}
