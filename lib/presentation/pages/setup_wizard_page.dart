import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons, Theme;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constants.dart';
import '../../shared/shared.dart';
import '../providers/setup_wizard_provider.dart';
import '../widgets/error_listener.dart';
import '../widgets/loading_overlay.dart';
import '../widgets/wizard_step_header.dart';

class SetupWizardPage extends StatefulWidget {
  const SetupWizardPage({super.key});

  @override
  State<SetupWizardPage> createState() => _SetupWizardPageState();
}

class _SetupWizardPageState extends State<SetupWizardPage> {
  final TextEditingController _hostNameController = TextEditingController();
  final TextEditingController _hostAddressController = TextEditingController();
  final TextEditingController _hostPortController = TextEditingController();
  final TextEditingController _capturePrinterController =
      TextEditingController();
  final TextEditingController _printerAliasController = TextEditingController();
  final TextEditingController _printerDescriptionController =
      TextEditingController();

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final provider = context.read<SetupWizardProvider>();

    final hostAddress = provider.hostAddress ?? '';
    final hostPort = provider.hostPort ?? defaultHostPort;

    _hostNameController.text = provider.hostName ?? '';
    _hostAddressController.text = hostAddress;
    _hostPortController.text = hostPort.toString();
    _capturePrinterController.text = provider.printerName ?? '';
    _printerAliasController.text = provider.printerAlias ?? '';
    _printerDescriptionController.text = provider.printerDescription ?? '';

