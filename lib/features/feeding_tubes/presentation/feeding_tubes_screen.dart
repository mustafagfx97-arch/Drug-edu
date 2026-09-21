import 'package:flutter/material.dart';

import '../data/feeding_tube_records.dart';

class FeedingTubesScreen extends StatelessWidget {
  const FeedingTubesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feeding Tubes'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Workflow'),
              Tab(text: 'Feed interactions'),
              Tab(text: 'Crush / formulation'),
              Tab(text: 'NICU & injectables'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _WorkflowTab(),
            _FeedInteractionsTab(),
            _FormulationTab(),
            _SpecialSituationsTab(),
          ],
        ),
      ),
    );
  }
}

class _WorkflowTab extends StatelessWidget {
  const _WorkflowTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        Text(
          'Practical enteral-medication workflow',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          'Use this only after confirming the exact formulation and where the tube ends. The numbers below are adult/general SPS reference values, not neonatal flush volumes.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 14),
        _SafetyBanner(
          title: 'Pediatric / NICU safety lock',
          text:
              'Do not copy adult 30 mL / 10 mL flush volumes into neonates, small children or fluid-restricted patients. Use the prescribed/local enteral protocol and the smallest volume that safely clears the medicine and tube.',
          critical: true,
        ),
        const SizedBox(height: 14),
        const _WorkflowStep(
          number: '1',
          title: 'Confirm the tube',
          text:
              'Identify gastric versus duodenal/jejunal tip location, tube bore and material. Site of delivery can change absorption and suitability.',
        ),
        const _WorkflowStep(
          number: '2',
          title: 'Verify the exact medicine formulation',
          text:
              'Check release mechanism, coating, whether a liquid is actually suitable, hazardous handling, and whether the product has a validated tube method.',
        ),
        const _WorkflowStep(
          number: '3',
          title: 'Stop feed only when required',
          text:
              'Do not routinely hold nutrition for every medicine. Hold/separate the feed when a documented medicine-feed interaction or food requirement exists.',
        ),
        const _WorkflowStep(
          number: '4',
          title: 'Pre-flush',
          text:
              'Adult/general SPS reference: flush with at least 30 mL water before administration. Reduce/individualize for pediatric or fluid-restricted patients.',
        ),
        const _WorkflowStep(
          number: '5',
          title: 'Prepare and give one medicine at a time',
          text:
              'Never mix multiple medicines together unless a validated protocol specifically allows it. Rinse the crusher/container and give the rinse so the full dose is delivered.',
        ),
        const _WorkflowStep(
          number: '6',
          title: 'Flush between medicines',
          text:
              'Adult/general SPS reference: at least 10 mL water between medicines. Individualize in children, neonates and fluid restriction.',
        ),
        const _WorkflowStep(
          number: '7',
          title: 'Final flush and restart feed',
          text:
              'Adult/general SPS reference: at least 30 mL after the last medicine. Continue the feeding break only for the medicine-specific interval, then restart.',
          isLast: true,
        ),
        const SizedBox(height: 14),
        const _SourceCard(
          text:
              'Source: NHS Specialist Pharmacy Service, Administering a medicine through an enteral feeding tube; last updated 9 Feb 2026.',
        ),
      ],
    );
  }
}

class _FeedInteractionsTab extends StatefulWidget {
  const _FeedInteractionsTab();

  @override
  State<_FeedInteractionsTab> createState() => _FeedInteractionsTabState();
}

