import 'dart:async';
import 'dart:io';

import 'package:logger/logger.dart';

import '../utils/windows_user_service.dart';

class IpcService {
  static const int _port = 50052; // Porta diferente do gRPC (50051)
  static const String _showWindowCommand = 'SHOW_WINDOW';
  static const String _getUserInfoCommand = 'GET_USER_INFO';
  static const String _userInfoResponsePrefix = 'USER_INFO:';

  final Logger _logger;
  ServerSocket? _server;
  Function()? _onShowWindow;
  bool _isRunning = false;

  IpcService({Logger? logger}) : _logger = logger ?? Logger();

  Future<bool> startServer({Function()? onShowWindow}) async {
    if (_isRunning) {
      _logger.d('IPC Server já está rodando');
      return true;
    }

    _onShowWindow = onShowWindow;

    try {
      _server = await ServerSocket.bind(InternetAddress.loopbackIPv4, _port);
      _isRunning = true;

      _logger.i('IPC Server iniciado na porta $_port');

      _server!.listen(
        _handleConnection,
        onError: (error) {
          _logger.e('Erro no IPC Server', error: error);
        },
        onDone: () {
          _logger.i('IPC Server encerrado');
          _isRunning = false;
        },
      );

      return true;
    } catch (e) {
      _logger.e('Erro ao iniciar IPC Server', error: e);
      _isRunning = false;
      return false;
    }
  }

  void _handleConnection(Socket socket) {
    _logger.d('Nova conexão IPC recebida');

    socket.listen(
      (data) async {
        try {
          final message = String.fromCharCodes(data).trim();
          _logger.d('Mensagem IPC recebida: $message');

          if (message == _showWindowCommand) {
            _logger.i('Comando SHOW_WINDOW recebido via IPC');
            _onShowWindow?.call();
          } else if (message == _getUserInfoCommand) {
            _logger.d('Comando GET_USER_INFO recebido via IPC');
            final username =
                WindowsUserService.getCurrentUsername() ?? 'Desconhecido';
            socket.write('$_userInfoResponsePrefix$username');
            await socket.flush();
            _logger.d('Resposta USER_INFO enviada: $username');
          }
        } catch (e) {
          _logger.e('Erro ao processar mensagem IPC', error: e);
        }
      },
      onError: (error) {
        _logger.e('Erro na conexão IPC', error: error);
      },
      onDone: () {
        socket.close();
      },
    );
  }

  static Future<bool> sendShowWindow() async {
    final logger = Logger();
    try {
      logger.i('Enviando comando SHOW_WINDOW via IPC...');

      final socket = await Socket.connect(
        InternetAddress.loopbackIPv4,
        _port,
        timeout: const Duration(seconds: 2),
      );

      socket.write(_showWindowCommand);
      await socket.flush();

      await Future.delayed(const Duration(milliseconds: 100));
      await socket.close();

      logger.i('Comando SHOW_WINDOW enviado com sucesso');
      return true;
    } catch (e) {
      logger.w('Não foi possível enviar comando IPC: $e');
      return false;
    }
  }

  static Future<bool> checkServerRunning() async {
    try {
      final socket = await Socket.connect(
        InternetAddress.loopbackIPv4,
        _port,
        timeout: const Duration(seconds: 1),
      );

      await socket.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getExistingInstanceUser() async {
    final logger = Logger();
    try {
      final socket = await Socket.connect(
        InternetAddress.loopbackIPv4,
        _port,
        timeout: const Duration(seconds: 2),
      );

      socket.write(_getUserInfoCommand);
      await socket.flush();

      final completer = Completer<String?>();

      socket.listen(
        (data) {
          final message = String.fromCharCodes(data).trim();
          if (message.startsWith(_userInfoResponsePrefix)) {
            final username = message.substring(_userInfoResponsePrefix.length);
            if (!completer.isCompleted) {
              completer.complete(username);
            }
          }
        },
        onDone: () {
          if (!completer.isCompleted) {
            completer.complete(null);
          }
          socket.close();
        },
        onError: (e) {
          if (!completer.isCompleted) {
            completer.complete(null);
          }
        },
      );

      return await completer.future.timeout(
        const Duration(seconds: 2),
        onTimeout: () => null,
      );
    } catch (e) {
      logger.d('Erro ao obter usuário da instância existente: $e');
      return null;
    }
  }

  Future<void> stop() async {
    if (_server != null) {
      try {
        await _server!.close();
        _isRunning = false;
        _logger.i('IPC Server parado');
      } catch (e) {
        _logger.e('Erro ao parar IPC Server', error: e);
      }
    }
  }

  bool get isRunning => _isRunning;
}

