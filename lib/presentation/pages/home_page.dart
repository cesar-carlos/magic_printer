import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/dtos/printer_dto.dart';
import '../../core/routes/route_names.dart';
import '../../shared/shared.dart';
import '../providers/printer_provider.dart';
import '../widgets/error_listener.dart';
import '../widgets/loading_overlay.dart';
import '../widgets/printer_card.dart';
import '../widgets/page_actions_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _pagePadding = EdgeInsets.all(16);
  static const _topActionsPadding = EdgeInsets.fromLTRB(16, 12, 16, 0);
  static const _cardSpacing = 12.0;
  static const _sectionSpacing = 24.0;
  static const _headerBadgeColor = Color(0xFF0078D4);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPrinters();
    });
  }

  void _loadPrinters() {
    context.read<PrinterProvider>().loadPrinters();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrinterProvider>(
      builder: (context, provider, child) {
        return ErrorListener(
          error: provider.error,
          onErrorShown: () => provider.clearError(),
          child: LoadingOverlay(
            isLoading: provider.isLoading,
            message: 'Carregando impressoras...',
            child: _PrinterDashboardContent(
              provider: provider,
              onRefresh: _loadPrinters,
              onAdd: () async {
                await context.push(RouteNames.setup);
                if (mounted) {
                  _loadPrinters();
                }
              },
              onTapPrinter: (printer) {
                provider.selectPrinter(printer);
                _showPrinterDetails(context, printer);
              },
              onTestPrinter: (printer) => _testPrinter(context, printer),
              onConfigurePrinter: () {
                if (mounted) {
                  context.push(RouteNames.setup);
                }
              },
              onDeletePrinter: (printer) =>
                  _confirmDeletePrinter(context, printer, provider),
              topActionsPadding: _topActionsPadding,
              pagePadding: _pagePadding,
              cardSpacing: _cardSpacing,
              sectionSpacing: _sectionSpacing,
              headerBadgeColor: _headerBadgeColor,
            ),
          ),
        );
      },
    );
  }

  void _showPrinterDetails(BuildContext context, PrinterDTO printer) {
    final details = <String>[
      'Status: ${printer.status}',
      if (printer.hostId != null) 'Host: ${printer.hostId}',
      if (printer.locationDescription != null)
        'Localização: ${printer.locationDescription}',
      if (printer.driverName != null) 'Driver: ${printer.driverName}',
      if (printer.comment != null) 'Comentário: ${printer.comment}',
    ].join('\n');

    MessageModal.showInfo(
      context,
      title: printer.name,
      message: details,
      buttonLabel: 'Fechar',
    );
  }

  void _testPrinter(BuildContext context, PrinterDTO printer) {
    displayInfoBar(
      context,
      builder: (context, close) {
        return InfoBar(
          title: const Text('Teste de Impressora'),
          content: Text('Testando impressora: ${printer.name}'),
          severity: InfoBarSeverity.info,
        );
      },
      duration: const Duration(seconds: 2),
    );
  }

  Future<void> _confirmDeletePrinter(
    BuildContext context,
    PrinterDTO printer,
    PrinterProvider provider,
  ) async {
    final result = await MessageModal.showConfirmation(
      context,
      title: 'Remover Impressora',
      message:
          'Tem certeza que deseja remover a impressora "${printer.displayName}"?\n\nEsta ação não pode ser desfeita.',
      confirmLabel: 'Remover',
      cancelLabel: 'Cancelar',
    );

    if (result == true && context.mounted) {
      await provider.deletePrinter(printer.id);

      if (context.mounted && provider.error == null) {
        displayInfoBar(
          context,
          builder: (context, close) {
            return InfoBar(
              title: const Text('Impressora Removida'),
              content: Text('${printer.displayName} foi removida com sucesso.'),
              severity: InfoBarSeverity.success,
            );
          },
          duration: const Duration(seconds: 3),
        );
      }
    }
  }
}

class _PrinterDashboardContent extends StatelessWidget {
  final PrinterProvider provider;
  final VoidCallback onRefresh;
  final Future<void> Function() onAdd;
  final void Function(PrinterDTO printer) onTapPrinter;
  final void Function(PrinterDTO printer) onTestPrinter;
  final VoidCallback onConfigurePrinter;
  final Future<void> Function(PrinterDTO printer) onDeletePrinter;
  final EdgeInsets pagePadding;
  final EdgeInsets topActionsPadding;
  final double cardSpacing;
  final double sectionSpacing;
  final Color headerBadgeColor;

  const _PrinterDashboardContent({
    required this.provider,
    required this.onRefresh,
    required this.onAdd,
    required this.onTapPrinter,
    required this.onTestPrinter,
    required this.onConfigurePrinter,
    required this.onDeletePrinter,
    required this.pagePadding,
    required this.topActionsPadding,
    required this.cardSpacing,
    required this.sectionSpacing,
    required this.headerBadgeColor,
  });

  @override
  Widget build(BuildContext context) {
    if (provider.printers.isEmpty && !provider.isLoading) {
      return EmptyState(
        icon: Icons.print_disabled,
        message:
            'Nenhuma impressora encontrada\nUse o botão + para adicionar uma impressora',
        actionLabel: 'Adicionar Impressora',
        onAction: onAdd,
      );
    }

    final localPrinters = provider.printers.where((p) => p.isLocal).toList();
    final remotePrinters = provider.printers.where((p) => p.isRemote).toList();

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
              if (localPrinters.isNotEmpty) ...[
                _SectionHeader(
                  title: 'Impressoras Locais',
                  count: localPrinters.length,
                  badgeColor: headerBadgeColor,
                ),
                SizedBox(height: cardSpacing),
                for (final printer in localPrinters)
                  Padding(
                    padding: EdgeInsets.only(bottom: cardSpacing),
                    child: PrinterCard(
                      printer: printer,
                      onTap: () => onTapPrinter(printer),
                      onTest: () => onTestPrinter(printer),
                      onConfigure: onConfigurePrinter,
                      onDelete: printer.isRemote
                          ? () => onDeletePrinter(printer)
                          : null,
                    ),
                  ),
                SizedBox(height: sectionSpacing),
              ],
              if (remotePrinters.isNotEmpty) ...[
                _SectionHeader(
                  title: 'Impressoras Remotas',
                  count: remotePrinters.length,
                  badgeColor: headerBadgeColor,
                ),
                SizedBox(height: cardSpacing),
                for (final printer in remotePrinters)
                  Padding(
                    padding: EdgeInsets.only(bottom: cardSpacing),
                    child: PrinterCard(
                      printer: printer,
                      onTap: () => onTapPrinter(printer),
                      onTest: () => onTestPrinter(printer),
                      onConfigure: onConfigurePrinter,
                      onDelete: () => onDeletePrinter(printer),
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final Color badgeColor;

  const _SectionHeader({
    required this.title,
    required this.count,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Row(
      children: [
        Text(
          title,
          style: theme.typography.title?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        _CountBadge(
          count: count,
          color: badgeColor,
        ),
      ],
    );
  }
}

class _CountBadge extends StatelessWidget {
  final int count;
  final Color color;

  const _CountBadge({
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
