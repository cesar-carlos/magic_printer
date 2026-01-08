import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/core.dart';

enum DialogType {
  destination,
  schedule,
  sqlServerConfig,
  sybaseConfig,
}

class ConstrainedDialog extends StatelessWidget {
  final Widget child;
  final DialogType type;
  final String? title;

  const ConstrainedDialog({
    super.key,
    required this.child,
    required this.type,
    this.title,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    required DialogType type,
    String? title,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => ConstrainedDialog(
        type: type,
        title: title,
        child: child,
      ),
    );
  }

  static BoxConstraints _getConstraints(DialogType type) {
    switch (type) {
      case DialogType.destination:
        return WindowConstraints.getDestinationDialogConstraints();
      case DialogType.schedule:
        return WindowConstraints.getScheduleDialogConstraints();
      case DialogType.sqlServerConfig:
        return WindowConstraints.getSqlServerConfigConstraints();
      case DialogType.sybaseConfig:
        return WindowConstraints.getSybaseConfigConstraints();
    }
  }

  @override
  Widget build(BuildContext context) {
    final constraints = _getConstraints(type);

    return ContentDialog(
      title: title != null ? Text(title!) : null,
      content: ConstrainedBox(
        constraints: constraints,
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
      actions: [
        Button(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}

