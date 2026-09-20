import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/data/sample_medications.dart';
import '../../supplements/data/supplement_profiles.dart';
import '../domain/medication_plan_engine.dart';
import '../domain/medication_plan_models.dart';

class MedicationPlanScreen extends StatefulWidget {
  const MedicationPlanScreen({super.key});

  @override
  State<MedicationPlanScreen> createState() => _MedicationPlanScreenState();
}

class _MedicationPlanScreenState extends State<MedicationPlanScreen> {
  final _engine = const MedicationPlanEngine();
  final _printKey = GlobalKey();

  final List<MedicationPlanItem> _items = [];
  PatientRoutine _routine = const PatientRoutine();
  bool _printing = false;

  GeneratedMedicationPlan get _plan =>
      _engine.generate(items: _items, routine: _routine);

  List<_PatientPlanInstruction> get _patientInstructions {
    final result = <_PatientPlanInstruction>[];

    for (final item in _items) {
      if (item.type == PlanItemType.medicine) {
        for (final medicine in sampleMedications) {
          if (medicine.id != item.sourceId) continue;
          result.add(
            _PatientPlanInstruction(
              name: medicine.name,
              doseText: item.doseText,
              howToUseAr: medicine.patient.howToUseAr,
              timingAr: medicine.patient.timingAr,
              importantAr: medicine.patient.importantAr,
              missedDoseAr: medicine.patient.missedDoseAr,
            ),
          );
          break;
        }
      } else {
        for (final supplement in supplementProfiles) {
          if (supplement.id != item.sourceId) continue;
          result.add(
            _PatientPlanInstruction(
              name: supplement.name,
              doseText: item.doseText,
              howToUseAr: supplement.patient.howToUseAr,
              timingAr: supplement.patient.timingAr,
              importantAr: supplement.patient.importantAr,
              missedDoseAr: supplement.patient.missedDoseAr,
            ),
          );
          break;
        }
      }
    }

    return result;
  }

  List<_PlanCatalogOption> get _catalog {
    final medicines = sampleMedications.map(
      (medicine) => _PlanCatalogOption(
        sourceId: medicine.id,
        name: medicine.name,
        subtitle: medicine.subtitle,
        type: PlanItemType.medicine,
        searchTerms: [...medicine.aliases, ...medicine.tags],
      ),
    );

    final supplements = supplementProfiles
        .where(
          (item) =>
              item.id != 'high-risk-weight-loss-supplements' &&
              item.id != 'growth-amino-acid-blends',
        )
        .map(
          (item) => _PlanCatalogOption(
            sourceId: item.id,
            name: item.name,
            subtitle: item.subtitle,
            type: PlanItemType.supplement,
            searchTerms: [item.group, item.formulation],
          ),
        );

    return [...medicines, ...supplements]
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Future<void> _addMedication() async {
    final selected = await showModalBottomSheet<_PlanCatalogOption>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _MedicationSearchSheet(options: _catalog),
    );

    if (!mounted || selected == null) return;

    final item = await showDialog<MedicationPlanItem>(
      context: context,
      builder: (_) => _MedicationConfigDialog(option: selected),
    );

    if (!mounted || item == null) return;

    setState(() => _items.add(item));
  }

  Future<void> _editRoutine() async {
    final routine = await showDialog<PatientRoutine>(
      context: context,
      builder: (_) => _RoutineDialog(initial: _routine),
    );

    if (!mounted || routine == null) return;
    setState(() => _routine = routine);
  }

  Future<void> _printPlan() async {
    if (_items.isEmpty) return;

    setState(() => _printing = true);
    try {
      final boundary =
          _printKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      if (bytes == null) return;

      final pdf = pw.Document();
      final cardImage = pw.MemoryImage(bytes.buffer.asUint8List());

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(20),
          build: (_) => pw.Center(
            child: pw.Image(cardImage, fit: pw.BoxFit.contain),
          ),
        ),
      );

