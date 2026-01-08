import 'package:flutter/widgets.dart';
import '../../shared/shared.dart';

class ErrorListener extends StatefulWidget {
  final Widget child;
  final String? error;
  final VoidCallback? onErrorShown;

  const ErrorListener({
    super.key,
    required this.child,
    this.error,
    this.onErrorShown,
  });

  @override
  State<ErrorListener> createState() => _ErrorListenerState();
}

class _ErrorListenerState extends State<ErrorListener> {
  String? _previousError;

  @override
  void didUpdateWidget(ErrorListener oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.error != _previousError && widget.error != null && widget.error!.isNotEmpty) {
      _previousError = widget.error;
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && widget.error != null && widget.error!.isNotEmpty) {
          MessageModal.showError(
            context,
            title: 'Erro',
            message: widget.error!,
            buttonLabel: 'OK',
          ).then((_) {
            if (mounted) {
              widget.onErrorShown?.call();
            }
          });
        }
      });
    } else if (widget.error == null || widget.error!.isEmpty) {
      _previousError = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

