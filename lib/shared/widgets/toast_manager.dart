import 'package:fluent_ui/fluent_ui.dart';

import '../../domain/domain.dart';

class ToastManager {
  static final ToastManager _instance = ToastManager._internal();
  factory ToastManager() => _instance;
  ToastManager._internal();

  static void showLog(BuildContext context, AppLog log) {
    final severity = _getSeverity(log.level);
    final icon = _getIcon(log.level);
    final color = _getColor(log.level);

    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  log.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(log.message),
              if (log.details != null) ...[
                const SizedBox(height: 8),
                Expander(
                  header: const Text('Ver detalhes'),
                  content: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[190],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SelectableText(
                      log.details!,
                      style: const TextStyle(fontFamily: 'monospace'),
                    ),
                  ),
                ),
              ],
            ],
          ),
          severity: severity,
          isLong: log.details != null,
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
        );
      },
      duration: _getDuration(log.level),
    );
  }

  static void showSuccess(BuildContext context, String title, String message) {
    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: Row(
            children: [
              Icon(FluentIcons.completed, color: Colors.green, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(message),
          severity: InfoBarSeverity.success,
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
        );
      },
      duration: const Duration(seconds: 5),
    );
  }

  static void showError(BuildContext context, String title, String message, {String? details}) {
    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: Row(
            children: [
              Icon(FluentIcons.error_badge, color: Colors.red, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message),
              if (details != null) ...[
                const SizedBox(height: 8),
                Expander(
                  header: const Text('Ver detalhes'),
                  content: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[190],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SelectableText(
                      details,
                      style: const TextStyle(fontFamily: 'monospace'),
                    ),
                  ),
                ),
              ],
            ],
          ),
          severity: InfoBarSeverity.error,
          isLong: details != null,
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
        );
      },
      duration: const Duration(seconds: 10),
    );
  }

  static void showWarning(BuildContext context, String title, String message) {
    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: Row(
            children: [
              Icon(FluentIcons.warning, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(message),
          severity: InfoBarSeverity.warning,
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
        );
      },
      duration: const Duration(seconds: 7),
    );
  }

  static void showInfo(BuildContext context, String title, String message) {
    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: Row(
            children: [
              Icon(FluentIcons.info, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(message),
          severity: InfoBarSeverity.info,
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
        );
      },
      duration: const Duration(seconds: 5),
    );
  }

  static InfoBarSeverity _getSeverity(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return InfoBarSeverity.info;
      case AppLogLevel.info:
        return InfoBarSeverity.info;
      case AppLogLevel.warning:
        return InfoBarSeverity.warning;
      case AppLogLevel.error:
        return InfoBarSeverity.error;
      case AppLogLevel.fatal:
        return InfoBarSeverity.error;
    }
  }

  static IconData _getIcon(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return FluentIcons.developer_tools;
      case AppLogLevel.info:
        return FluentIcons.info;
      case AppLogLevel.warning:
        return FluentIcons.warning;
      case AppLogLevel.error:
        return FluentIcons.error_badge;
      case AppLogLevel.fatal:
        return FluentIcons.status_error_full;
    }
  }

  static Color _getColor(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return Colors.grey;
      case AppLogLevel.info:
        return Colors.blue;
      case AppLogLevel.warning:
        return Colors.orange;
      case AppLogLevel.error:
        return Colors.red;
      case AppLogLevel.fatal:
        return Colors.red.darker;
    }
  }

  static Duration _getDuration(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return const Duration(seconds: 3);
      case AppLogLevel.info:
        return const Duration(seconds: 5);
      case AppLogLevel.warning:
        return const Duration(seconds: 7);
      case AppLogLevel.error:
        return const Duration(seconds: 10);
      case AppLogLevel.fatal:
        return const Duration(seconds: 15);
    }
  }
}
