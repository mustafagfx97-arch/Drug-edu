import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';

class IvPrepScreen extends StatefulWidget {
  const IvPrepScreen({super.key});

  @override
  State<IvPrepScreen> createState() => _IvPrepScreenState();
}

class _IvPrepScreenState extends State<IvPrepScreen> {
  String _population = 'General';

  List<_IvCategory> get _categories {
    if (_population == 'NICU') {
      return const [
        _IvCategory(
          title: 'Antimicrobials',
          subtitle:
              'Neonatal antibiotic, antiviral and antifungal preparation profiles.',
          icon: Icons.biotech_outlined,
        ),
        _IvCategory(
          title: 'Cardiac & vasoactive',
          subtitle:
              'Continuous infusions and high-risk cardiovascular preparations.',
          icon: Icons.monitor_heart_outlined,
        ),
        _IvCategory(
          title: 'Respiratory & PDA',
          subtitle:
              'Caffeine, pulmonary vasodilator and PDA-related preparation profiles.',
          icon: Icons.air_outlined,
        ),
        _IvCategory(
          title: 'Neurology, sedation & paralysis',
          subtitle:
              'Antiseizure, analgesic, sedative and neuromuscular-blocker preparations.',
          icon: Icons.psychology_outlined,
        ),
        _IvCategory(
          title: 'Electrolytes & glucose',
          subtitle:
              'Calcium, magnesium, bicarbonate, potassium, phosphate, saline and dextrose profiles.',
          icon: Icons.water_drop_outlined,
        ),
        _IvCategory(
          title: 'Emergency & special products',
          subtitle:
              'Antidotes, albumin, IVIG, endocrine and other neonatal high-risk preparations.',
          icon: Icons.emergency_outlined,
        ),
      ];
    }

    if (_population == 'PICU') {
      return const [
        _IvCategory(
          title: 'Vasoactive & cardiac',
          subtitle:
              'Standard pediatric infusion concentrations and product-specific preparation.',
          icon: Icons.monitor_heart_outlined,
        ),
        _IvCategory(
          title: 'Sedation & analgesia',
          subtitle:
              'Opioid, sedative and continuous critical-care preparations.',
          icon: Icons.bedtime_outlined,
        ),
        _IvCategory(
          title: 'Neuromuscular blockade',
          subtitle:
              'Paralytic preparations with dedicated high-alert safety gates.',
          icon: Icons.accessibility_new_outlined,
        ),
        _IvCategory(
          title: 'Electrolytes & metabolic',
          subtitle:
              'Electrolyte replacement, dextrose, insulin and metabolic infusions.',
          icon: Icons.bolt_outlined,
        ),
        _IvCategory(
          title: 'Anticoagulation & hemostasis',
          subtitle:
              'Heparin, direct anticoagulants, fibrinolytic and antifibrinolytic preparation profiles.',
          icon: Icons.bloodtype_outlined,
        ),
        _IvCategory(
          title: 'Other continuous infusions',
          subtitle:
              'Additional pediatric standard concentrations and manufacturer-specific infusions.',
          icon: Icons.speed_outlined,
        ),
      ];
    }

    return const [
      _IvCategory(
        title: 'Antibiotics',
        subtitle:
            'Reconstitution and further dilution for commonly used IV antibacterials.',
        icon: Icons.biotech_outlined,
      ),
      _IvCategory(
        title: 'Antifungals & antivirals',
        subtitle:
            'Product-specific preparation for systemic antifungal and antiviral agents.',
        icon: Icons.coronavirus_outlined,
      ),
      _IvCategory(
        title: 'Cardiovascular',
        subtitle:
            'Antiarrhythmics, vasopressors, vasodilators and cardiovascular infusions.',
        icon: Icons.monitor_heart_outlined,
      ),
      _IvCategory(
        title: 'Neurology & sedation',
        subtitle:
            'Antiseizure agents, sedatives, analgesics and anesthesia-related preparations.',
        icon: Icons.psychology_outlined,
      ),
      _IvCategory(
        title: 'Electrolytes & metabolic',
        subtitle:
            'Potassium, calcium, magnesium, bicarbonate, phosphate, dextrose and insulin.',
        icon: Icons.bolt_outlined,
      ),
      _IvCategory(
        title: 'Emergency & antidotes',
        subtitle:
            'Resuscitation, reversal agents, antidotes and other high-risk emergency preparations.',
        icon: Icons.emergency_outlined,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text('IV Preparation'),
          automaticallyImplyLeading: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          sliver: SliverToBoxAdapter(
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'General', label: Text('General')),
                ButtonSegment(value: 'NICU', label: Text('NICU')),
                ButtonSegment(value: 'PICU', label: Text('PICU')),
              ],
              selected: {_population},
              onSelectionChanged: (value) {
                setState(() => _population = value.first);
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
          sliver: SliverToBoxAdapter(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search IV medication or formulation',
                prefixIcon: Icon(Icons.search_rounded),
                suffixIcon: Icon(Icons.tune_rounded),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          sliver: SliverToBoxAdapter(
            child: SectionCard(
              title: 'Safe workflow',
              icon: Icons.shield_outlined,
              child: Column(
                children: const [
                  _WorkflowRow(
                    number: '1',
                    title: 'Select population',
                    detail: 'General, NICU and PICU profiles stay separate.',
                  ),
                  _WorkflowRow(
                    number: '2',
                    title: 'Select exact formulation',
                    detail:
                        'Vial strength, salt/base and product-specific differences are explicit.',
                  ),
                  _WorkflowRow(
                    number: '3',
                    title: 'Verify preparation authority',
                    detail:
                        'RTU, manufacturer, ANMF, ASHP or institution-specific.',
                  ),
                  _WorkflowRow(
                    number: '4',
                    title: 'Enter the prescribed dose',
                    detail:
                        'The calculator converts the order; it never chooses treatment doses.',
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              '$_population library',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
          sliver: SliverToBoxAdapter(
            child: _ProfileCard(
              name: _population == 'NICU'
                  ? 'Caffeine Citrate'
                  : _population == 'PICU'
                      ? 'Norepinephrine'
                      : 'Vancomycin',
              subtitle: _population == 'NICU'
                  ? 'Example neonatal profile linked to the V1 calculator.'
                  : _population == 'PICU'
                      ? 'Example pediatric standard-concentration profile linked to the V1 calculator.'
                      : 'Example intermittent IV preparation record.',
              authority: _population == 'NICU'
                  ? 'ANMF neonatal standard'
                  : _population == 'PICU'
                      ? 'Pediatric standard concentration'
                      : 'Manufacturer / institutional',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Browse by category',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverList.separated(
            itemCount: _categories.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final category = _categories[index];
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      category.icon,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: Text(
                    category.title,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(category.subtitle),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _IvCategory {
  const _IvCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

class _WorkflowRow extends StatelessWidget {
  const _WorkflowRow({
    required this.number,
    required this.title,
    required this.detail,
    this.isLast = false,
  });

  final String number;
  final String title;
  final String detail;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              number,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detail,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.35,
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

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.name,
    required this.subtitle,
    required this.authority,
  });

  final String name;
  final String subtitle;
  final String authority;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(Icons.vaccines_outlined),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle),
              const SizedBox(height: 8),
              Text(
                authority,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
