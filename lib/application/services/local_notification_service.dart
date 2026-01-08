import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';

const _debounceTime = Duration(seconds: 30);
const _maxCachedNotifications = 100;

class LocalNotificationService implements ILocalNotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final Map<String, DateTime> _lastNotificationTime = {};
  final Map<String, PrinterStatus> _lastKnownStatus = {};
  bool _isEnabled = true;

  @override
  bool get isEnabled => _isEnabled;

  @override
  void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  LocalNotificationService();

  @override
  Future<void> initialize() async {
    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initializationSettingsIOS = DarwinInitializationSettings();
    const initializationSettingsWindows = WindowsInitializationSettings(
      appName: appName,
      appUserModelId: 'com.magicprinter.app',
      guid: 'E5A5F8F3-5B4E-4D3C-9A8B-1C2D3E4F5A6B',
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      windows: initializationSettingsWindows,
    );

    await _notificationsPlugin.initialize(initializationSettings);
  }

  @override
  Future<void> showPrinterStatusChanged({
    required String printerName,
    required PrinterStatus oldStatus,
    required PrinterStatus newStatus,
  }) async {
    if (!_isEnabled) {
      return;
    }

    if (!_shouldNotify(printerName, newStatus)) {
      return;
    }

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'printer_status_channel',
        'Status da Impressora',
        channelDescription: 'Notificações de status de impressora',
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
      ),
      windows: WindowsNotificationDetails(),
    );

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch,
      'printer_status_$printerName',
      'Impressora: $printerName',
      notificationDetails,
      payload: 'printer:$printerName',
    );

    _recordNotification(printerName, newStatus);
  }

  @override
  Future<void> showJobCompleted({
    required String printerName,
    required String documentName,
  }) async {
    if (!_isEnabled) {
      return;
    }

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'job_completed_channel',
        'Job Concluído',
        channelDescription: 'Notificações de jobs concluídos',
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
      ),
      windows: WindowsNotificationDetails(),
    );

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch,
      'job_completed_$printerName',
      'Job Concluído',
      notificationDetails,
      payload: 'printer:$printerName',
    );
  }

  @override
  Future<void> showPrinterError({
    required String printerName,
    required String error,
  }) async {
    if (!_isEnabled) {
      return;
    }

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'printer_error_channel',
        'Erro na Impressora',
        channelDescription: 'Notificações de erros de impressora',
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
      ),
      windows: WindowsNotificationDetails(),
    );

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch,
      'printer_error_$printerName',
      'Erro: $printerName',
      notificationDetails,
      payload: 'printer:$printerName',
    );
  }

  @override
  Future<void> clearAll() async {
    await _notificationsPlugin.cancelAll();
    _lastNotificationTime.clear();
    _lastKnownStatus.clear();
  }

  bool _shouldNotify(String printerName, PrinterStatus newStatus) {
    final lastTime = _lastNotificationTime[printerName];
    if (lastTime != null) {
      final timeSinceLastNotification = DateTime.now().difference(lastTime);
      if (timeSinceLastNotification < _debounceTime) {
        return false;
      }
    }

    final lastStatus = _lastKnownStatus[printerName];
    _lastKnownStatus[printerName] = newStatus;

    if (lastStatus == newStatus) {
      return false;
    }

    _cleanupCache();

    return true;
  }

  void _recordNotification(String printerName, PrinterStatus status) {
    _lastNotificationTime[printerName] = DateTime.now();
    _lastKnownStatus[printerName] = status;
  }

  void _cleanupCache() {
    if (_lastNotificationTime.length > _maxCachedNotifications) {
      final oldestKey = _lastNotificationTime.keys.first;
      _lastNotificationTime.remove(oldestKey);
      _lastKnownStatus.remove(oldestKey);
    }
  }
}
