import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/application.dart';
import '../../core/core.dart';
import '../../infrastructure/network/host_discovery_listener.dart';
import '../../shared/shared.dart';
import '../providers/host_discovery_provider.dart';
import '../providers/host_provider.dart';
import '../widgets/widgets.dart';

class HostsPage extends StatefulWidget {
  const HostsPage({super.key});

  @override
  State<HostsPage> createState() => _HostsPageState();
}

class _HostsPageState extends State<HostsPage> {
  static const _pagePadding = EdgeInsets.all(16);
  static const _topActionsPadding = EdgeInsets.fromLTRB(16, 12, 16, 0);
  static const _cardSpacing = 12.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadHosts();
    });
  }

  void _loadHosts() {
    context.read<HostProvider>().loadHosts();
  }

  Future<void> _goToAddHost() async {
    await context.push(RouteNames.addHost);
    if (mounted) {
      _loadHosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localHostName = Platform.localHostname;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HostDiscoveryProvider(
            getIt<NetworkDiscoveryService>(
              param1: localHostName,
              param2: localHostName,
            ),
          ),
        ),
      ],
      child: Consumer2<HostProvider, HostDiscoveryProvider>(
        builder: (context, hostProvider, discoveryProvider, child) {
          return ErrorListener(
            error: hostProvider.error ?? discoveryProvider.error,
            onErrorShown: () {
              hostProvider.clearError();
              discoveryProvider.clearError();
            },
            child: LoadingOverlay(
              isLoading: hostProvider.isLoading,
              message: 'Carregando hosts...',
              child: _HostsContent(
                hostProvider: hostProvider,
                discoveryProvider: discoveryProvider,
                onRefresh: _loadHosts,
                onAdd: _goToAddHost,
                pagePadding: _pagePadding,
                topActionsPadding: _topActionsPadding,
                cardSpacing: _cardSpacing,
                onShowDetails: (host) => _openHostDetails(context, host),
                onAddDiscoveredHost: (discovered) => _addDiscoveredHost(context, discovered),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _addDiscoveredHost(BuildContext context, DiscoveredHost discovered) async {
    final hostService = getIt<HostService>();
    final addRequest = AddHostRequestDTO(
      name: discovered.hostName,
      host: discovered.ip,
      port: discovered.port,
    );

    final result = await hostService.addHost(addRequest);
    if (result.isSuccess() && mounted) {
      _loadHosts();
    }
  }

  void _openHostDetails(BuildContext context, HostDTO host) {
    if (!mounted) return;
    context.go(RouteNames.hostDetail.replaceFirst(':id', host.id));
  }
}

class _HostsContent extends StatelessWidget {
  final HostProvider hostProvider;
  final HostDiscoveryProvider discoveryProvider;
  final VoidCallback onRefresh;
  final Future<void> Function() onAdd;
  final void Function(HostDTO host) onShowDetails;
  final void Function(DiscoveredHost discovered) onAddDiscoveredHost;
  final EdgeInsets pagePadding;
  final EdgeInsets topActionsPadding;
  final double cardSpacing;

  const _HostsContent({
    required this.hostProvider,
    required this.discoveryProvider,
    required this.onRefresh,
    required this.onAdd,
    required this.onShowDetails,
    required this.onAddDiscoveredHost,
    required this.pagePadding,
    required this.topActionsPadding,
    required this.cardSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final hasHosts = hostProvider.hosts.isNotEmpty;
    final hasDiscoveredHosts = discoveryProvider.discoveredHosts.isNotEmpty;

    if (!hasHosts && !hasDiscoveredHosts && !hostProvider.isLoading) {
      return EmptyState(
        icon: FluentIcons.server,
        message: 'Nenhum host cadastrado\nAdicione um host para listar impressoras remotas.',
        actionLabel: 'Adicionar Host',
        onAction: onAdd,
      );
    }

    return Column(
      children: [
        Padding(
          padding: topActionsPadding,
          child: PageActionsRow(
            actions: [
              PageAction(
                label: discoveryProvider.isDiscovering ? 'Parar Busca' : 'Buscar na Rede',
                icon: discoveryProvider.isDiscovering ? FluentIcons.stop : FluentIcons.search,
                onPressed: () {
                  if (discoveryProvider.isDiscovering) {
                    discoveryProvider.stopDiscovery();
                  } else {
                    discoveryProvider.startDiscovery();
                  }
                },
              ),
              PageAction(
                label: 'Atualizar',
                icon: FluentIcons.refresh,
                onPressed: onRefresh,
              ),
              PageAction(
                label: 'Adicionar',
                icon: FluentIcons.add,
                onPressed: onAdd,
                isPrimary: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            padding: pagePadding,
            children: [
              if (hasDiscoveredHosts) ...[
                Text(
                  'Hosts Descobertos na Rede',
                  style: FluentTheme.of(context).typography.subtitle?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                for (final discovered in discoveryProvider.discoveredHosts)
                  Padding(
                    padding: EdgeInsets.only(bottom: cardSpacing),
                    child: DiscoveredHostCard(
                      host: discovered,
                      isAlreadyAdded: hostProvider.hosts.any((h) => h.id == discovered.hostId),
                      onAdd: () => onAddDiscoveredHost(discovered),
                    ),
                  ),
                const SizedBox(height: 24),
              ],
              if (hasHosts) ...[
                if (hasDiscoveredHosts)
                  Text(
                    'Hosts Cadastrados',
                    style: FluentTheme.of(context).typography.subtitle?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (hasDiscoveredHosts) const SizedBox(height: 8),
                for (final host in hostProvider.hosts)
                  Padding(
                    padding: EdgeInsets.only(bottom: cardSpacing),
                    child: HostCard(
                      host: host,
                      onTap: () => onShowDetails(host),
                      onRefresh: () => hostProvider.refreshHost(host.id),
                      onConfigure: onAdd,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

