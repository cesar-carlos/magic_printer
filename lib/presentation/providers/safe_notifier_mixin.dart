import 'package:flutter/foundation.dart';

mixin SafeNotifierMixin on ChangeNotifier {
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed && hasListeners) {
      super.notifyListeners();
    }
  }
}