class _FeedInteractionsTabState extends State<_FeedInteractionsTab> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final q = _query.trim().toLowerCase();
    final records = tubeFeedInteractions.where((record) {
      if (q.isEmpty) return true;
      return record.medicine.toLowerCase().contains(q) ||
          record.issue.toLowerCase().contains(q);
    }).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        Text(
          'Medicine–feed interactions',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'These are high-yield documented examples, not an exhaustive list. A medicine absent from this list is not automatically compatible with continuous feeding.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          onChanged: (value) => setState(() => _query = value),
          decoration: const InputDecoration(
            hintText: 'Search medicine or interaction',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 14),
        for (final record in records) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.medicine,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _FactLine(label: 'Problem', text: record.issue),
                  _FactLine(
                    label: 'Feed plan',
                    text: record.feedInstruction,
                    critical: true,
                  ),
                  _FactLine(label: 'Monitoring', text: record.monitoring),
                  const SizedBox(height: 6),
                  Text(
                    record.source,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 9),
        ],
        if (records.isEmpty)
          const _SafetyBanner(
            title: 'No verified record in this quick list',
            text:
                'Do not infer that the medicine is safe with feeds. Check the exact formulation in a current enteral-tube reference / manufacturer information and local protocol.',
            critical: true,
          ),
      ],
    );
  }
}

class _FormulationTab extends StatefulWidget {
  const _FormulationTab();

  @override
  State<_FormulationTab> createState() => _FormulationTabState();
}

class _FormulationTabState extends State<_FormulationTab> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final q = _query.trim().toLowerCase();
    final records = tubeMedicationRecords.where((record) {
      if (q.isEmpty) return true;
      return record.medicine.toLowerCase().contains(q) ||
          record.formulation.toLowerCase().contains(q) ||
          record.status.toLowerCase().contains(q) ||
          record.tubeRoute.toLowerCase().contains(q);
    }).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        Text(
          'Drug-by-drug tube administration',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          'Start with the exact dosage form, product instructions, tube destination and bore. An “openable” capsule is not automatically tube-compatible, and different formulations of the same drug may have opposite instructions.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 12),
        const _SafetyBanner(
          title: 'Source-locked records only',
          text:
              'The records below are included only when the exact label or current enteral guidance supports the stated method or restriction. If your exact formulation is different, stop and re-check it.',
          critical: true,
        ),
        const SizedBox(height: 14),
        TextField(
          onChanged: (value) => setState(() => _query = value),
          decoration: const InputDecoration(
            hintText: 'Search drug, formulation, NG, tube size...',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 14),
        for (final record in records) ...[
          _TubeMedicationCard(record: record),
          const SizedBox(height: 10),
        ],
        if (records.isEmpty)
          const _SafetyBanner(
            title: 'No verified drug-specific record',
            text:
                'Do not infer that the medicine can be crushed or pushed through the tube. Check the exact product label, tube destination, and a current enteral-medicines reference.',
            critical: true,
          ),
        const SizedBox(height: 24),
        Text(
          'General formulation safety rules',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        for (final rule in tubeSafetyRules) ...[
          _RuleCard(rule: rule),
          const SizedBox(height: 9),
        ],
        const _SourceCard(
          text:
              'General source set: NHS SPS Choosing medicines for enteral tube administration and Administering a medicine through an enteral feeding tube, updated through 2026. Drug-specific records use current DailyMed/FDA labeling where available.',
        ),
      ],
    );
  }
}

class _SpecialSituationsTab extends StatelessWidget {
  const _SpecialSituationsTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        Text(
          'NICU / small-volume administration',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10),
        const _SafetyBanner(
          title: 'Do not scale adult flush rules down by guesswork',
          text:
              'For neonates and small infants, use the NICU-prescribed/local flush volume and account for total daily fluid. Dose loss in syringe/tube dead space can also become clinically important at very small volumes.',
          critical: true,
        ),
        const SizedBox(height: 10),
        const _SafetyBanner(
          title: 'Small-volume preparation',
          text:
              'Prefer an age-appropriate licensed liquid or a validated pharmacy preparation when available. If a tablet/capsule must be manipulated, verify the exact product, concentration after preparation, dose-recovery method, stability and whether the tube material/site changes delivery.',
        ),
        const SizedBox(height: 10),
        const _SafetyBanner(
          title: 'Do not mix medicines together',
          text:
              'Prepare each medicine separately. In NICU, use a documented sequence and individualized between-drug flush volume rather than combining medicines to “save fluid”.',
        ),
        const SizedBox(height: 22),
        Text(
          'Oral / enteral use of injectable products',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'An injectable formulation is not automatically safe to drink or give through a tube. Most such use is off-label and must be verified for the exact product.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.45),
        ),
        const SizedBox(height: 12),
        for (final rule in injectableEnteralSafetyRules) ...[
          _RuleCard(rule: rule),
          const SizedBox(height: 9),
        ],
        const SizedBox(height: 6),
        const _SafetyBanner(
          title: 'Examples are risk examples—not approvals',
          text:
              'SPS notes that diazepam can adsorb to PVC tubing, acetylcysteine injection has important taste issues when taken orally, and mexiletine can numb the tongue. These examples demonstrate why product assessment is required; they are not a general “drinkable ampoule” list.',
          critical: true,
        ),
        const SizedBox(height: 12),
        const _SourceCard(
          text:
              'Source: NHS SPS Assessing injectables for enteral administration; updated 2 Jan 2026.',
        ),
      ],
    );
  }
}

