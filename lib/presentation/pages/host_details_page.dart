import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/dtos/connect_host_request_dto.dart';
import '../../application/dtos/host_dto.dart';
import '../../core/routes/route_names.dart';
import '../../shared/shared.dart';
import '../providers/host_provider.dart';
import '../widgets/widgets.dart';

class HostDetailsPage extends StatefulWidget {
  final String hostId;

  const HostDetailsPage({
    super.key,
    required this.hostId,
  });

  @override
  State<HostDetailsPage> createState() => _HostDetailsPageState();
}

class _HostDetailsPageState extends State<HostDetailsPage> {
  static const _pagePadding = EdgeInsets.all(16);
  static const _topActionsPadding = EdgeInsets.fromLTRB(16, 12, 16, 0);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final provider = context.read<HostProvider>();
      final hasHost = provider.hosts.any((h) => h.id == widget.hostId);
      if (!hasHost) {
        provider.loadHosts();
      }
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleBack() {
    if (!mounted) return;
    context.go(RouteNames.hosts);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HostProvider>(
      builder: (context, provider, child) {
        final host = provider.hosts.where((h) => h.id == widget.hostId).firstOrNull;

        return ErrorListener(
          error: provider.error,
          onErrorShown: () => provider.clearError(),
          child: LoadingOverlay(
            isLoading: provider.isLoading,
            message: 'Carregando host...',
            child: host == null
                ? _HostNotFound(
                    onBack: _handleBack,
                  )
                : _HostDetailsContent(
                    host: host,
                    onBack: _handleBack,
                    onRefresh: () => provider.refreshHost(host.id),
                    onConnect: () => _connect(provider, host),
                    onAuthenticate: () => _authenticate(provider, host),
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    pagePadding: _pagePadding,
                    topActionsPadding: _topActionsPadding,
                  ),
          ),
        );
      },
    );
  }

  Future<void> _connect(HostProvider provider, HostDTO host) async {
    await _runAndNotify(
      provider: provider,
      host: host,
      actionLabel: 'Conectado',
      operation: () => provider.connectToHost(
        ConnectHostRequestDTO(hostId: host.id),
      ),
    );
  }

  Future<void> _authenticate(HostProvider provider, HostDTO host) async {
    await _runAndNotify(
      provider: provider,
      host: host,
      actionLabel: 'Autenticado',
      operation: () => provider.connectToHost(
        ConnectHostRequestDTO(
          hostId: host.id,
          username: _usernameController.text.trim(),
          password: _passwordController.text,
        ),
      ),
      onSuccess: () {
        _passwordController.clear();
      },
    );
  }

  Future<void> _runAndNotify({
    required HostProvider provider,
    required HostDTO host,
    required String actionLabel,
    required Future<void> Function() operation,
    VoidCallback? onSuccess,
  }) async {
    await operation();

    if (!mounted) return;
    if (provider.error != null && provider.error!.isNotEmpty) return;

    onSuccess?.call();
    await provider.refreshHost(host.id);

    if (!mounted) return;

    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: Text(actionLabel),
          content: Text('${host.name} • ${host.fullAddress}'),
          severity: InfoBarSeverity.success,
        );
      },
      duration: const Duration(seconds: 3),
    );
  }
}

class _HostNotFound extends StatelessWidget {
  final VoidCallback onBack;

  const _HostNotFound({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: FluentIcons.server,
      message: 'Host não encontrado.',
      actionLabel: 'Voltar',
      onAction: onBack,
    );
  }
}

class _HostDetailsContent extends StatelessWidget {
  final HostDTO host;
  final VoidCallback onBack;
  final VoidCallback onRefresh;
  final VoidCallback onConnect;
  final VoidCallback onAuthenticate;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final EdgeInsets pagePadding;
  final EdgeInsets topActionsPadding;

  const _HostDetailsContent({
    required this.host,
    required this.onBack,
    required this.onRefresh,
    required this.onConnect,
    required this.onAuthenticate,
    required this.usernameController,
    required this.passwordController,
    required this.pagePadding,
    required this.topActionsPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Column(
      children: [
        Padding(
          padding: topActionsPadding,
          child: PageActionsRow(
            actions: [
              PageAction(
                label: 'Voltar',
                icon: FluentIcons.back,
                onPressed: onBack,
              ),
              PageAction(
                label: 'Atualizar',
                icon: FluentIcons.refresh,
                onPressed: onRefresh,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            padding: pagePadding,
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      host.name,
                      style: theme.typography.title?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(host.fullAddress, style: theme.typography.body),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        StatusIndicator(status: host.status, label: host.status),
                        if (host.requiresAuth)
                          StatusIndicator(
                            status: host.isAuthenticated ? 'online' : 'warning',
                            label: host.isAuthenticated ? 'Autenticado' : 'Auth pendente',
                          ),
                      ],
                    ),
                    if (host.version != null && host.version!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text('Versão: ${host.version}', style: theme.typography.caption),
                    ],
                    if (host.lastSeen != null) ...[
                      const SizedBox(height: 4),
                      Text('Último contato: ${host.lastSeen}', style: theme.typography.caption),
                    ],
                    if (host.supportedFeatures.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Features: ${host.supportedFeatures.join(', ')}',
                        style: theme.typography.caption,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conexão',
                      style: theme.typography.subtitle?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (!host.requiresAuth) ...[
                      PageActionsRow(
                        actions: [
                          PageAction(
                            label: 'Conectar',
                            icon: FluentIcons.plug_connected,
                            onPressed: onConnect,
                            isPrimary: true,
                          ),
                        ],
                      ),
                    ] else ...[
                      if (!host.isAuthenticated) ...[
                        AppTextField(
                          controller: usernameController,
                          label: 'Usuário',
                          hint: 'Digite o usuário',
                          prefixIcon: const Icon(FluentIcons.contact),
                        ),
                        const SizedBox(height: 12),
                        PasswordField(
                          controller: passwordController,
                          label: 'Senha',
                          hint: 'Digite a senha',
                        ),
                        const SizedBox(height: 12),
                        PageActionsRow(
                          actions: [
                            PageAction(
                              label: 'Autenticar e Conectar',
                              icon: FluentIcons.plug_connected,
                              onPressed: onAuthenticate,
                              isPrimary: true,
                            ),
                          ],
                        ),
                      ] else ...[
                        PageActionsRow(
                          actions: [
                            PageAction(
                              label: 'Conectar',
                              icon: FluentIcons.plug_connected,
                              onPressed: onConnect,
                              isPrimary: true,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

