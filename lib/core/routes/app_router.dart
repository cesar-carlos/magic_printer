import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.printers,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(
          location: state.uri.path,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: RouteNames.home,
          redirect: (context, state) => RouteNames.printers,
        ),
        GoRoute(
          path: RouteNames.printers,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: RouteNames.hosts,
          builder: (context, state) => const HostsPage(),
        ),
        GoRoute(
          path: RouteNames.hostDetail,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            if (id == null || id.isEmpty) {
              return const HostsPage();
            }
            return HostDetailsPage(hostId: id);
          },
        ),
        GoRoute(
          path: RouteNames.logs,
          builder: (context, state) => const LogsPage(),
        ),
        GoRoute(
          path: RouteNames.notifications,
          builder: (context, state) => const NotificationsPage(),
        ),
        GoRoute(
          path: RouteNames.settings,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: RouteNames.printQueue,
          builder: (context, state) => const PrintQueuePage(),
        ),
        GoRoute(
          path: RouteNames.printJobHistory,
          builder: (context, state) => const PrintJobHistoryPage(),
        ),
      ],
    ),
    GoRoute(
      path: RouteNames.addHost,
      builder: (context, state) => const SetupWizardPage(),
    ),
    GoRoute(
      path: RouteNames.setup,
      builder: (context, state) => const SetupWizardPage(),
    ),
  ],
);

