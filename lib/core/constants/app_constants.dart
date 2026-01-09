const defaultHostPort = 50051;
const defaultBindAddress = '0.0.0.0';
const defaultConnectTimeoutSeconds = 10;
const defaultSendTimeoutSeconds = 60;
const defaultMaxRetries = 3;
const defaultChunkSizeBytes = 65536;
const defaultCompression = 'gzip';
const defaultEventsRetentionDays = 30;
const defaultLogLevel = 'info';

const appName = 'Magic Printer';
const appVersion = '1.0.0';

const protocolVersion = '1.0';

const defaultDiscoveryPort = 50052;
const defaultMulticastAddress = '239.255.255.250';
const defaultBroadcastInterval = Duration(seconds: 5);
const defaultHeartbeatInterval = Duration(seconds: 15);
const defaultHostTimeout = Duration(seconds: 30);

const defaultHealthCheckInterval = Duration(minutes: 5);
const defaultAlertCheckInterval = Duration(minutes: 1);
const defaultActionCheckInterval = Duration(minutes: 2);
const defaultPredictionCheckInterval = Duration(hours: 1);
const defaultQueueStuckThreshold = Duration(minutes: 10);
const defaultQueueSizeThreshold = 20;
const defaultHealthScoreThreshold = 50;
const defaultTonerLowThreshold = 20;
const defaultPaperLowThreshold = 10;