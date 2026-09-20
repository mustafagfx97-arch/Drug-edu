import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';

class IvPrepScreen extends StatefulWidget {
  const IvPrepScreen({super.key});

  @override
  State<IvPrepScreen> createState() => _IvPrepScreenState();
}

class _IvPrepScreenState extends State<IvPrepScreen> {
  String _population = 'General';

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
                suffixIcon: Icon(Icons.qr_code_scanner_rounded),
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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              '$_population profiles',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _ProfileCard(
                  name: _population == 'NICU'
                      ? 'Caffeine Citrate'
                      : _population == 'PICU'
                          ? 'Norepinephrine'
                          : 'Vancomycin',
                  subtitle: _population == 'NICU'
                      ? 'Formulation-specific neonatal preparation'
                      : _population == 'PICU'
                          ? 'Pediatric standard concentration profile'
                          : 'Intermittent IV preparation profile',
                  authority: _population == 'NICU'
                      ? 'ANMF neonatal standard'
                      : _population == 'PICU'
                          ? 'ASHP pediatric standard'
                          : 'Manufacturer / institutional',
                ),
                const SizedBox(height: 10),
                const _ProfileCard(
                  name: 'High-alert profile example',
                  subtitle:
                      'Exact concentration and recipe appear only after product selection.',
                  authority: 'Safety-gated',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
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
