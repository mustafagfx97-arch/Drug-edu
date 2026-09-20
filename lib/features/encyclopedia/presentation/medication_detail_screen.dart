import 'package:flutter/material.dart';

import '../../../core/models/medication.dart';
import '../../../shared/widgets/section_card.dart';
import '../../patient_cards/domain/patient_card_data.dart';
import '../../patient_cards/presentation/patient_card_preview.dart';
import '../../patient_cards/presentation/printable_patient_card_screen.dart';

class MedicationDetailScreen extends StatelessWidget {
  const MedicationDetailScreen({
    super.key,
    required this.medication,
  });

  final Medication medication;

  PatientCardData get _patientCard {
    final important = <String>[
      if (medication.patient.importantAr.trim().isNotEmpty)
        medication.patient.importantAr.trim(),
      if (medication.patient.commonActionableAr.trim().isNotEmpty)
        medication.patient.commonActionableAr.trim(),
      if (medication.patient.storageAr.trim().isNotEmpty)
        'الحفظ: ' + medication.patient.storageAr.trim(),
    ].join(' ');

    return PatientCardData(
      id: 'card-' + medication.id,
      templateName: 'Medication Counseling Card',
      medicationName: medication.name,
      subtitleAr: 'تعليمات مختصرة للمريض',
      category: 'Medication',
      purposeAr: medication.patient.purposeAr,
      howToUseAr: medication.patient.howToUseAr,
      timingAr: medication.patient.timingAr,
      importantAr: important,
      missedDoseAr: medication.patient.missedDoseAr,
      seekHelpAr: medication.patient.seekHelpAr,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(medication.name),
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
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
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
                    medication.subtitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: medication.tags
                        .map((tag) => Chip(label: Text(tag)))
                        .toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _PharmacistTab(medication: medication),
                  _PatientTab(medication: medication),
                  _PrintCardTab(card: _patientCard),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PharmacistTab extends StatelessWidget {
  const _PharmacistTab({required this.medication});

  final Medication medication;

  Color _priorityColor(BuildContext context, ClinicalPriority priority) {
    final scheme = Theme.of(context).colorScheme;
    return switch (priority) {
      ClinicalPriority.critical => scheme.error,
      ClinicalPriority.important => scheme.primary,
      ClinicalPriority.patientSpecific => scheme.tertiary,
      ClinicalPriority.reference => scheme.outline,
    };
  }

  String _priorityLabel(ClinicalPriority priority) {
    return switch (priority) {
      ClinicalPriority.critical => 'Critical',
      ClinicalPriority.important => 'Important',
      ClinicalPriority.patientSpecific => 'Patient-specific',
      ClinicalPriority.reference => 'Reference',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.local_pharmacy_outlined),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Professional view: practical counseling, administration, monitoring, formulation details, clinical pearls and safety points.',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        for (final section in medication.sections) ...[
          SectionCard(
            title: section.title,
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: _priorityColor(context, section.priority)
                    .withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                _priorityLabel(section.priority),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: _priorityColor(context, section.priority),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            child: Text(
              section.body,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (medication.sourceLabel.isNotEmpty) ...[
          SectionCard(
            title: 'Source & review',
            icon: Icons.verified_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.sourceLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                ),
                const SizedBox(height: 7),
                Text(
                  medication.reviewStatus + ' · ' + medication.lastReviewed,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (medication.hasVisualGuide ||
            medication.hasIvPreparation ||
            medication.hasCalculator)
          SectionCard(
            title: 'Linked clinical tools',
            icon: Icons.link_rounded,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (medication.hasVisualGuide)
                  const Chip(label: Text('Visual technique guide')),
                if (medication.hasIvPreparation)
                  const Chip(label: Text('IV preparation')),
                if (medication.hasCalculator)
                  const Chip(label: Text('Calculator')),
              ],
            ),
          ),
      ],
    );
  }
}

class _PatientTab extends StatelessWidget {
  const _PatientTab({required this.medication});

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.record_voice_over_outlined),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'هذا هو الشرح المخصص للمريض فقط: بسيط، مباشر، ومن دون تفاصيل صيدلانية لا يحتاجها.',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          for (final item in medication.patient.items) ...[
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
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
          if (medication.patient.teachBackAr.isNotEmpty)
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
                    medication.patient.teachBackAr,
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

class _PrintCardTab extends StatelessWidget {
  const _PrintCardTab({required this.card});

  final PatientCardData card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        Text(
          'Focused take-home card',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Shorter than the full patient counseling. It keeps only the actions and warnings worth carrying home.',
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