class _TubeMedicationCard extends StatelessWidget {
  const _TubeMedicationCard({required this.record});

  final TubeMedicationRecord record;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = record.critical
        ? theme.colorScheme.errorContainer.withValues(alpha: 0.38)
        : theme.colorScheme.surfaceContainerLow;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            record.medicine,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            record.status,
            style: theme.textTheme.labelLarge?.copyWith(
              color: record.critical
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          _FactLine(label: 'Exact formulation', text: record.formulation),
          _FactLine(
            label: 'Tube / destination',
            text: record.tubeRoute,
            critical: record.critical,
          ),
          _FactLine(
            label: 'Preparation',
            text: record.preparation,
            critical: true,
          ),
          _FactLine(label: 'Feed plan', text: record.feedPlan),
          _FactLine(
            label: 'Do NOT',
            text: record.doNot,
            critical: true,
          ),
          _FactLine(label: 'Monitoring', text: record.monitoring),
          _FactLine(label: 'Pediatrics / NICU', text: record.pediatricNicu),
          const SizedBox(height: 8),
          Text(
            'الخلاصة العملية',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            record.practicalAr,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            record.source,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkflowStep extends StatelessWidget {
  const _WorkflowStep({
    required this.number,
    required this.title,
    required this.text,
    this.isLast = false,
  });

  final String number;
  final String title;
  final String text;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 42,
            child: Column(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    number,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: theme.colorScheme.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RuleCard extends StatelessWidget {
  const _RuleCard({required this.rule});

  final TubeSafetyRule rule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = rule.critical
        ? theme.colorScheme.errorContainer.withValues(alpha: 0.55)
        : theme.colorScheme.surfaceContainerLow;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                rule.critical
                    ? Icons.warning_amber_rounded
                    : Icons.fact_check_outlined,
                size: 21,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  rule.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _FactLine(label: 'Action', text: rule.action, critical: rule.critical),
          _FactLine(label: 'Why', text: rule.why),
          const SizedBox(height: 5),
          Text(
            rule.source,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _FactLine extends StatelessWidget {
  const _FactLine({
    required this.label,
    required this.text,
    this.critical = false,
  });

  final String label;
  final String text;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: RichText(
        text: TextSpan(
          style: theme.textTheme.bodyMedium?.copyWith(
            height: 1.42,
            color: theme.colorScheme.onSurface,
          ),
          children: [
            TextSpan(
              text: label + ': ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: critical ? theme.colorScheme.error : null,
              ),
            ),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }
}

class _SafetyBanner extends StatelessWidget {
  const _SafetyBanner({
    required this.title,
    required this.text,
    this.critical = false,
  });

  final String title;
  final String text;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: critical
            ? theme.colorScheme.errorContainer
            : theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            critical ? Icons.warning_amber_rounded : Icons.info_outline_rounded,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SourceCard extends StatelessWidget {
  const _SourceCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          height: 1.4,
        ),
      ),
    );
  }
}