    // Sincronizar valores iniciais com o provider APÓS o build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        provider.setHostInfo(
          name: provider.hostName,
          address: hostAddress.isNotEmpty ? hostAddress : null,
          port: hostPort,
        );
      }
    });

    _initialized = true;
  }

  @override
  void dispose() {
    _hostNameController.dispose();
    _hostAddressController.dispose();
    _hostPortController.dispose();
    _capturePrinterController.dispose();
    _printerAliasController.dispose();
    _printerDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(title: const Text('Assistente de Setup')),
      content: Consumer<SetupWizardProvider>(
        builder: (context, provider, child) {
          return ErrorListener(
            error: provider.error,
            onErrorShown: () => provider.clearError(),
            child: LoadingOverlay(
              isLoading: provider.isLoading,
              message: _getLoadingMessage(provider.currentStep),
              child: Column(
                children: [
                  _buildProgressIndicator(context, provider),
                  Expanded(child: _buildStepContent(context, provider)),
                  _buildNavigationButtons(context, provider),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator(
    BuildContext context,
    SetupWizardProvider provider,
  ) {
    final steps = SetupWizardStep.values;
    final currentIndex = steps.indexOf(provider.currentStep);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          for (int index = 0; index < steps.length; index++) ...[
            if (index > 0)
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: index <= currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                ),
              ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentIndex
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              child: Center(
                child: index == currentIndex
                    ? const Icon(Icons.check, size: 18, color: Colors.white)
                    : Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: index <= currentIndex ? Colors.white : null,
                        ),
                      ),
              ),
            ),
          ],
          if (steps.length > 1)
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: currentIndex >= steps.length - 1
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.2),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStepContent(BuildContext context, SetupWizardProvider provider) {
    switch (provider.currentStep) {
      case SetupWizardStep.hostInfo:
        return _buildHostInfoStep(context, provider);
      case SetupWizardStep.selectPrinter:
        return _buildSelectPrinterStep(context, provider);
      case SetupWizardStep.configurePrinter:
        return _buildConfigurePrinterStep(context, provider);
      case SetupWizardStep.test:
        return _buildTestStep(context, provider);
    }
  }

  Widget _buildHostInfoStep(
    BuildContext context,
    SetupWizardProvider provider,
  ) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WizardStepHeader(
            title: 'Informar Host',
            description:
                'Informe o endereço IP e porta do host que compartilha impressoras.',
          ),
          AppTextField(
            controller: _hostNameController,
            label: 'Nome do Host (opcional)',
            hint: 'Ex: PC-FINANCEIRO',
            onChanged: (value) => provider.setHostInfo(name: value),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: AppTextField(
                  controller: _hostAddressController,
                  label: 'Endereço IP',
                  hint: '127.0.0.1',
                  keyboardType: TextInputType.number,
                  onChanged: (value) => provider.setHostInfo(address: value),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: NumericField(
                  controller: _hostPortController,
                  label: 'Porta',
                  hint: defaultHostPort.toString(),
                  minValue: 1,
                  maxValue: 65535,
                  onChanged: (value) {
                    final port = int.tryParse(value);
                    if (port != null) {
                      provider.setHostInfo(port: port);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              label: 'Conectar',
              onPressed: provider.isLoading
                  ? null
                  : () {
                      // Garantir que os valores dos controllers estejam sincronizados
                      final address = _hostAddressController.text.trim();
                      final portText = _hostPortController.text.trim();
                      final port = int.tryParse(portText);

                      provider.setHostInfo(
                        name: _hostNameController.text.trim(),
                        address: address.isNotEmpty ? address : null,
                        port: port,
                      );

                      provider.connectToHost();
                    },
              isLoading: provider.isLoading,
              icon: Icons.electrical_services,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectPrinterStep(
    BuildContext context,
    SetupWizardProvider provider,
  ) {
    if (provider.availablePrinters.isEmpty) {
      return const EmptyState(
        icon: Icons.print_disabled,
        message:
            'Nenhuma impressora disponível\nVerifique se o host está online e compartilhando impressoras.',
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WizardStepHeader(
            title: 'Selecionar Impressora',
            description: 'Escolha a impressora que deseja configurar.',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.availablePrinters.length,
              itemBuilder: (context, index) {
                final printer = provider.availablePrinters[index];
                final isSelected = provider.selectedPrinter?.id == printer.id;
                final accentColor = FluentTheme.of(context).accentColor;

                return ListTile.selectable(
                  selected: isSelected,
                  selectionMode: ListTileSelectionMode.single,
                  onSelectionChange: (_) => provider.selectPrinter(printer),
                  onPressed: () => provider.selectPrinter(printer),
                  cursor: SystemMouseCursors.click,
                  tileColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return accentColor.withValues(alpha: 0.1);
                    }
                    return Colors.transparent;
                  }),
                  leading: Icon(
                    isSelected
                        ? FluentIcons.check_mark
                        : FluentIcons.radio_bullet,
                    color: isSelected ? accentColor : null,
                  ),
                  title: Text(printer.name),
                  subtitle:
                      (printer.locationDescription?.trim().isNotEmpty ?? false)
                      ? Text(printer.locationDescription!.trim())
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigurePrinterStep(
    BuildContext context,
    SetupWizardProvider provider,
  ) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WizardStepHeader(
            title: 'Configurar Impressora',
            description:
                'Selecione a impressora local que será monitorada (captura) e dê um apelido para a impressora remota.',
          ),
          AppTextField(
            controller: _capturePrinterController,
            label: 'Impressora local (captura)',
            hint: 'Microsoft Print to PDF',
            onChanged: (value) => provider.setPrinterName(value),
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _printerAliasController,
            label: 'Apelido da impressora remota *',
            hint: 'Ex: Impressora do Financeiro',
            onChanged: (value) => provider.setPrinterAlias(value),
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _printerDescriptionController,
            label: 'Descrição (opcional)',
            hint: 'Ex: Impressora HP LaserJet no 2º andar',
            maxLines: 3,
            onChanged: (value) => provider.setPrinterDescription(value),
          ),
          const SizedBox(height: 24),
          if (provider.selectedPrinter != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Impressora de destino (host):',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      provider.selectedPrinter!.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (provider.selectedPrinter!.locationDescription !=
                        null) ...[
                      const SizedBox(height: 4),
                      Text(
                        provider.selectedPrinter!.locationDescription!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTestStep(BuildContext context, SetupWizardProvider provider) {
    final title = provider.testPassed
        ? 'Teste Concluído!'
        : 'Testando Conexão...';
    final description = provider.testPassed
        ? 'A impressora está pronta para uso.'
        : 'Aguarde enquanto testamos a conexão.';

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            provider.testPassed ? Icons.check_circle : Icons.hourglass_empty,
            size: 64,
            color: provider.testPassed
                ? Colors.green
                : Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 24),
          WizardStepHeader(title: title, description: description),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    SetupWizardProvider provider,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            label: 'Voltar',
            onPressed: provider.canGoBack
                ? () => provider.previousStep()
                : null,
            isPrimary: false,
            icon: Icons.chevron_left,
          ),
          const SizedBox(width: 12),
          AppButton(
            label: provider.currentStep == SetupWizardStep.test
                ? 'Concluir'
                : 'Próximo',
            onPressed: provider.canGoNext && !provider.isLoading
                ? () {
                    if (provider.currentStep == SetupWizardStep.test) {
                      _finishWizard(context);
                    } else {
                      provider.nextStep();
                    }
                  }
                : null,
            isLoading: provider.isLoading,
            icon: provider.currentStep == SetupWizardStep.test
                ? Icons.check
                : Icons.chevron_right,
          ),
        ],
      ),
    );
  }

  Future<void> _finishWizard(BuildContext context) async {
    context.read<SetupWizardProvider>().startForwarding();
    await MessageModal.showSuccess(
      context,
      title: 'Setup Concluído!',
      message: 'A impressora foi configurada com sucesso.',
    );
    if (context.mounted) {
      context.pop();
    }
  }

  String _getLoadingMessage(SetupWizardStep step) {
    switch (step) {
      case SetupWizardStep.hostInfo:
        return 'Conectando ao host...';
      case SetupWizardStep.selectPrinter:
        return 'Carregando impressoras...';
      case SetupWizardStep.configurePrinter:
        return 'Configurando impressora...';
      case SetupWizardStep.test:
        return 'Testando conexão...';
    }
  }
}
