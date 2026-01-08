import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String status;
  final String? label;

  const StatusIndicator({
    super.key,
    required this.status,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(context);
    final displayLabel = label ?? status;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          displayLabel,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(BuildContext context) {
    switch (status.toLowerCase()) {
      case 'online':
      case 'active':
      case 'connected':
        return Colors.green;
      case 'offline':
      case 'inactive':
      case 'disconnected':
        return Colors.red;
      case 'paused':
      case 'warning':
        return Colors.orange;
      case 'pending':
        return Colors.blue;
      default:
        return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5);
    }
  }
}

