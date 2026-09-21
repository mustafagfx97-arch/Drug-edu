import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';
import '../data/nebulizer_preparation_profiles.dart';
import '../domain/nebulizer_preparation_profile.dart';

class NebulizerPrepScreen extends StatefulWidget {
  const NebulizerPrepScreen({super.key});

  @override
  State<NebulizerPrepScreen> createState() => _NebulizerPrepScreenState();
}

class _NebulizerPrepScreenState extends State<NebulizerPrepScreen> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = _search.text.trim().toLowerCase();
    final items = nebulizerPreparationProfiles.where((profile) {
      if (q.isEmpty) return true;
      return profile.name.toLowerCase().contains(q) ||
          profile.formulation.toLowerCase().contains(q) ||
          profile.practicalAr.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Nebulizer Preparation')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          const SectionCard(
            title: 'Preparation rule',
            icon: Icons.warning_amber_rounded,
            child: Text(
              'Identify the exact concentration first. Ready-to-use unit-dose vials are not diluted by habit. Concentrates are diluted only with the sterile diluent stated in the product label. Distilled drinking water is NOT a substitute for sterile inhalation/injection diluent.',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _search,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search albuterol, budesonide, acetylcysteine…',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${items.length} source-locked formulations',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 10),
          for (final profile in items) ...[
            Card(
              child: ListTile(
                title: Text(
                  profile.name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('${profile.formulation}\n${profile.status}'),
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => NebulizerPrepDetailScreen(profile: profile),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class NebulizerPrepDetailScreen extends StatelessWidget {
  const NebulizerPrepDetailScreen({
    super.key,
    required this.profile,
  });

  final NebulizerPreparationProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(profile.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 32),
        children: [
          SectionCard(
            title: 'Exact formulation',
            icon: Icons.medication_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile.formulation),
                const SizedBox(height: 8),
                Text(
                  profile.status,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Device: ${profile.device}'),
              ],
            ),
          ),
          if (profile.doses.isNotEmpty) ...[
            const SizedBox(height: 12),
            SectionCard(
              title: 'What exactly do I draw / add?',
              icon: Icons.straighten_outlined,
              child: Column(
                children: [
                  for (final dose in profile.doses) ...[
                    _DoseCard(dose: dose),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),
          _StepSection(
            title: 'Preparation',
            icon: Icons.science_outlined,
            steps: profile.preparation,
          ),
          const SizedBox(height: 12),
          _StepSection(
            title: 'How to nebulize',
            icon: Icons.air_rounded,
            steps: profile.administration,
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'Mixing / compatibility',
            icon: Icons.compare_arrows_rounded,
            child: Text(profile.mixing),
          ),
          const SizedBox(height: 12),
          _StepSection(
            title: 'Do NOT',
            icon: Icons.block_outlined,
            steps: profile.doNot,
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'Cleaning',
            icon: Icons.cleaning_services_outlined,
            child: Text(profile.cleaning),
          ),
          const SizedBox(height: 12),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SectionCard(
              title: 'الشرح العملي السريع',
              icon: Icons.record_voice_over_outlined,
              child: Text(
                profile.practicalAr,
                textAlign: TextAlign.right,
                style: const TextStyle(height: 1.55),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'Source',
            icon: Icons.fact_check_outlined,
            child: Text(profile.source),
          ),
        ],
      ),
    );
  }
}

class _DoseCard extends StatelessWidget {
  const _DoseCard({required this.dose});

  final NebulizerDosePreparation dose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dose.label,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          _Fact(label: 'Prescribed dose', value: dose.prescribedDose),
          _Fact(label: 'Source strength', value: dose.sourceStrength),
          _Fact(label: 'Draw / use', value: dose.drawVolume),
          _Fact(label: 'Add', value: dose.diluent),
          _Fact(label: 'Final nebulizer volume', value: dose.finalVolume),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class _StepSection extends StatelessWidget {
  const _StepSection({
    required this.title,
    required this.icon,
    required this.steps,
  });

  final String title;
  final IconData icon;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: title,
      icon: icon,
      child: Column(
        children: [
          for (var i = 0; i < steps.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    child: Text(
                      '${i + 1}.',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      steps[i],
                      style: const TextStyle(height: 1.4),
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
