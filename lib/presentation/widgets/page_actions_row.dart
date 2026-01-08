import 'package:fluent_ui/fluent_ui.dart';

class PageAction {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const PageAction({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
  });
}

class PageActionsRow extends StatelessWidget {
  final List<PageAction> actions;

  const PageActionsRow({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (var i = 0; i < actions.length; i++) ...[
          _ActionButton(action: actions[i]),
          if (i != actions.length - 1) const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final PageAction action;

  const _ActionButton({required this.action});

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(action.icon, size: 16),
        const SizedBox(width: 8),
        Text(action.label),
      ],
    );

    if (action.isPrimary) {
      return FilledButton(
        onPressed: action.onPressed,
        child: content,
      );
    }

    return Button(
      onPressed: action.onPressed,
      child: content,
    );
  }
}

