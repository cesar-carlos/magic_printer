import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/routes/route_names.dart';
import '../../shared/shared.dart';
import '../providers/notification_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _soundsEnabled = true;
  bool _minimizeToTray = true;
  bool _startOnStartup = false;
  bool _autoReconnect = true;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Configurações')),
      children: [
        // Notificações
        _buildSectionHeader(
          context,
          title: 'Notificações',
          icon: FluentIcons.ringer,
        ),
        const SizedBox(height: 8),
        AppCard(
          child: Column(
            children: [
              _buildSettingsTile(
                context,
                icon: FluentIcons.mail,
                title: 'Configurar Email',
                subtitle: 'Configure notificações por email',
                onTap: () => context.push(RouteNames.notifications),
              ),
              const Divider(),
              _buildSwitchTile(
                context,
                icon: FluentIcons.ringer,
                title: 'Sons de notificação',
                subtitle: 'Tocar som ao receber notificações',
                value: _soundsEnabled,
                onChanged: (value) => setState(() => _soundsEnabled = value),
              ),
              const Divider(),
              Consumer<NotificationProvider>(
                builder: (context, provider, _) {
                  return _buildSwitchTile(
                    context,
                    icon: FluentIcons.ringer,
                    title: 'Notificações push',
                    subtitle:
                        'Receber notificações do sistema para mudanças de status das impressoras',
                    value: provider.localNotificationsEnabled,
                    onChanged: (value) {
                      provider.saveLocalNotificationsEnabled(value);
                    },
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Impressão
        _buildSectionHeader(
          context,
          title: 'Impressão',
          icon: FluentIcons.print,
        ),
        const SizedBox(height: 8),
        AppCard(
          child: Column(
            children: [
              _buildSwitchTile(
                context,
                icon: FluentIcons.refresh,
                title: 'Reconexão automática',
                subtitle: 'Reconectar automaticamente às impressoras',
                value: _autoReconnect,
                onChanged: (value) => setState(() => _autoReconnect = value),
              ),
              const Divider(),
              _buildSettingsTile(
                context,
                icon: FluentIcons.print,
                title: 'Gerenciar impressoras',
                subtitle: 'Ver e configurar impressoras conectadas',
                onTap: () => context.go(RouteNames.printers),
              ),
              const Divider(),
              _buildSettingsTile(
                context,
                icon: FluentIcons.all_apps,
                title: 'Fila de impressão',
                subtitle: 'Ver jobs na fila de impressão',
                onTap: () => context.push(RouteNames.printQueue),
              ),
              const Divider(),
              _buildSettingsTile(
                context,
                icon: FluentIcons.history,
                title: 'Histórico de jobs',
                subtitle: 'Ver histórico completo de impressões',
                onTap: () => context.push(RouteNames.printJobHistory),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Aplicativo
        _buildSectionHeader(
          context,
          title: 'Aplicativo',
          icon: FluentIcons.settings,
        ),
        const SizedBox(height: 8),
        AppCard(
          child: Column(
            children: [
              _buildSwitchTile(
                context,
                icon: FluentIcons.chrome_minimize,
                title: 'Minimizar para bandeja',
                subtitle: 'Minimizar para a bandeja do sistema ao fechar',
                value: _minimizeToTray,
                onChanged: (value) => setState(() => _minimizeToTray = value),
              ),
              const Divider(),
              _buildSwitchTile(
                context,
                icon: FluentIcons.power_button,
                title: 'Iniciar com o Windows',
                subtitle: 'Iniciar aplicativo automaticamente',
                value: _startOnStartup,
                onChanged: (value) => setState(() => _startOnStartup = value),
              ),
              const Divider(),
              _buildSwitchTile(
                context,
                icon: FluentIcons.bulleted_list,
                title: 'Modo escuro',
                subtitle: 'Usar tema escuro para a interface',
                value: _darkMode,
                onChanged: (value) => setState(() => _darkMode = value),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Sistema
        _buildSectionHeader(
          context,
          title: 'Sistema',
          icon: FluentIcons.system,
        ),
        const SizedBox(height: 8),
        AppCard(
          child: Column(
            children: [
              _buildInfoTile(
                context,
                icon: FluentIcons.info,
                title: 'Versão',
                subtitle: '1.0.0',
              ),
              const Divider(),
              _buildSettingsTile(
                context,
                icon: FluentIcons.view,
                title: 'Logs do sistema',
                subtitle: 'Ver logs de aplicação e erros',
                onTap: () => context.push(RouteNames.logs),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Sobre
        _buildSectionHeader(context, title: 'Sobre', icon: FluentIcons.info),
        const SizedBox(height: 8),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(FluentIcons.print, size: 32),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Magic Printer', style: theme.typography.titleLarge),
                      const SizedBox(height: 4),
                      Text(
                        'Sistema de gerenciamento de impressão',
                        style: theme.typography.body,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Um aplicativo para gerenciar impressoras e trabalhos de impressão em rede.',
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton(
                    onPressed: () {
                      // TODO: Abrir GitHub ou documentação
                    },
                    child: const Text('Documentação'),
                  ),
                  Button(
                    onPressed: () {
                      // TODO: Abrir licença
                    },
                    child: const Text('Licença'),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    final theme = FluentTheme.of(context);

    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 10),
        Text(title, style: theme.typography.title),
      ],
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(FluentIcons.chevron_right),
      onPressed: onTap,
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                  ),
              ],
            ),
          ),
          ToggleSwitch(checked: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
