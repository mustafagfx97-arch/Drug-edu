import 'package:flutter/material.dart';

import '../../minerals/presentation/mineral_toolkit_screen.dart';
import '../../vitamins/presentation/vitamin_toolkit_screen.dart';
import '../../probiotics/presentation/probiotic_atlas_screen.dart';
import '../../specialty/presentation/specialty_toolkit_screen.dart';
import '../../herbals/presentation/herbal_toolkit_screen.dart';
import '../../products/presentation/product_analyzer_screen.dart';
import '../../joints/presentation/joint_toolkit_screen.dart';
import '../../stack/presentation/stack_safety_screen.dart';
import '../../reproductive/presentation/reproductive_toolkit_screen.dart';
import '../../needs_matrix/presentation/need_matrix_screen.dart';

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
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.medical_information_outlined,
            title: 'GI & Specialty Supplements',
            subtitle:
                'Lactase, alpha-galactosidase, DAO, peppermint oil, liver and metabolic supplements with exact-use locks.',
            onTap: () => _open(context, const SpecialtyToolkitScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.spa_outlined,
            title: 'Herbals, Menopause & Nerves',
            subtitle:
                'Black cohosh, phytoestrogens, stress/sleep herbs, mood and cognition supplements with extract-specific doses and safety locks.',
            onTap: () => _open(context, const HerbalToolkitScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.accessibility_new_outlined,
            title: 'Joint & Collagen Toolkit',
            subtitle:
                'Glucosamine, chondroitin, native type II vs collagen peptides, MSM, oral HA and SAMe with dose/evidence locks.',
            onTap: () => _open(context, const JointToolkitScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.assignment_ind_outlined,
            title: 'Who Actually Needs What?',
            subtitle:
                'Healthy vs prevention vs testing vs deficiency treatment vs disease/surgery protocols — with daily-dose and lab logic.',
            onTap: () => _open(context, const NeedMatrixScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.favorite_outline_rounded,
            title: 'Sexual Health & Fertility',
            subtitle:
                'Male/female sexual supplements, male/female fertility adjuncts, exact study doses, evidence strength, testing and referral locks.',
            onTap: () => _open(context, const ReproductiveToolkitScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.compare_arrows_rounded,
            title: 'Can I Take These Together?',
            subtitle:
                'Patient-facing stack safety: what can be combined, what should be separated, GI burden and high-value medicine/condition flags.',
            onTap: () => _open(context, const StackSafetyScreen()),
          ),
          const SizedBox(height: 12),
          _ToolkitCard(
            icon: Icons.fact_check_outlined,
            title: 'Product & Combination Analyzer',
            subtitle:
                'Read Supplement Facts, aggregate daily doses, detect duplicates, review ULs/interactions, and inspect verified real-product examples.',
            onTap: () => _open(context, const ProductAnalyzerScreen()),
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
