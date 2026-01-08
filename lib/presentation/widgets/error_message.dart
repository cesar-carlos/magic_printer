import 'package:fluent_ui/fluent_ui.dart';

class ErrorMessage extends StatelessWidget {
  final String? error;
  final VoidCallback? onDismiss;

  const ErrorMessage({
    super.key,
    this.error,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (error == null || error!.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final errorColor = isDark
        ? const Color(0xFFD13438) // Red para dark
        : const Color(0xFFDC3545); // Red para light

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: errorColor.withValues(alpha: 0.1),
        border: Border.all(
          color: errorColor.withValues(alpha: 0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            FluentIcons.error,
            color: errorColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              error!,
              style: theme.typography.body?.copyWith(
                color: errorColor,
              ),
            ),
          ),
          if (onDismiss != null)
            IconButton(
              icon: const Icon(FluentIcons.clear, size: 18),
              onPressed: onDismiss,
            ),
        ],
      ),
    );
  }
}

