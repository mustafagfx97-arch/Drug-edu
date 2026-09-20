import 'package:flutter/material.dart';

import '../../../core/models/medication.dart';
import '../../../shared/widgets/section_card.dart';
import '../../patient_cards/domain/patient_card_data.dart';
import '../../patient_cards/presentation/patient_card_editor_screen.dart';

class MedicationDetailScreen extends StatelessWidget {
  const MedicationDetailScreen({
    super.key,
    required this.medication,
  });

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

  void _createPatientCard(BuildContext context) {
    final card = PatientCardData(
      id: 'medication-card',
      templateName: 'Medication Counseling Card',
      medicationName: medication.name,
      subtitleAr: 'تعليمات مختصرة',
      howToUseAr: medication.patientCounselingAr,
      category: 'Medication',
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PatientCardEditorScreen(initialCard: card),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(medication.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            medication.subtitle,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: medication.tags
                .map((tag) => Chip(label: Text(tag)))
                .toList(),
          ),
          if (medication.isDemo) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.science_outlined),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Demo record: interface structure only. Production clinical content must pass source verification before release.',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 18),
          for (final section in medication.sections) ...[
            SectionCard(
              title: section.title,
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.record_voice_over_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'شرح المريض',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      medication.patientCounselingAr,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: () => _createPatientCard(context),
            icon: const Icon(Icons.qr_code_2_rounded),
            label: const Text('Create Patient Card'),
          ),
          if (medication.hasIvPreparation || medication.hasCalculator) ...[
            const SizedBox(height: 12),
            SectionCard(
              title: 'Linked tools',
              icon: Icons.link_rounded,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (medication.hasIvPreparation)
                    const Chip(
                      avatar: Icon(Icons.vaccines_outlined, size: 18),
                      label: Text('IV preparation profile'),
                    ),
                  if (medication.hasCalculator)
                    const Chip(
                      avatar: Icon(Icons.calculate_outlined, size: 18),
                      label: Text('Calculator available'),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
