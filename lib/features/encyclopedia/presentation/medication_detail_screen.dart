import 'package:flutter/material.dart';

import '../../../core/data/medication_clinical_overlays.dart';
import '../../../core/data/medication_indication_options.dart';
import '../../../core/data/medication_patient_guidance.dart';
import '../../../core/data/medication_patient_guidance_en.dart';
import '../../../core/data/therapy_duration_catalog.dart';
import '../../../core/models/medication.dart';
import '../../../shared/widgets/section_card.dart';
import '../../calculators/presentation/calculators_screen.dart';
import '../../iv_prep/data/iv_preparation_profiles.dart';
import '../../iv_prep/presentation/iv_preparation_detail_screen.dart';
import '../../medication_plan/domain/medication_timing_rules.dart';
import '../../patient_cards/domain/patient_card_data.dart';
import '../../patient_cards/presentation/patient_card_preview.dart';
import '../../patient_cards/presentation/printable_patient_card_screen.dart';
import '../../visual_guides/data/visual_guide_catalog.dart';
import '../../visual_guides/presentation/visual_guide_detail_screen.dart';

class MedicationDetailScreen extends StatefulWidget {
  const MedicationDetailScreen({
    super.key,
    required this.medication,
  });

  final Medication medication;

  @override
  State<MedicationDetailScreen> createState() => _MedicationDetailScreenState();
}

class _MedicationDetailScreenState extends State<MedicationDetailScreen> {
  String? _selectedIndicationId;

  Medication get medication => widget.medication;

  MedicationIndicationOption? get _selectedIndication =>
      indicationOptionFor(medication.id, _selectedIndicationId);

  PatientCounselingData get _resolvedArabicPatient {
    final base = resolvedPatientCounseling(
      medication,
      timingFallbackAr: medicationPatientTimingInstruction(medication.id),
    );
    return applyIndicationToArabic(base, _selectedIndication);
  }

