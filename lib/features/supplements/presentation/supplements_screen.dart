import 'package:flutter/material.dart';

class SupplementsScreen extends StatelessWidget {
  const SupplementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final groups = const [
      _SupplementGroup(
        title: 'Vitamins',
        subtitle:
            'Vitamin D, B vitamins, folate and other commonly used products with form, timing and monitoring notes.',
        icon: Icons.wb_sunny_outlined,
      ),
      _SupplementGroup(
        title: 'Minerals',
        subtitle:
            'Iron, calcium, magnesium, zinc and other salts kept formulation-specific so elemental content is clear.',
        icon: Icons.hexagon_outlined,
      ),
      _SupplementGroup(
        title: 'Pediatric supplements',
        subtitle:
            'Age-appropriate products, routine versus test-guided use, and practical administration for children.',
        icon: Icons.child_friendly_outlined,
      ),
      _SupplementGroup(
        title: 'Combination products',
        subtitle:
            'The app separates ingredient-level counseling from the actual combination product to avoid duplicate or excessive dosing.',
        icon: Icons.grid_view_outlined,
      ),
      _SupplementGroup(
        title: 'Growth / amino-acid products',
        subtitle:
            'Products marketed for growth are kept in a separate evidence-focused area rather than mixed with essential vitamins and minerals.',
        icon: Icons.trending_up_rounded,
      ),
      _SupplementGroup(
        title: 'Safety review',
        subtitle:
            'High-risk weight-loss and withdrawn or unsafe products are flagged separately from routine supplements.',
        icon: Icons.health_and_safety_outlined,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Supplements')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Supplement counseling library',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Organized by what the pharmacist needs to decide: product form, elemental amount, who actually needs it, and how the patient should take it.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          for (final group in groups) ...[
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    group.icon,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  group.title,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(group.subtitle),
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _SupplementGroup {
  const _SupplementGroup({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}
