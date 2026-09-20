import 'package:flutter/material.dart';

class FeedingTubesScreen extends StatelessWidget {
  const FeedingTubesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final sections = const [
      _ModuleSection(
        title: 'Medication suitability',
        subtitle:
            'Check dosage form, release mechanism, coating, hazardous handling and tube route before preparation.',
        icon: Icons.fact_check_outlined,
      ),
      _ModuleSection(
        title: 'Crush / open / dissolve',
        subtitle:
            'Product-specific handling records. Do-not-crush rules are never generalized across formulations.',
        icon: Icons.medication_outlined,
      ),
      _ModuleSection(
        title: 'Liquid formulations',
        subtitle:
            'Concentration, viscosity, sorbitol burden, dilution needs and formulation-specific administration notes.',
        icon: Icons.water_drop_outlined,
      ),
      _ModuleSection(
        title: 'Flush & separation workflow',
        subtitle:
            'A structured administration sequence with medicine-by-medicine separation instead of mixing medicines together.',
        icon: Icons.route_outlined,
      ),
      _ModuleSection(
        title: 'NICU / small-volume preparation',
        subtitle:
            'Separate neonatal handling records for medicines commonly prepared from tablets or capsules when suitable products are unavailable.',
        icon: Icons.child_care_outlined,
      ),
      _ModuleSection(
        title: 'Oral use of injectable products',
        subtitle:
            'A dedicated verified list. Injectable formulations are never assumed safe for oral use without product-specific evidence.',
        icon: Icons.warning_amber_rounded,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Feeding Tubes')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Tube administration library',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Organized around the practical question: can this formulation be given through the tube, and exactly how should it be prepared?',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TubeRule(
                  title: '1. Verify the exact formulation',
                  body:
                      'Do not assume a tablet can be crushed because another formulation of the same drug can be.',
                ),
                _TubeRule(
                  title: '2. Give medicines separately',
                  body:
                      'Do not mix multiple medicines together in one cup or syringe unless a validated protocol specifically allows it.',
                ),
                _TubeRule(
                  title: '3. Flush is patient- and tube-specific',
                  body:
                      'Use the prescribed/local flush volume. Neonates, fluid-restricted patients and small-bore tubes require individualized volumes.',
                ),
                _TubeRule(
                  title: '4. Do not stop feeds routinely',
                  body:
                      'Hold or separate enteral nutrition only when the medicine has a documented interaction or administration requirement.',
                ),
                _TubeRule(
                  title: '5. Tube tip location matters',
                  body:
                      'Gastric and post-pyloric administration are not automatically interchangeable for every medicine or formulation.',
                ),
                _TubeRule(
                  title: '6. Injectable by mouth requires verification',
                  body:
                      'Never assume an IV/IM ampoule is safe to drink. Oral use must be supported for the exact formulation.',
                  isLast: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          for (final section in sections) ...[
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
                    section.icon,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  section.title,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(section.subtitle),
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

class _TubeRule extends StatelessWidget {
  const _TubeRule({
    required this.title,
    required this.body,
    this.isLast = false,
  });

  final String title;
  final String body;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _ModuleSection {
  const _ModuleSection({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}
