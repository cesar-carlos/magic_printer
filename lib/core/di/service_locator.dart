import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../application/application.dart';
import '../../core/constants/app_constants.dart';
import '../../infrastructure/infrastructure.dart';
import '../../domain/domain.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  _registerCore();
  _registerDatabase();
  _registerRepositories();
  _registerSecurity();
  _registerUseCases();
  _registerApplicationServices();
}

void _registerCore() {
  getIt.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
      ),
    ),
  );
}

void _registerDatabase() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
}

void _registerRepositories() {
  getIt.registerLazySingleton<IHostRepository>(
    () => HostRepository(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<IPrinterRepository>(
    () => PrinterRepository(
      getIt<AppDatabase>(),
      maintenanceDetector: getIt<MaintenanceDetectorService>(),
    ),
  );
  getIt.registerLazySingleton<IJobRepository>(
    () => JobRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<IGroupRepository>(
    () => GroupRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<IAppLogRepository>(
    () => LogRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<IPrinterSupplyRepository>(
    () => PrinterSupplyRepository(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<IPrinterMaintenanceRepository>(
    () => PrinterMaintenanceRepository(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<IPrinterHealthRepository>(
    () => PrinterHealthRepository(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<IPredictionRepository>(
    () => PredictionRepository(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<AlertRuleRepository>(
    () => AlertRuleRepository(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<IActionRuleRepository>(
    () => ActionRuleRepository(getIt<AppDatabase>()),
  );

  // Windows spooler capture (Client-side)
  getIt.registerLazySingleton<IPrintJobCaptureService>(
    () => WindowsPrintJobCaptureService(),
  );

  // Email Service
  getIt.registerLazySingleton<IEmailService>(() => EmailService());
}

void _registerSecurity() {
  // Audit Service (precisa ser registrado primeiro, pois é dependência dos outros)
  getIt.registerLazySingleton<IAuditService>(
    () => AuditService(logger: getIt<Logger>()),
  );

  // Authentication Service
  getIt.registerLazySingleton<IAuthenticationService>(
    () => AuthenticationService(
      hostRepository: getIt<IHostRepository>(),
      auditService: getIt<IAuditService>(),
    ),
  );

  // Authorization Service
  getIt.registerLazySingleton<IAuthorizationService>(
    () => AuthorizationService(
      groupRepository: getIt<IGroupRepository>(),
      printerRepository: getIt<IPrinterRepository>(),
      auditService: getIt<IAuditService>(),
    ),
  );
}

void _registerUseCases() {
  // Job Transport Use Case Implementation (em Infrastructure)
  getIt.registerLazySingleton<IJobTransportUseCase>(
    () => JobTransportUseCaseImpl(
      hostRepository: getIt<IHostRepository>(),
      logger: getIt<Logger>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<AddHost>(
    () => AddHost(hostRepository: getIt<IHostRepository>()),
  );

  getIt.registerLazySingleton<ConnectToHost>(
    () => ConnectToHost(hostRepository: getIt<IHostRepository>()),
  );

  getIt.registerLazySingleton<ListRemotePrinters>(
    () => ListRemotePrinters(
      hostRepository: getIt<IHostRepository>(),
      printerRepository: getIt<IPrinterRepository>(),
    ),
  );

  getIt.registerLazySingleton<SendPrintJob>(
    () => SendPrintJob(
      printerRepository: getIt<IPrinterRepository>(),
      hostRepository: getIt<IHostRepository>(),
      jobRepository: getIt<IJobRepository>(),
      transportUseCase: getIt<IJobTransportUseCase>(),
    ),
  );

  getIt.registerLazySingleton<GetJobHistory>(
    () => GetJobHistory(jobRepository: getIt<IJobRepository>()),
  );
}

void _registerApplicationServices() {
  getIt.registerLazySingleton<HostService>(
    () => HostService(
      addHost: getIt<AddHost>(),
      connectToHost: getIt<ConnectToHost>(),
      hostRepository: getIt<IHostRepository>(),
    ),
  );

  getIt.registerLazySingleton<PrinterService>(
    () => PrinterService(
      listRemotePrinters: getIt<ListRemotePrinters>(),
      printerRepository: getIt<IPrinterRepository>(),
    ),
  );

  getIt.registerLazySingleton<PrintJobService>(
    () => PrintJobService(
      sendPrintJob: getIt<SendPrintJob>(),
      getJobHistory: getIt<GetJobHistory>(),
      jobRepository: getIt<IJobRepository>(),
    ),
  );

  // Notification and Log Services (registered first as dependencies)
  getIt.registerLazySingleton<INotificationService>(
    () => NotificationService(
      emailService: getIt<IEmailService>(),
      localNotificationService: getIt<ILocalNotificationService>(),
    ),
  );

  getIt.registerLazySingleton<ILocalNotificationService>(
    () => LocalNotificationService(),
  );

  getIt.registerLazySingleton<AppLogService>(
    () => AppLogService(
      repository: getIt<IAppLogRepository>(),
      notificationService: getIt<INotificationService>(),
    ),
  );

  getIt.registerLazySingleton<IPrintQueueService>(
    () => PrintQueueService(
      printerService: getIt<PrinterService>(),
      printJobService: getIt<PrintJobService>(),
      logService: getIt<AppLogService>(),
      logger: getIt<Logger>(),
    ),
  );

  getIt.registerLazySingleton<PrintForwardingService>(
    () => PrintForwardingService(
      captureService: getIt<IPrintJobCaptureService>(),
      printQueueService: getIt<IPrintQueueService>(),
      userService: getIt<IUserService>(),
    ),
  );

  getIt.registerLazySingleton<PrinterStatusMonitorService>(
    () => PrinterStatusMonitorService(
      notificationService: getIt<ILocalNotificationService>(),
      printerRepository: getIt<IPrinterRepository>(),
    ),
  );

  getIt.registerLazySingleton<DashboardMetricsService>(
    () => DashboardMetricsService(
      printerRepository: getIt<IPrinterRepository>(),
      jobRepository: getIt<IJobRepository>(),
      hostRepository: getIt<IHostRepository>(),
      logRepository: getIt<IAppLogRepository>(),
      healthMonitorService: getIt<IHealthMonitorService>(),
      predictiveAnalyzerService: getIt<IPredictiveAnalyzerService>(),
    ),
  );

  getIt.registerLazySingleton<PrinterSupplyService>(
    () => PrinterSupplyService(
      supplyRepository: getIt<IPrinterSupplyRepository>(),
    ),
  );

  getIt.registerLazySingleton<PrinterMaintenanceService>(
    () => PrinterMaintenanceService(
      maintenanceRepository: getIt<IPrinterMaintenanceRepository>(),
    ),
  );

  getIt.registerLazySingleton<IUserService>(
    () => UserService(userRepository: getIt<IUserRepository>()),
  );

  getIt.registerLazySingleton<MaintenanceDetectorService>(
    () => MaintenanceDetectorService(
      maintenanceRepository: getIt<IPrinterMaintenanceRepository>(),
      supplyRepository: getIt<IPrinterSupplyRepository>(),
      userService: getIt<IUserService>(),
    ),
  );

  getIt.registerLazySingleton<DashboardCacheService>(
    () => DashboardCacheService(),
  );

  getIt.registerFactoryParam<NetworkDiscoveryService, String, String>(
    (localHostId, localHostName) => NetworkDiscoveryService(
      hostRepository: getIt<IHostRepository>(),
      localHostId: localHostId,
      localHostName: localHostName,
      grpcPort: defaultHostPort,
      logger: getIt<Logger>(),
    ),
  );

  getIt.registerLazySingleton<HeartbeatService>(
    () => HeartbeatService(
      hostRepository: getIt<IHostRepository>(),
      logger: getIt<Logger>(),
    ),
  );

  getIt.registerLazySingleton<IHealthMonitorService>(
    () => HealthMonitorService(
      printerRepository: getIt<IPrinterRepository>(),
      healthRepository: getIt<IPrinterHealthRepository>(),
      jobRepository: getIt<IJobRepository>(),
      maintenanceRepository: getIt<IPrinterMaintenanceRepository>(),
      supplyRepository: getIt<IPrinterSupplyRepository>(),
    ),
  );

  getIt.registerLazySingleton<IAlertRuleService>(
    () => AlertRuleService(
      repository: getIt<AlertRuleRepository>(),
      healthRepository: getIt<IPrinterHealthRepository>(),
      printerRepository: getIt<IPrinterRepository>(),
      notificationService: getIt<ILocalNotificationService>(),
      jobRepository: getIt<IJobRepository>(),
      webhookService: WebhookService(),
    ),
  );

  getIt.registerLazySingleton<IPredictiveAnalyzerService>(
    () => PredictiveAnalyzerService(
      predictionRepository: getIt<IPredictionRepository>(),
      printerRepository: getIt<IPrinterRepository>(),
      jobRepository: getIt<IJobRepository>(),
    ),
  );

  getIt.registerLazySingleton<IActionExecutorService>(
    () => ActionExecutorService(
      actionRuleRepository: getIt<IActionRuleRepository>(),
      printerRepository: getIt<IPrinterRepository>(),
      healthRepository: getIt<IPrinterHealthRepository>(),
      notificationService: getIt<ILocalNotificationService>(),
    ),
  );

  getIt.registerLazySingleton<QueueMonitorService>(
    () => QueueMonitorService(
      jobRepository: getIt<IJobRepository>(),
      printerRepository: getIt<IPrinterRepository>(),
      notificationService: getIt<ILocalNotificationService>(),
    ),
  );
}
