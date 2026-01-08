import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:logger/logger.dart';
import 'package:win32/win32.dart';

import 'ipc_service.dart';

// Definir a função CreateMutex do Windows
final _kernel32 = DynamicLibrary.open('kernel32.dll');

final _createMutex = _kernel32.lookupFunction<
    IntPtr Function(Pointer, Int32, Pointer<Utf16>),
    int Function(Pointer, int, Pointer<Utf16>)>('CreateMutexW');

class SingleInstanceService {
  static final SingleInstanceService _instance = SingleInstanceService._();
  factory SingleInstanceService() => _instance;
  SingleInstanceService._();

  static const String _mutexName =
      'Global\\MagicPrinterMutex_{F5D8E3A7-9B2C-4E1D-A6F3-7C8B9D0E1F2A}';

  final Logger _logger = Logger();
  int _mutexHandle = 0;
  bool _isFirstInstance = false;
  final IpcService _ipcService = IpcService();

  /// Verifica se é a primeira instância do aplicativo usando Named Mutex do Windows
  /// Retorna true se é a primeira instância, false caso contrário
  Future<bool> checkAndLock() async {
    try {
      if (!Platform.isWindows) {
        _logger.w('Single instance check não suportado nesta plataforma');
        _isFirstInstance = true;
        return true;
      }

      // Criar ou abrir mutex nomeado
      final mutexNamePtr = _mutexName.toNativeUtf16();

      // Limpar erro anterior
      SetLastError(0);

      // CreateMutex retorna handle para o mutex
      // Se o mutex já existir, GetLastError retornará ERROR_ALREADY_EXISTS
      _mutexHandle = _createMutex(nullptr, 0, mutexNamePtr);

      // CRÍTICO: GetLastError() deve ser chamado IMEDIATAMENTE após CreateMutex
      // antes de qualquer outra operação que possa alterar o código de erro
      final lastError = GetLastError();

      // Verificar se o mutex já existia
      final mutexExists = (lastError == ERROR_ALREADY_EXISTS);

      // Liberar memória após capturar o erro
      calloc.free(mutexNamePtr);

      // Se o handle for inválido (NULL ou INVALID_HANDLE_VALUE)
      if (_mutexHandle == 0 || _mutexHandle == -1) {
        _logger.e(
          'Erro ao criar mutex: handle=$_mutexHandle, código=$lastError',
        );
        // Em caso de erro, permitir execução para não bloquear o app
        _isFirstInstance = true;
        return true;
      }

      // Se o mutex já existir, outra instância está rodando
      if (mutexExists) {
        _logger.i('Outra instância já está em execução (Mutex existe)');
        _isFirstInstance = false;

        // Fechar o handle do mutex (não precisamos dele)
        CloseHandle(_mutexHandle);
        _mutexHandle = 0;

        return false;
      }

      _logger.i(
        'Primeira instância do aplicativo (Mutex criado) - Handle: $_mutexHandle',
      );
      _isFirstInstance = true;
      return true;
    } catch (e, stackTrace) {
      _logger.e('Erro ao verificar instância única', error: e, stackTrace: stackTrace);
      // Em caso de erro, permitir execução para não bloquear o app
      _isFirstInstance = true;
      return true;
    }
  }

  /// Inicia o servidor IPC para receber comandos de outras instâncias
  Future<bool> startIpcServer({Function()? onShowWindow}) async {
    try {
      return await _ipcService.startServer(onShowWindow: onShowWindow);
    } catch (e, stackTrace) {
      _logger.e('Erro ao iniciar IPC Server', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  /// Envia comando para a instância existente mostrar a janela
  static Future<bool> notifyExistingInstance() async {
    return await IpcService.sendShowWindow();
  }

  /// Libera o mutex e para o servidor IPC
  Future<void> releaseLock() async {
    try {
      // Parar servidor IPC
      await _ipcService.stop();

      // Liberar mutex
      if (_mutexHandle != 0) {
        CloseHandle(_mutexHandle);
        _mutexHandle = 0;
        _logger.d('Mutex liberado');
      }
    } catch (e) {
      _logger.w('Erro ao liberar lock: $e');
    }
  }

  bool get isFirstInstance => _isFirstInstance;
  bool get isIpcRunning => _ipcService.isRunning;
}

