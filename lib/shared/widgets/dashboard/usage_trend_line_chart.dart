import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../application/application.dart';

class UsageTrendLineChart extends StatelessWidget {
  final List<UsageTrend> trends;

  const UsageTrendLineChart({
    super.key,
    required this.trends,
  });

  @override
  Widget build(BuildContext context) {
    if (trends.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Não há dados de tendência disponíveis',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF999999),
            ),
          ),
        ),
      );
    }

    final maxJobs = trends
        .map((t) => t.totalJobs)
        .reduce((a, b) => a > b ? a : b);
    
    final maxValue = (maxJobs > 0 ? maxJobs.toDouble() : 10.0) * 1.2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxValue > 0 ? maxValue / 5 : 1.0,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xFFE5E5E5).withValues(alpha: 0.3),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: trends.length > 7 ? 2 : 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < trends.length) {
                        final date = trends[index].date;
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '${date.day}/${date.month}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF999999),
                            ),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    interval: maxValue > 0 ? maxValue / 5 : 1.0,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF999999),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: const Color(0xFFE5E5E5).withValues(alpha: 0.3),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: trends.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value.totalJobs.toDouble());
                  }).toList(),
                  isCurved: true,
                  color: const Color(0xFF0078D4),
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color(0xFF0078D4).withValues(alpha: 0.1),
                  ),
                ),
                LineChartBarData(
                  spots: trends.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value.successJobs.toDouble());
                  }).toList(),
                  isCurved: true,
                  color: const Color(0xFF107C10),
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color(0xFF107C10).withValues(alpha: 0.1),
                  ),
                ),
                LineChartBarData(
                  spots: trends.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value.failedJobs.toDouble());
                  }).toList(),
                  isCurved: true,
                  color: const Color(0xFFD13438),
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color(0xFFD13438).withValues(alpha: 0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            _LegendItem(
              color: const Color(0xFF0078D4),
              label: 'Total',
            ),
            _LegendItem(
              color: const Color(0xFF107C10),
              label: 'Sucesso',
            ),
            _LegendItem(
              color: const Color(0xFFD13438),
              label: 'Falhados',
            ),
          ],
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF999999),
          ),
        ),
      ],
    );
  }
}