      await Printing.layoutPdf(
        name: 'Patient medication plan',
        onLayout: (_) async => pdf.save(),
      );
    } finally {
      if (mounted) setState(() => _printing = false);
    }
  }

  String _formatMinutes(int minutes) {
    final hour = (minutes ~/ 60) % 24;
    final minute = minutes % 60;
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return h + ':' + m;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final plan = _plan;
    final instructions = _patientInstructions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Plan'),
        actions: [
          IconButton(
            tooltip: 'Routine',
            onPressed: _editRoutine,
            icon: const Icon(Icons.schedule_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addMedication,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add medicine'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
        children: [
          Text(
            'Multi-medication schedule',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Add all medicines and supplements once, enter the prescribed frequency, and the app organizes a practical daily schedule using verified administration rules.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.rule_rounded),
                const SizedBox(width: 11),
                Expanded(
                  child: Text(
                    'The app does not choose the therapeutic dose or frequency. You enter the prescribed regimen; it only organizes timing, food instructions and known separation rules.',
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _RoutineCard(
            routine: _routine,
            onEdit: _editRoutine,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Patient medicines',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                _items.length.toString(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_items.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Icon(Icons.medication_liquid_outlined, size: 40),
                    const SizedBox(height: 10),
                    Text(
                      'Add the patient’s medicines and supplements to build one combined schedule.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.45),
                    ),
                  ],
                ),
              ),
            )
          else
            for (final item in _items) ...[
              Card(
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Icon(
                    item.type == PlanItemType.medicine
                        ? Icons.medication_outlined
                        : Icons.eco_outlined,
                  ),
                  title: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    item.doseText +
                        ' · ' +
                        _frequencyLabel(item.frequency) +
                        ' · ' +
                        _preferenceLabel(item.preference),
                  ),
                  trailing: IconButton(
                    tooltip: 'Remove',
                    onPressed: () {
                      setState(() {
                        _items.removeWhere((entry) => entry.id == item.id);
                      });
                    },
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          if (_items.isNotEmpty) ...[
            const SizedBox(height: 18),
            RepaintBoundary(
              key: _printKey,
              child: Theme(
                data: ThemeData(
                  useMaterial3: true,
                  brightness: Brightness.light,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFF176B87),
                    brightness: Brightness.light,
                  ),
                ),
                child: Material(
                  color: Colors.white,
                  child: _PrintablePlan(
                    plan: plan,
                    instructions: instructions,
                    formatMinutes: _formatMinutes,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: _printing ? null : _printPlan,
              icon: _printing
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.print_outlined),
              label: Text(_printing ? 'Preparing…' : 'Print / Save PDF'),
            ),
          ],
        ],
      ),
    );
  }

  String _frequencyLabel(RegimenFrequency value) {
    switch (value) {
      case RegimenFrequency.onceDaily:
        return 'Once daily';
      case RegimenFrequency.twiceDaily:
        return 'Twice daily';
      case RegimenFrequency.threeTimesDaily:
        return '3 times daily';
      case RegimenFrequency.fourTimesDaily:
        return '4 times daily';
      case RegimenFrequency.every12Hours:
        return 'Every 12 hours';
      case RegimenFrequency.every8Hours:
        return 'Every 8 hours';
      case RegimenFrequency.every6Hours:
        return 'Every 6 hours';
      case RegimenFrequency.morning:
        return 'Morning';
      case RegimenFrequency.bedtime:
        return 'Bedtime';
      case RegimenFrequency.weekly:
        return 'Weekly';
      case RegimenFrequency.asNeeded:
        return 'As needed';
    }
  }

  String _preferenceLabel(TimingPreference value) {
    switch (value) {
      case TimingPreference.auto:
        return 'Auto timing';
      case TimingPreference.morning:
        return 'Morning';
      case TimingPreference.breakfast:
        return 'Breakfast';
      case TimingPreference.lunch:
        return 'Lunch';
      case TimingPreference.dinner:
        return 'Dinner';
      case TimingPreference.bedtime:
        return 'Bedtime';
      case TimingPreference.custom:
        return 'Custom time';
    }
  }
}

class _PrintablePlan extends StatelessWidget {
  const _PrintablePlan({
    required this.plan,
    required this.instructions,
    required this.formatMinutes,
  });

  final GeneratedMedicationPlan plan;
  final List<_PatientPlanInstruction> instructions;
  final String Function(int) formatMinutes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'جدول أدوية المريض',
              textAlign: TextAlign.right,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'الأوقات التالية تنظّم الوصفة ولا تغيّر الجرعة أو عدد المرات الموصوفة.',
              textAlign: TextAlign.right,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            if (plan.doses.isEmpty)
              const Text(
                'لا توجد جرعات ثابتة في الجدول.',
                textAlign: TextAlign.right,
              )
            else
              for (final dose in plan.doses) ...[
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          (dose.dayLabel.isEmpty
                                  ? ''
                                  : dose.dayLabel + '\n') +
                              formatMinutes(dose.minutes),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              dose.medicationName + ' · ' + dose.doseText,
                              textAlign: TextAlign.right,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if (dose.instructionAr.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                dose.instructionAr,
                                textAlign: TextAlign.right,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.45,
                                ),
                              ),
                            ],
                            if (dose.isSuggested) ...[
                              const SizedBox(height: 4),
                              Text(
                                'وقت تنظيمي مقترح',
                                textAlign: TextAlign.right,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            if (instructions.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                'طريقة استخدام كل دواء',
                textAlign: TextAlign.right,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              for (final instruction in instructions)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        instruction.name + ' · ' + instruction.doseText,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (instruction.howToUseAr.trim().isNotEmpty) ...[
                        const SizedBox(height: 5),
                        Text(
                          instruction.howToUseAr,
                          textAlign: TextAlign.right,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.45,
                          ),
                        ),
                      ],
                      if (instruction.timingAr.trim().isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          'التوقيت: ' + instruction.timingAr,
                          textAlign: TextAlign.right,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.45,
                          ),
                        ),
                      ],
                      if (instruction.importantAr.trim().isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          'مهم: ' + instruction.importantAr,
                          textAlign: TextAlign.right,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.45,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                      if (instruction.missedDoseAr.trim().isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          'إذا نسيت الجرعة: ' + instruction.missedDoseAr,
                          textAlign: TextAlign.right,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.45,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
            if (plan.alerts.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'تنبيهات مهمة',
                textAlign: TextAlign.right,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              for (final alert in plan.alerts)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: alert.isCritical
                        ? theme.colorScheme.errorContainer
                        : theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        alert.title,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        alert.message,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _RoutineCard extends StatelessWidget {
  const _RoutineCard({
    required this.routine,
    required this.onEdit,
  });

  final PatientRoutine routine;
  final VoidCallback onEdit;

  String _format(int minutes) {
    final h = ((minutes ~/ 60) % 24).toString().padLeft(2, '0');
    final m = (minutes % 60).toString().padLeft(2, '0');
    return h + ':' + m;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Patient daily routine',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _RoutineChip('Wake', _format(routine.wakeMinutes)),
                _RoutineChip('Breakfast', _format(routine.breakfastMinutes)),
                _RoutineChip('Lunch', _format(routine.lunchMinutes)),
                _RoutineChip('Dinner', _format(routine.dinnerMinutes)),
                _RoutineChip('Bedtime', _format(routine.bedtimeMinutes)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RoutineChip extends StatelessWidget {
  const _RoutineChip(this.label, this.time);

  final String label;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label + ' ' + time));
  }
}

class _MedicationSearchSheet extends StatefulWidget {
  const _MedicationSearchSheet({required this.options});

  final List<_PlanCatalogOption> options;

  @override
  State<_MedicationSearchSheet> createState() => _MedicationSearchSheetState();
}

class _MedicationSearchSheetState extends State<_MedicationSearchSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final q = _query.trim().toLowerCase();
    final filtered = widget.options.where((item) {
      return q.isEmpty ||
          item.name.toLowerCase().contains(q) ||
          item.subtitle.toLowerCase().contains(q) ||
          item.searchTerms.any((term) => term.toLowerCase().contains(q));
    }).toList();

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 14,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: Column(
        children: [
          Container(
            width: 42,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            autofocus: true,
            onChanged: (value) => setState(() => _query = value),
            decoration: const InputDecoration(
              hintText: 'Search medicine or supplement',
              prefixIcon: Icon(Icons.search_rounded),
            ),
          ),
          const SizedBox(height: 12),
          if (_query.trim().isNotEmpty)
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              tileColor: Theme.of(context).colorScheme.primaryContainer,
              leading: const Icon(Icons.add_box_outlined),
              title: Text(
                'Add custom: ' + _query.trim(),
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              subtitle: const Text(
                'Frequency can be organized, but administration rules require manual verification.',
              ),
              onTap: () {
                final name = _query.trim();
                final safeId = name
                    .toLowerCase()
                    .replaceAll(RegExp(r'[^a-z0-9]+'), '-');
                Navigator.pop(
                  context,
                  _PlanCatalogOption(
                    sourceId: 'custom-' + safeId,
                    name: name,
                    subtitle: 'Custom medicine',
                    type: PlanItemType.medicine,
                  ),
                );
              },
            ),
          if (_query.trim().isNotEmpty) const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final item = filtered[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  tileColor:
                      Theme.of(context).colorScheme.surfaceContainerLow,
                  leading: Icon(
                    item.type == PlanItemType.medicine
                        ? Icons.medication_outlined
                        : Icons.eco_outlined,
                  ),
                  title: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(item.subtitle),
                  trailing: const Icon(Icons.add_circle_outline_rounded),
                  onTap: () => Navigator.pop(context, item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicationConfigDialog extends StatefulWidget {
  const _MedicationConfigDialog({required this.option});

  final _PlanCatalogOption option;

  @override
  State<_MedicationConfigDialog> createState() =>
      _MedicationConfigDialogState();
}

class _MedicationConfigDialogState extends State<_MedicationConfigDialog> {
  final _doseController = TextEditingController();
  RegimenFrequency _frequency = RegimenFrequency.onceDaily;
  TimingPreference _preference = TimingPreference.auto;
  int? _customMinutes;
  int _weekday = DateTime.monday;

  @override
  void dispose() {
    _doseController.dispose();
    super.dispose();
  }

  Future<void> _pickCustomTime() async {
    final current = _customMinutes == null
        ? const TimeOfDay(hour: 8, minute: 0)
        : TimeOfDay(
            hour: _customMinutes! ~/ 60,
            minute: _customMinutes! % 60,
          );

    final picked = await showTimePicker(
      context: context,
      initialTime: current,
    );

    if (picked != null) {
      setState(() => _customMinutes = picked.hour * 60 + picked.minute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.option.name),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _doseController,
              decoration: const InputDecoration(
                labelText: 'Prescribed dose',
                hintText: 'e.g. 1 tablet / 500 mg / 2 puffs',
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<RegimenFrequency>(
              initialValue: _frequency,
              decoration: const InputDecoration(labelText: 'Frequency'),
              items: RegimenFrequency.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(_frequencyLabel(value)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _frequency = value);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<TimingPreference>(
              initialValue: _preference,
              decoration: const InputDecoration(
                labelText: 'Prescribed/preferred timing',
              ),
              items: TimingPreference.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(_preferenceLabel(value)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _preference = value);
              },
            ),
            if (_frequency == RegimenFrequency.weekly) ...[
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                initialValue: _weekday,
                decoration: const InputDecoration(labelText: 'Weekly day'),
                items: const [
                  DropdownMenuItem(value: 1, child: Text('Monday')),
                  DropdownMenuItem(value: 2, child: Text('Tuesday')),
                  DropdownMenuItem(value: 3, child: Text('Wednesday')),
                  DropdownMenuItem(value: 4, child: Text('Thursday')),
                  DropdownMenuItem(value: 5, child: Text('Friday')),
                  DropdownMenuItem(value: 6, child: Text('Saturday')),
                  DropdownMenuItem(value: 7, child: Text('Sunday')),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _weekday = value);
                },
              ),
            ],
            if (_preference == TimingPreference.custom) ...[
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _pickCustomTime,
                icon: const Icon(Icons.schedule_outlined),
                label: Text(
                  _customMinutes == null
                      ? 'Choose time'
                      : _formatMinutes(_customMinutes!),
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            final dose = _doseController.text.trim();
            if (dose.isEmpty) return;

            final stamp = DateTime.now().microsecondsSinceEpoch.toString();
            Navigator.pop(
              context,
              MedicationPlanItem(
                id: widget.option.sourceId + '-' + stamp,
                sourceId: widget.option.sourceId,
                type: widget.option.type,
                name: widget.option.name,
                doseText: dose,
                frequency: _frequency,
                preference: _preference,
                customMinutes: _customMinutes,
                weekday:
                    _frequency == RegimenFrequency.weekly ? _weekday : null,
              ),
            );
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  String _frequencyLabel(RegimenFrequency value) {
    switch (value) {
      case RegimenFrequency.onceDaily:
        return 'Once daily';
      case RegimenFrequency.twiceDaily:
        return 'Twice daily';
      case RegimenFrequency.threeTimesDaily:
        return '3 times daily';
      case RegimenFrequency.fourTimesDaily:
        return '4 times daily';
      case RegimenFrequency.every12Hours:
        return 'Every 12 hours';
      case RegimenFrequency.every8Hours:
        return 'Every 8 hours';
      case RegimenFrequency.every6Hours:
        return 'Every 6 hours';
      case RegimenFrequency.morning:
        return 'Morning';
      case RegimenFrequency.bedtime:
        return 'Bedtime';
      case RegimenFrequency.weekly:
        return 'Weekly';
      case RegimenFrequency.asNeeded:
        return 'As needed';
    }
  }

  String _preferenceLabel(TimingPreference value) {
    switch (value) {
      case TimingPreference.auto:
        return 'Auto from medicine rule';
      case TimingPreference.morning:
        return 'Morning';
      case TimingPreference.breakfast:
        return 'With/around breakfast';
      case TimingPreference.lunch:
        return 'With/around lunch';
      case TimingPreference.dinner:
        return 'With/around dinner';
      case TimingPreference.bedtime:
        return 'Bedtime';
      case TimingPreference.custom:
        return 'Custom time';
    }
  }

  String _formatMinutes(int minutes) {
    final h = ((minutes ~/ 60) % 24).toString().padLeft(2, '0');
    final m = (minutes % 60).toString().padLeft(2, '0');
    return h + ':' + m;
  }
}

class _RoutineDialog extends StatefulWidget {
  const _RoutineDialog({required this.initial});

  final PatientRoutine initial;

  @override
  State<_RoutineDialog> createState() => _RoutineDialogState();
}

class _RoutineDialogState extends State<_RoutineDialog> {
  late int _wake;
  late int _breakfast;
  late int _lunch;
  late int _dinner;
  late int _bedtime;

  @override
  void initState() {
    super.initState();
    _wake = widget.initial.wakeMinutes;
    _breakfast = widget.initial.breakfastMinutes;
    _lunch = widget.initial.lunchMinutes;
    _dinner = widget.initial.dinnerMinutes;
    _bedtime = widget.initial.bedtimeMinutes;
  }

  Future<int?> _pick(int minutes) async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: minutes ~/ 60,
        minute: minutes % 60,
      ),
    );
    if (result == null) return null;
    return result.hour * 60 + result.minute;
  }

  String _format(int minutes) {
    final h = (minutes ~/ 60).toString().padLeft(2, '0');
    final m = (minutes % 60).toString().padLeft(2, '0');
    return h + ':' + m;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Patient daily routine'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TimeRow(
            label: 'Wake',
            time: _format(_wake),
            onTap: () async {
              final value = await _pick(_wake);
              if (value != null) setState(() => _wake = value);
            },
          ),
          _TimeRow(
            label: 'Breakfast',
            time: _format(_breakfast),
            onTap: () async {
              final value = await _pick(_breakfast);
              if (value != null) setState(() => _breakfast = value);
            },
          ),
          _TimeRow(
            label: 'Lunch',
            time: _format(_lunch),
            onTap: () async {
              final value = await _pick(_lunch);
              if (value != null) setState(() => _lunch = value);
            },
          ),
          _TimeRow(
            label: 'Dinner',
            time: _format(_dinner),
            onTap: () async {
              final value = await _pick(_dinner);
              if (value != null) setState(() => _dinner = value);
            },
          ),
          _TimeRow(
            label: 'Bedtime',
            time: _format(_bedtime),
            onTap: () async {
              final value = await _pick(_bedtime);
              if (value != null) setState(() => _bedtime = value);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(
              context,
              PatientRoutine(
                wakeMinutes: _wake,
                breakfastMinutes: _breakfast,
                lunchMinutes: _lunch,
                dinnerMinutes: _dinner,
                bedtimeMinutes: _bedtime,
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({
    required this.label,
    required this.time,
    required this.onTap,
  });

  final String label;
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      trailing: TextButton(
        onPressed: onTap,
        child: Text(time),
      ),
    );
  }
}

class _PatientPlanInstruction {
  const _PatientPlanInstruction({
    required this.name,
    required this.doseText,
    required this.howToUseAr,
    required this.timingAr,
    required this.importantAr,
    required this.missedDoseAr,
  });

  final String name;
  final String doseText;
  final String howToUseAr;
  final String timingAr;
  final String importantAr;
  final String missedDoseAr;
}

class _PlanCatalogOption {
  const _PlanCatalogOption({
    required this.sourceId,
    required this.name,
    required this.subtitle,
    required this.type,
    this.searchTerms = const [],
  });

  final String sourceId;
  final String name;
  final String subtitle;
  final PlanItemType type;
  final List<String> searchTerms;
}
