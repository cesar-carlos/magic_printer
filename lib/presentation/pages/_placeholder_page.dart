import 'package:fluent_ui/fluent_ui.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const PlaceholderPage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: theme.typography.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: theme.typography.body,
            ),
          ],
        ),
      ),
    );
  }
}

