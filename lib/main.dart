import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'domain/domain.dart';
import 'application/application.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final singleInstanceService = SingleInstanceService();
  if (Platform.isWindows) {
    final isFirstInstance = await singleInstanceService.checkAndLock();
    if (!isFirstInstance) {
      await SingleInstanceService.notifyExistingInstance();
      exit(0);
    }
  }

  await setupDependencies();

  // Inicializar gerenciador de janela
  final windowManagerService = WindowManagerService();
  await windowManagerService.initialize(title: appName, center: true);
  windowManagerService
    ..setCloseToTray(true)
    ..setMinimizeToTray(false);

  final localHostName = Platform.localHostname;
  final hostDiscoveryService = HostDiscoveryServiceImpl(
    hostId: localHostName,
    hostName: localHostName,
    port: defaultHostPort,
    requiresAuth: false,
  );
  final jobTransportService = JobTransportServiceImpl(authService: null);
  final grpcServer = GrpcServer(
    jobTransportService: jobTransportService,
    hostDiscoveryService: hostDiscoveryService,
    port: defaultHostPort,
    bindAddress: defaultBindAddress,
  );

  Future<void> shutdownApp() async {
    try {
      // Permitir fechamento real (sem ir para a bandeja)
      windowManagerService.setCloseToTray(false);

      // Parar servidor gRPC
      await grpcServer.stop();

      // Remover tray
      TrayManagerService().dispose();

      // Liberar single instance + IPC
      await singleInstanceService.releaseLock();
    } finally {
      exit(0);
    }
  }

  if (Platform.isWindows) {
    await singleInstanceService.startIpcServer(
      onShowWindow: () {
        windowManagerService.show();
      },
    );
  }

  try {
    await grpcServer.start();
  } on SocketException catch (_) {
    // Porta em uso geralmente significa outra instância já rodando (especialmente em dev).
    if (Platform.isWindows) {
      await SingleInstanceService.notifyExistingInstance();
    }
    await singleInstanceService.releaseLock();
    exit(0);
  }

  runApp(MagicPrinterApp(
    onAppReady: Platform.isWindows
        ? () async {
            try {
              await TrayManagerService().initialize(
                onMenuAction: (action) async {
                  switch (action) {
                    case TrayMenuAction.show:
                      await windowManagerService.show();
                      break;
                    case TrayMenuAction.settings:
                      // menu pode não expor settings ainda; manter para expansão futura
                      await windowManagerService.show();
                      break;
                    case TrayMenuAction.exit:
                      await shutdownApp();
                      break;
                  }
                },
              );
            } catch (e, stackTrace) {
              // Log silencioso para evitar problemas durante inicialização
              debugPrint('Erro ao inicializar TrayManager: $e');
              debugPrint('Stack trace: $stackTrace');
            }
          }
        : null,
  ));
}

class MagicPrinterApp extends StatefulWidget {
  final Future<void> Function()? onAppReady;

  const MagicPrinterApp({super.key, this.onAppReady});

  @override
  State<MagicPrinterApp> createState() => _MagicPrinterAppState();
}

class _MagicPrinterAppState extends State<MagicPrinterApp> {
  @override
  void initState() {
    super.initState();
    // Inicializar TrayManager após o primeiro frame
    if (widget.onAppReady != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onAppReady!();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HostProvider(getIt<HostService>()),
        ),
        ChangeNotifierProvider(
          create: (_) => PrinterProvider(getIt<PrinterService>()),
        ),
        ChangeNotifierProvider(
          create: (_) => PrintJobProvider(getIt<PrintJobService>()),
        ),
        ChangeNotifierProvider(
          create: (_) {
            final queueService = getIt<IPrintQueueService>();
            queueService.start();
            return PrintQueueProvider(queueService);
          },
        ),
        ChangeNotifierProvider(
          create: (_) => SetupWizardProvider(
            hostService: getIt<HostService>(),
            printerService: getIt<PrinterService>(),
            forwardingService: getIt<PrintForwardingService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => LogProvider(getIt<AppLogService>()),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(
            emailService: getIt<IEmailService>(),
            database: getIt<AppDatabase>(),
          ),
        ),
      ],
      child: FluentApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: FluentThemeData(
          brightness: Brightness.light,
          accentColor: Colors.blue,
        ),
        darkTheme: FluentThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.blue,
        ),
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}
