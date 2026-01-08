import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../../shared/shared.dart';
import '../providers/providers.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _formKey = GlobalKey<FormState>();
  final _smtpHostController = TextEditingController();
  final _smtpPortController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fromEmailController = TextEditingController();
  final _toEmailController = TextEditingController();

  bool _useSsl = true;
  bool _enabled = false;
  bool _notifyOnPrintFailure = true;
  bool _notifyOnPrinterOffline = true;
  bool _notifyOnJobStuck = true;
  bool _notifyOnAuthFailure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadConfig();
    });
  }

  void _loadConfig() {
    final provider = context.read<NotificationProvider>();
    final config = provider.emailConfig;

    if (config != null) {
      _smtpHostController.text = config.smtpHost;
      _smtpPortController.text = config.smtpPort.toString();
      _usernameController.text = config.username;
      _passwordController.text = config.password;
      _fromEmailController.text = config.fromEmail;
      _toEmailController.text = config.toEmail;
      setState(() {
        _useSsl = config.useSsl;
        _enabled = config.enabled;
        _notifyOnPrintFailure = config.notifyOnPrintFailure;
        _notifyOnPrinterOffline = config.notifyOnPrinterOffline;
        _notifyOnJobStuck = config.notifyOnJobStuck;
        _notifyOnAuthFailure = config.notifyOnAuthFailure;
      });
    } else {
      final defaultConfig = provider.createDefaultConfig();
      _smtpHostController.text = defaultConfig.smtpHost;
      _smtpPortController.text = defaultConfig.smtpPort.toString();
    }
  }

  @override
  void dispose() {
    _smtpHostController.dispose();
    _smtpPortController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _fromEmailController.dispose();
    _toEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Configuração de Notificações'),
      ),
      children: [
        Consumer<NotificationProvider>(
          builder: (context, provider, _) {
            if (provider.successMessage != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ToastManager.showSuccess(
                  context,
                  'Sucesso',
                  provider.successMessage!,
                );
                provider.clearMessages();
              });
            }

            if (provider.error != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ToastManager.showError(
                  context,
                  'Erro',
                  provider.error!,
                );
                provider.clearMessages();
              });
            }

            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEmailConfigSection(provider),
                  const SizedBox(height: 24),
                  _buildNotificationPreferencesSection(),
                  const SizedBox(height: 24),
                  _buildActionsSection(provider),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmailConfigSection(NotificationProvider provider) {
    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Configuração de Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ToggleSwitch(
                checked: _enabled,
                onChanged: (value) {
                  setState(() {
                    _enabled = value;
                  });
                },
                content: const Text('Ativado'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Servidor SMTP',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: AppTextField(
                  controller: _smtpHostController,
                  label: 'Host',
                  hint: 'smtp.gmail.com',
                  enabled: _enabled,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NumericField(
                  controller: _smtpPortController,
                  label: 'Porta',
                  hint: '587',
                  enabled: _enabled,
                  minValue: 1,
                  maxValue: 65535,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Checkbox(
            checked: _useSsl,
            onChanged: _enabled
                ? (value) {
                    setState(() {
                      _useSsl = value ?? true;
                    });
                  }
                : null,
            content: const Text('Usar SSL/TLS'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Credenciais',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: _usernameController,
            label: 'Usuário',
            hint: 'usuario@email.com',
            enabled: _enabled,
            prefixIcon: const Icon(FluentIcons.contact),
          ),
          const SizedBox(height: 12),
          PasswordField(
            controller: _passwordController,
            label: 'Senha',
            hint: 'Senha do email',
            enabled: _enabled,
          ),
          const SizedBox(height: 16),
          const Text(
            'Endereços de Email',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: _fromEmailController,
            label: 'De (remetente)',
            hint: 'sistema@empresa.com',
            enabled: _enabled,
            prefixIcon: const Icon(FluentIcons.forward),
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _toEmailController,
            label: 'Para (destinatário)',
            hint: 'admin@empresa.com',
            enabled: _enabled,
            prefixIcon: const Icon(FluentIcons.mail),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationPreferencesSection() {
    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Eventos que Enviam Email',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Selecione quais eventos devem gerar notificações por email (requer confirmação do usuário):',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Checkbox(
            checked: _notifyOnPrintFailure,
            onChanged: _enabled
                ? (value) {
                    setState(() {
                      _notifyOnPrintFailure = value ?? true;
                    });
                  }
                : null,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Falha de Impressão',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Quando um job de impressão falha ao ser enviado',
                  style: TextStyle(fontSize: 12, color: Colors.grey[130]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Checkbox(
            checked: _notifyOnPrinterOffline,
            onChanged: _enabled
                ? (value) {
                    setState(() {
                      _notifyOnPrinterOffline = value ?? true;
                    });
                  }
                : null,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Impressora Offline',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Quando uma impressora fica offline ou indisponível',
                  style: TextStyle(fontSize: 12, color: Colors.grey[130]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Checkbox(
            checked: _notifyOnJobStuck,
            onChanged: _enabled
                ? (value) {
                    setState(() {
                      _notifyOnJobStuck = value ?? true;
                    });
                  }
                : null,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Job Travado',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Quando um job atinge o máximo de tentativas de envio',
                  style: TextStyle(fontSize: 12, color: Colors.grey[130]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Checkbox(
            checked: _notifyOnAuthFailure,
            onChanged: _enabled
                ? (value) {
                    setState(() {
                      _notifyOnAuthFailure = value ?? true;
                    });
                  }
                : null,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Falha de Autenticação',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Quando há tentativas de acesso não autorizadas',
                  style: TextStyle(fontSize: 12, color: Colors.grey[130]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSection(NotificationProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_enabled)
          Button(
            onPressed: provider.isTesting
                ? null
                : () => context.read<NotificationProvider>().testConnection(),
            child: provider.isTesting
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: ProgressRing(),
                      ),
                      SizedBox(width: 8),
                      Text('Testando...'),
                    ],
                  )
                : const Text('Testar Conexão'),
          ),
        const SizedBox(width: 12),
        FilledButton(
          onPressed: provider.isLoading ? null : _saveConfig,
          child: provider.isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: ProgressRing(),
                )
              : const Text('Salvar Configuração'),
        ),
      ],
    );
  }

  void _saveConfig() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final provider = context.read<NotificationProvider>();
    final config = EmailConfig(
      id: provider.emailConfig?.id ??
          provider.createDefaultConfig().id,
      smtpHost: _smtpHostController.text,
      smtpPort: int.tryParse(_smtpPortController.text) ?? 587,
      useSsl: _useSsl,
      username: _usernameController.text,
      password: _passwordController.text,
      fromEmail: _fromEmailController.text,
      toEmail: _toEmailController.text,
      enabled: _enabled,
      notifyOnPrintFailure: _notifyOnPrintFailure,
      notifyOnPrinterOffline: _notifyOnPrinterOffline,
      notifyOnJobStuck: _notifyOnJobStuck,
      notifyOnAuthFailure: _notifyOnAuthFailure,
    );

    provider.saveConfig(config);
  }
}
