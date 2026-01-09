import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../application/application.dart';

class PrinterStatusPieChart extends StatelessWidget {
  final PrinterMetrics metrics;

  const PrinterStatusPieChart({
    super.key,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    if (metrics.total == 0) {
      return const Center(
        child: Text(
          'Nenhuma impressora disponível',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF999999),
          ),
        ),
      );
    }

    final sections = <PieChartSectionData>[];

    if (metrics.online > 0) {
      sections.add(
        PieChartSectionData(
          value: metrics.online.toDouble(),
          color: const Color(0xFF107C10),
          title: '${metrics.online}',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    if (metrics.offline > 0) {
      sections.add(
        PieChartSectionData(
          value: metrics.offline.toDouble(),
          color: const Color(0xFF999999),
          title: '${metrics.offline}',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    if (metrics.error > 0) {
      sections.add(
        PieChartSectionData(
          value: metrics.error.toDouble(),
          color: const Color(0xFFD13438),
          title: '${metrics.error}',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    if (metrics.paused > 0) {
      sections.add(
        PieChartSectionData(
          value: metrics.paused.toDouble(),
          color: const Color(0xFFFF8C00),
          title: '${metrics.paused}',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: sections,
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            if (metrics.online > 0)
              _LegendItem(
                color: const Color(0xFF107C10),
                label: 'Online',
                value: metrics.online,
              ),
            if (metrics.offline > 0)
              _LegendItem(
                color: const Color(0xFF999999),
                label: 'Offline',
                value: metrics.offline,
              ),
            if (metrics.error > 0)
              _LegendItem(
                color: const Color(0xFFD13438),
                label: 'Erro',
                value: metrics.error,
              ),
            if (metrics.paused > 0)
              _LegendItem(
                color: const Color(0xFFFF8C00),
                label: 'Pausadas',
                value: metrics.paused,
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
  final int value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
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
          '$label: $value',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF999999),
          ),
        ),
      ],
    );
  }
}
