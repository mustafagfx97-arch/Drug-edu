import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';
import '../../patient_cards/domain/patient_card_data.dart';
import '../../patient_cards/presentation/patient_card_preview.dart';
import '../../patient_cards/presentation/printable_patient_card_screen.dart';
import '../domain/supplement_profile.dart';

class SupplementDetailScreen extends StatelessWidget {
  const SupplementDetailScreen({
    super.key,
    required this.profile,
  });

  final SupplementProfile profile;

  PatientCardData get _card {
    final importantParts = <String>[
      if (profile.patient.importantAr.trim().isNotEmpty)
        profile.patient.importantAr.trim(),
      if (profile.patient.commonActionableAr.trim().isNotEmpty)
        profile.patient.commonActionableAr.trim(),
    ];

    return PatientCardData(
      id: 'supplement-' + profile.id,
      templateName: 'Supplement Counseling Card',
      medicationName: profile.name,
      subtitleAr: 'طريقة الاستخدام المختصرة',
      category: 'Supplement',
      purposeAr: profile.patient.purposeAr,
      howToUseAr: profile.patient.howToUseAr,
      timingAr: profile.patient.timingAr,
      importantAr: importantParts.join(' '),
      missedDoseAr: profile.patient.missedDoseAr,
      seekHelpAr: profile.patient.seekHelpAr,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(profile.name),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.local_pharmacy_outlined),
                text: 'Pharmacist',
              ),
              Tab(
                icon: Icon(Icons.record_voice_over_outlined),
                text: 'Patient',
              ),
              Tab(
                icon: Icon(Icons.print_outlined),
                text: 'Print Card',
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                border: Border(
                  bottom: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.subtitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile.formulation,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _PharmacistSupplementTab(profile: profile),
                  _PatientSupplementTab(profile: profile),
                  _SupplementPrintTab(card: _card),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PharmacistSupplementTab extends StatelessWidget {
  const _PharmacistSupplementTab({required this.profile});

  final SupplementProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.restaurant_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    'How to take it',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                profile.howToTakeEn,
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Use basis',
          icon: Icons.assignment_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.useBasis,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                ),
              ),
              if (profile.monitoringEn.isNotEmpty) ...[
                const SizedBox(height: 7),
                Text(
                  profile.monitoringEn,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                ),
              ],
            ],
          ),
        ),
        if (profile.formulationAlert.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.difference_outlined),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    profile.formulationAlert,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 14),
        for (final section in profile.pharmacistSections) ...[
          SectionCard(
            title: section.title,
            child: Text(
              section.body,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ),
          const SizedBox(height: 12),
        ],
        SectionCard(
          title: 'Source',
          icon: Icons.verified_outlined,
          child: Text(
            profile.sourceLabel,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _PatientSupplementTab extends StatelessWidget {
  const _PatientSupplementTab({required this.profile});

  final SupplementProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'كيف آخذه؟',
                  textAlign: TextAlign.right,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  profile.patient.howToUseAr,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.75),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          for (final item in profile.patient.items) ...[
            if (item.titleAr != 'كيف أستخدمه؟') ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        item.titleAr,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        item.bodyAr,
                        textAlign: TextAlign.right,
                        style:
                            theme.textTheme.bodyLarge?.copyWith(height: 1.7),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ],
          if (profile.patient.teachBackAr.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'تأكد من الفهم',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    profile.patient.teachBackAr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SupplementPrintTab extends StatelessWidget {
  const _SupplementPrintTab({required this.card});

  final PatientCardData card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        Text(
          'Focused supplement card',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'A short take-home version with the exact administration points worth remembering.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 14),
        PatientCardPreview(card: card),
        const SizedBox(height: 14),
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PrintablePatientCardScreen(card: card),
              ),
            );
          },
          icon: const Icon(Icons.print_outlined),
          label: const Text('Open Print / PDF'),
        ),
      ],
    );
  }
}
