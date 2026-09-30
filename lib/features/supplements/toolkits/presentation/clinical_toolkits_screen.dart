import 'package:flutter/material.dart';

import '../../minerals/presentation/mineral_toolkit_screen.dart';
import '../../vitamins/presentation/vitamin_toolkit_screen.dart';
import '../../probiotics/presentation/probiotic_atlas_screen.dart';

class ClinicalToolkitsScreen extends StatelessWidget {
  const ClinicalToolkitsScreen({super.key});

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Clinical Toolkits')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          Text(
            'Choose the clinical layer',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            'Use Daily Needs for nutrition targets. Use these toolkits when formulation, treatment-dose, salt/form, monitoring or interaction details matter.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          _ToolkitCard(
            icon: Icons.science_outlined,
            title: 'Mineral Clinical Toolkit',
            subtitle:
                'Iron, calcium, magnesium and zinc: salts, elemental conversions, clinical pathways and interactions.',
            onTap: () => _open(context, const MineralToolkitScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.bubble_chart_outlined,
            title: 'Vitamin Clinical Toolkit',
            subtitle:
                'A, B-complex, C, D, E and K: forms, prevention vs treatment, safety locks, and mitochondrial/neurometabolic bridge.',
            onTap: () => _open(context, const VitaminToolkitScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.biotech_outlined,
            title: 'Probiotic Strain Atlas',
            subtitle:
                'Strain-specific indications, exact CFU/mg doses, duration, product technique, safety, prebiotics and synbiotics.',
            onTap: () => _open(context, const ProbioticAtlasScreen()),
          ),
        ],
      ),
    );
  }
}

class _ToolkitCard extends StatelessWidget {
  const _ToolkitCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 29),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