  PatientCardData get _patientCard {
    final durationAr = _selectedIndication?.durationAr.trim().isNotEmpty == true
        ? _selectedIndication!.durationAr.trim()
        : (therapyDurationFor(medication.id)?.patientAr ?? '');
    final patient = _resolvedArabicPatient;
    final important = <String>[
      if (durationAr.isNotEmpty) 'مدة العلاج: ' + durationAr,
      if (patient.importantAr.trim().isNotEmpty) patient.importantAr.trim(),
      if (patient.commonActionableAr.trim().isNotEmpty)
        patient.commonActionableAr.trim(),
      if (patient.storageAr.trim().isNotEmpty)
        'الحفظ: ' + patient.storageAr.trim(),
    ].join(' ');

    final indicationLabel = _selectedIndication?.labelAr ?? '';
    return PatientCardData(
      id: 'card-' + medication.id,
      templateName: 'Medication Counseling Card',
      medicationName: medication.name,
      subtitleAr: indicationLabel.isEmpty
          ? 'تعليمات مختصرة للمريض'
          : 'تعليمات المريض · ' + indicationLabel,
      category: 'Medication',
      purposeAr: patient.purposeAr,
      howToUseAr: patient.howToUseAr,
      timingAr: patient.timingAr,
      importantAr: important,
      missedDoseAr: patient.missedDoseAr,
      seekHelpAr: patient.seekHelpAr,
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
                  _PatientTab(
                    medication: medication,
                    selectedIndicationId: _selectedIndicationId,
                    onIndicationChanged: (value) {
                      setState(() => _selectedIndicationId = value);
                    },
                  ),
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
    final useProfile = resolvedMedicationUseProfile(medication);
    final sourceLabel = resolvedMedicationSourceLabel(medication);
    final reviewStatus = resolvedMedicationReviewStatus(medication);
    final lastReviewed = resolvedMedicationLastReviewed(medication);
    final visualGuides = visualGuidesForMedication(medication.id);
    final ivProfiles = ivPreparationProfiles
        .where((profile) => profile.name == medication.name)
        .toList(growable: false);
    final hasLinkedTools = visualGuides.isNotEmpty ||
        ivProfiles.isNotEmpty ||
        medication.hasCalculator;

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
        if (!useProfile.isEmpty) ...[
          SectionCard(
            title: 'Medication-use essentials',
            icon: Icons.fact_check_outlined,
            child: Column(
              children: [
                for (final fact in useProfile.facts) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      fact.title,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      fact.value,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
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
        if (sourceLabel.isNotEmpty) ...[
          SectionCard(
            title: 'Source & review',
            icon: Icons.verified_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sourceLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                ),
                const SizedBox(height: 7),
                Text(
                  reviewStatus + ' · ' + lastReviewed,
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
        if (hasLinkedTools)
          SectionCard(
            title: 'Linked clinical tools',
            icon: Icons.link_rounded,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final guide in visualGuides)
                  ActionChip(
                    avatar: Icon(guide.icon, size: 18),
                    label: Text(guide.title),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => VisualGuideDetailScreen(
                            title: guide.title,
                            subtitle: guide.subtitle,
                            steps: guide.steps,
                            mistakes: guide.mistakes,
                            patientSummaryAr: guide.patientSummaryAr,
                            icon: guide.icon,
                          ),
                        ),
                      );
                    },
                  ),
                for (final profile in ivProfiles)
                  ActionChip(
                    avatar: const Icon(Icons.vaccines_outlined, size: 18),
                    label: Text('IV preparation · ' + profile.population),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              IvPreparationDetailScreen(profile: profile),
                        ),
                      );
                    },
                  ),
                if (medication.hasCalculator)
                  ActionChip(
                    avatar: const Icon(Icons.calculate_outlined, size: 18),
                    label: const Text('Calculator'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CalculatorsScreen(),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _PatientTab extends StatefulWidget {
  const _PatientTab({
    required this.medication,
    required this.selectedIndicationId,
    required this.onIndicationChanged,
  });

  final Medication medication;
  final String? selectedIndicationId;
  final ValueChanged<String?> onIndicationChanged;

  @override
  State<_PatientTab> createState() => _PatientTabState();
}

class _PatientTabState extends State<_PatientTab> {
  bool _english = false;

  @override
  Widget build(BuildContext context) {
    final medication = widget.medication;
    final englishBase = englishPatientCounselingFor(medication.id);
    final hasEnglish = englishBase != null;
    final option =
        indicationOptionFor(medication.id, widget.selectedIndicationId);
    final english =
        englishBase == null ? null : applyIndicationToEnglish(englishBase, option);
    final useEnglish = hasEnglish && _english;

    return Directionality(
      textDirection: useEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: useEnglish
          ? _buildEnglish(context, english!)
          : _buildArabic(context, hasEnglish: hasEnglish),
    );
  }

  Widget _languageToggle(BuildContext context, {required bool english}) {
    return Align(
      alignment: english ? Alignment.centerLeft : Alignment.centerRight,
      child: SegmentedButton<bool>(
        segments: const [
          ButtonSegment<bool>(
            value: false,
            label: Text('العربية'),
            icon: Icon(Icons.translate_rounded),
          ),
          ButtonSegment<bool>(
            value: true,
            label: Text('English'),
            icon: Icon(Icons.language_rounded),
          ),
        ],
        selected: <bool>{_english},
        onSelectionChanged: (selection) {
          setState(() => _english = selection.first);
        },
      ),
    );
  }

  Widget _buildArabic(
    BuildContext context, {
    required bool hasEnglish,
  }) {
    final theme = Theme.of(context);
    final medication = widget.medication;
    final option =
        indicationOptionFor(medication.id, widget.selectedIndicationId);
    final durationAr = option?.durationAr.trim().isNotEmpty == true
        ? option!.durationAr.trim()
        : (therapyDurationFor(medication.id)?.patientAr ?? '');
    final basePatient = resolvedPatientCounseling(
      medication,
      timingFallbackAr: medicationPatientTimingInstruction(medication.id),
    );
    final patient = applyIndicationToArabic(basePatient, option);
    final visualGuides = visualGuidesForMedication(medication.id);
    final indicationOptions = indicationOptionsFor(medication.id);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        if (hasEnglish) ...[
          _languageToggle(context, english: false),
          const SizedBox(height: 12),
        ],
        if (indicationOptions.isNotEmpty) ...[
          _indicationSelector(
            context,
            options: indicationOptions,
            english: false,
          ),
          const SizedBox(height: 12),
        ],
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
        if (visualGuides.isNotEmpty) ...[
          _patientVisualGuideCard(
            context,
            title: 'دليل الاستخدام العملي',
            alignment: WrapAlignment.end,
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 10),
        ],
        if (durationAr.isNotEmpty) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'مدة العلاج',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    durationAr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
        for (final item in patient.items) ...[
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
        if (patient.teachBackAr.isNotEmpty)
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
                  patient.teachBackAr,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildEnglish(
    BuildContext context,
    EnglishPatientCounseling patient,
  ) {
    final theme = Theme.of(context);
    final visualGuides = visualGuidesForMedication(widget.medication.id);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        _languageToggle(context, english: true),
        const SizedBox(height: 12),
        if (indicationOptionsFor(widget.medication.id).isNotEmpty) ...[
          _indicationSelector(
            context,
            options: indicationOptionsFor(widget.medication.id),
            english: true,
          ),
          const SizedBox(height: 12),
        ],
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.record_voice_over_outlined),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Patient-focused counseling only: simple, actionable instructions without unnecessary clinical detail.',
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.55),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        if (visualGuides.isNotEmpty) ...[
          _patientVisualGuideCard(
            context,
            title: 'Practical technique guide',
            alignment: WrapAlignment.start,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
        ],
        for (final item in patient.items) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    item.body,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.65),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
        if (patient.teachBack.trim().isNotEmpty)
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
                  'Teach-back',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  patient.teachBack,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.55),
                ),
              ],
            ),
          ),
        const SizedBox(height: 12),
        Text(
          'English counseling is shown only for medication records that have been individually reviewed. The app does not auto-translate clinical instructions.',
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _indicationSelector(
    BuildContext context, {
    required List<MedicationIndicationOption> options,
    required bool english,
  }) {
    final theme = Theme.of(context);
    final selected = indicationOptionFor(
      widget.medication.id,
      widget.selectedIndicationId,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              english ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
          children: [
            Text(
              english ? 'Select the reason for use' : 'حدد سبب استخدام الدواء',
              textAlign: english ? TextAlign.left : TextAlign.right,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              english
                  ? 'The patient explanation and printable card will change to match the selected indication.'
                  : 'سيتغير شرح المريض وبطاقة الطباعة حسب الاستطباب الذي تختاره.',
              textAlign: english ? TextAlign.left : TextAlign.right,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String?>(
              initialValue: widget.selectedIndicationId,
              decoration: InputDecoration(
                labelText: english ? 'Indication' : 'الاستطباب',
              ),
              items: [
                DropdownMenuItem<String?>(
                  value: null,
                  child: Text(
                    english ? 'General / not selected' : 'عام / غير محدد',
                  ),
                ),
                for (final option in options)
                  DropdownMenuItem<String?>(
                    value: option.id,
                    child: Text(
                      (english ? option.labelEn : option.labelAr) +
                          (option.offLabel
                              ? (english ? ' · off-label' : ' · خارج النشرة')
                              : ''),
                    ),
                  ),
              ],
              onChanged: widget.onIndicationChanged,
            ),
            if (selected != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: selected.offLabel
                      ? theme.colorScheme.tertiaryContainer
                      : theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  (selected.offLabel
                          ? (english
                              ? 'Off-label use — counsel using the documented guideline context. '
                              : 'استخدام خارج النشرة — يُشرح ضمن سياق الدليل السريري الموثق. ')
                          : '') +
                      (english ? selected.source : 'المصدر: ' + selected.source),
                  textAlign: english ? TextAlign.left : TextAlign.right,
                  style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _patientVisualGuideCard(
    BuildContext context, {
    required String title,
    required WrapAlignment alignment,
    required TextAlign textAlign,
  }) {
    final theme = Theme.of(context);
    final visualGuides = visualGuidesForMedication(widget.medication.id);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: textAlign,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: alignment,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final guide in visualGuides)
                  ActionChip(
                    avatar: Icon(guide.icon, size: 18),
                    label: Text(guide.title),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => VisualGuideDetailScreen(
                            title: guide.title,
                            subtitle: guide.subtitle,
                            steps: guide.steps,
                            mistakes: guide.mistakes,
                            patientSummaryAr: guide.patientSummaryAr,
                            icon: guide.icon,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
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
