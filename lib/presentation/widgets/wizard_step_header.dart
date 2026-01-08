import 'package:fluent_ui/fluent_ui.dart';

class WizardStepHeader extends StatelessWidget {
  final String title;
  final String description;

  const WizardStepHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final typography = FluentTheme.of(context).typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: typography.titleLarge),
        const SizedBox(height: 8),
        Text(description, style: typography.body),
        const SizedBox(height: 24),
      ],
    );
  }
}


