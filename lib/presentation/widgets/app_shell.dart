import 'package:flutter/scheduler.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/route_names.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final String location;

  const AppShell({super.key, required this.child, required this.location});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndexForLocation(widget.location);
    final builtItems = _buildPaneItems(widget.child, selectedIndex);
    
    String title = 'Magic Printer';
    if (selectedIndex >= 0 && selectedIndex < builtItems.length) {
      title = builtItems[selectedIndex].label ?? 'Magic Printer';
    }

    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      pane: NavigationPane(
        selected: selectedIndex,
        onChanged: (index) {
          if (!mounted) return;
          
          if (index < 0 || index >= builtItems.length) return;
          
          final route = _getRouteForIndex(index);
          if (route == null) return;
          
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            
            final router = GoRouter.maybeOf(context);
            if (router == null || !mounted) return;
            
            router.go(route);
          });
        },
        items: [for (final item in builtItems) item.paneItem],
      ),
    );
  }
}

class _BuiltPaneItem {
  final NavigationPaneItem paneItem;
  final String? route;
  final String? label;

  const _BuiltPaneItem({required this.paneItem, this.route, this.label});
}

List<_BuiltPaneItem> _buildPaneItems(Widget child, int selectedIndex) {
  const printerIndex = 0;
  const hostIndex = 1;
  const logIndex = 2;
  const notificationIndex = 3;
  const settingsIndex = 4;

  final items = <_BuiltPaneItem>[
    _BuiltPaneItem(paneItem: PaneItemHeader(header: Text('Dashboard'))),
    _BuiltPaneItem(
      route: RouteNames.printers,
      label: 'Impressoras',
      paneItem: PaneItem(
        key: ValueKey(RouteNames.printers),
        icon: Icon(FluentIcons.print),
        title: Text('Impressoras'),
        body: selectedIndex == printerIndex ? child : const SizedBox.shrink(),
      ),
    ),
    _BuiltPaneItem(
      route: RouteNames.hosts,
      label: 'Hosts',
      paneItem: PaneItem(
        key: ValueKey(RouteNames.hosts),
        icon: Icon(FluentIcons.server),
        title: Text('Hosts'),
        body: selectedIndex == hostIndex ? child : const SizedBox.shrink(),
      ),
    ),
    _BuiltPaneItem(paneItem: PaneItemHeader(header: Text('Sistema'))),
    _BuiltPaneItem(
      route: RouteNames.logs,
      label: 'Logs',
      paneItem: PaneItem(
        key: ValueKey(RouteNames.logs),
        icon: Icon(FluentIcons.text_document),
        title: Text('Logs'),
        body: selectedIndex == logIndex ? child : const SizedBox.shrink(),
      ),
    ),
    _BuiltPaneItem(
      route: RouteNames.notifications,
      label: 'Notificações',
      paneItem: PaneItem(
        key: ValueKey(RouteNames.notifications),
        icon: Icon(FluentIcons.ringer),
        title: Text('Notificações'),
        body: selectedIndex == notificationIndex ? child : const SizedBox.shrink(),
      ),
    ),
    _BuiltPaneItem(
      route: RouteNames.settings,
      label: 'Configurações',
      paneItem: PaneItem(
        key: ValueKey(RouteNames.settings),
        icon: Icon(FluentIcons.settings),
        title: Text('Configurações'),
        body: selectedIndex == settingsIndex ? child : const SizedBox.shrink(),
      ),
    ),
  ];

  return items;
}

int _selectedIndexForLocation(String location) {
  final normalized = location == RouteNames.home
      ? RouteNames.printers
      : location;

  const routes = [
    RouteNames.printers,
    RouteNames.hosts,
    RouteNames.logs,
    RouteNames.notifications,
    RouteNames.settings,
  ];

  for (var i = 0; i < routes.length; i++) {
    final route = routes[i];

    if (normalized == route) {
      return i;
    }

    if (normalized.startsWith('$route/')) {
      return i;
    }

    final routePattern = route.replaceAll(RegExp(r':\w+'), r'[^/]+');
    final regex = RegExp('^$routePattern(/.*)?\$');
    if (regex.hasMatch(normalized)) {
      return i;
    }
  }

  return 0; // Default to printers (index 0)
}

String? _getRouteForIndex(int index) {
  const routes = [
    RouteNames.printers,
    RouteNames.hosts,
    RouteNames.logs,
    RouteNames.notifications,
    RouteNames.settings,
  ];

  if (index < 0 || index >= routes.length) {
    return null;
  }

  return routes[index];
}
