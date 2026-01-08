import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/core.dart';

enum MessageType { success, info, warning, error }

class MessageModal extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonLabel;
  final MessageType type;

  const MessageModal({
    super.key,
    required this.title,
    required this.message,
    this.buttonLabel,
    this.type = MessageType.success,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    String? buttonLabel,
    MessageType type = MessageType.success,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => MessageModal(
        title: title,
        message: message,
        buttonLabel: buttonLabel,
        type: type,
      ),
    );
  }

  static Future<void> showSuccess(
    BuildContext context, {
    required String message,
    String title = 'Sucesso',
    String? buttonLabel,
  }) {
    return show(
      context,
      title: title,
      message: message,
      buttonLabel: buttonLabel,
      type: MessageType.success,
    );
  }

  static Future<void> showInfo(
    BuildContext context, {
    required String message,
    String title = 'Informação',
    String? buttonLabel,
  }) {
    return show(
      context,
      title: title,
      message: message,
      buttonLabel: buttonLabel,
      type: MessageType.info,
    );
  }

  static Future<void> showWarning(
    BuildContext context, {
    required String message,
    String title = 'Atenção',
    String? buttonLabel,
  }) {
    return show(
      context,
      title: title,
      message: message,
      buttonLabel: buttonLabel,
      type: MessageType.warning,
    );
  }

  static Future<void> showError(
    BuildContext context, {
    required String message,
    String title = 'Erro',
    String? buttonLabel,
  }) {
    return show(
      context,
      title: title,
      message: message,
      buttonLabel: buttonLabel,
      type: MessageType.error,
    );
  }

  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String message,
    String title = 'Confirmação',
    String confirmLabel = 'Confirmar',
    String cancelLabel = 'Cancelar',
    MessageType type = MessageType.warning,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ContentDialog(
        title: Row(
          children: [
            Icon(
              type == MessageType.error
                  ? FluentIcons.error
                  : FluentIcons.warning,
              color: type == MessageType.error
                  ? AppColors.error
                  : AppColors.warning,
              size: 28,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: FluentTheme.of(
                  context,
                ).typography.title?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: WindowConstraints.messageModalWidth,
          ),
          child: SizedBox(
            width: WindowConstraints.messageModalWidth,
            child: SingleChildScrollView(
              child: Text(
                message,
                style: FluentTheme.of(context).typography.body,
              ),
            ),
          ),
        ),
        actions: [
          Button(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelLabel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                type == MessageType.error ? AppColors.error : AppColors.warning,
              ),
            ),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  Color _getColor(BuildContext context) {
    switch (type) {
      case MessageType.success:
        return AppColors.success;
      case MessageType.info:
        return AppColors.primary;
      case MessageType.warning:
        return AppColors.warning;
      case MessageType.error:
        return AppColors.error;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case MessageType.success:
        return FluentIcons.check_mark;
      case MessageType.info:
        return FluentIcons.info;
      case MessageType.warning:
        return FluentIcons.warning;
      case MessageType.error:
        return FluentIcons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final icon = _getIcon();
    final theme = FluentTheme.of(context);

    return ContentDialog(
      title: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: theme.typography.title?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: WindowConstraints.messageModalWidth,
        ),
        child: SizedBox(
          width: WindowConstraints.messageModalWidth,
          child: SingleChildScrollView(
            child: Text(message, style: theme.typography.body),
          ),
        ),
      ),
      actions: [
        Button(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(buttonLabel ?? 'OK'),
        ),
      ],
    );
  }
}
