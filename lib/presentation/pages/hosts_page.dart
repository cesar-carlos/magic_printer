import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/dtos/host_dto.dart';
import '../../core/routes/route_names.dart';
import '../../shared/shared.dart';
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
    return Consumer<HostProvider>(
      builder: (context, provider, child) {
        return ErrorListener(
          error: provider.error,
          onErrorShown: () => provider.clearError(),
          child: LoadingOverlay(
            isLoading: provider.isLoading,
            message: 'Carregando hosts...',
            child: _HostsContent(
              provider: provider,
              onRefresh: _loadHosts,
              onAdd: _goToAddHost,
              pagePadding: _pagePadding,
              topActionsPadding: _topActionsPadding,
              cardSpacing: _cardSpacing,
              onShowDetails: (host) => _openHostDetails(context, host),
            ),
          ),
        );
      },
    );
  }

  void _openHostDetails(BuildContext context, HostDTO host) {
    if (!mounted) return;
    context.go(RouteNames.hostDetail.replaceFirst(':id', host.id));
  }
}

class _HostsContent extends StatelessWidget {
  final HostProvider provider;
  final VoidCallback onRefresh;
  final Future<void> Function() onAdd;
  final void Function(HostDTO host) onShowDetails;
  final EdgeInsets pagePadding;
  final EdgeInsets topActionsPadding;
  final double cardSpacing;

  const _HostsContent({
    required this.provider,
    required this.onRefresh,
    required this.onAdd,
    required this.onShowDetails,
    required this.pagePadding,
    required this.topActionsPadding,
    required this.cardSpacing,
  });

  @override
  Widget build(BuildContext context) {
    if (provider.hosts.isEmpty && !provider.isLoading) {
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
              for (final host in provider.hosts)
                Padding(
                  padding: EdgeInsets.only(bottom: cardSpacing),
                  child: HostCard(
                    host: host,
                    onTap: () => onShowDetails(host),
                    onRefresh: () => provider.refreshHost(host.id),
                    onConfigure: onAdd,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

