import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../domain/patient_card_data.dart';
import 'patient_card_preview.dart';

class PatientCardEditorScreen extends StatefulWidget {
  const PatientCardEditorScreen({
    super.key,
    required this.initialCard,
  });

  final PatientCardData initialCard;

  @override
  State<PatientCardEditorScreen> createState() =>
      _PatientCardEditorScreenState();
}

class _PatientCardEditorScreenState extends State<PatientCardEditorScreen> {
  late final TextEditingController _medicationController;
  late final TextEditingController _subtitleController;
  late final TextEditingController _purposeController;
  late final TextEditingController _useController;
  late final TextEditingController _timingController;
  late final TextEditingController _importantController;
  late final TextEditingController _missedController;
  late final TextEditingController _helpController;
  bool _showQr = true;

  @override
  void initState() {
    super.initState();
    _medicationController =
        TextEditingController(text: widget.initialCard.medicationName);
    _subtitleController =
        TextEditingController(text: widget.initialCard.subtitleAr);
    _purposeController =
        TextEditingController(text: widget.initialCard.purposeAr);
    _useController =
        TextEditingController(text: widget.initialCard.howToUseAr);
    _timingController =
        TextEditingController(text: widget.initialCard.timingAr);
    _importantController =
        TextEditingController(text: widget.initialCard.importantAr);
    _missedController =
        TextEditingController(text: widget.initialCard.missedDoseAr);
    _helpController =
        TextEditingController(text: widget.initialCard.seekHelpAr);
  }

  @override
  void dispose() {
    _medicationController.dispose();
    _subtitleController.dispose();
    _purposeController.dispose();
    _useController.dispose();
    _timingController.dispose();
    _importantController.dispose();
    _missedController.dispose();
    _helpController.dispose();
    super.dispose();
  }

  PatientCardData get _card => widget.initialCard.copyWith(
        medicationName: _medicationController.text.trim().isEmpty
            ? widget.initialCard.medicationName
            : _medicationController.text.trim(),
        subtitleAr: _subtitleController.text.trim(),
        purposeAr: _purposeController.text.trim(),
        howToUseAr: _useController.text.trim(),
        timingAr: _timingController.text.trim(),
        importantAr: _importantController.text.trim(),
        missedDoseAr: _missedController.text.trim(),
        seekHelpAr: _helpController.text.trim(),
      );

  Future<void> _copyInstructions() async {
    await Clipboard.setData(ClipboardData(text: _card.toQrText()));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Card text copied')),
    );
  }

  Widget _arabicField(
    TextEditingController controller,
    String label, {
    int maxLines = 3,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: controller,
        minLines: 1,
        maxLines: maxLines,
        textAlign: TextAlign.right,
        decoration: InputDecoration(labelText: label),
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Patient Card'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, _card),
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Keep only what matters',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Leave any unnecessary section empty. Empty sections are hidden from the patient card.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _medicationController,
            decoration: const InputDecoration(
              labelText: 'Medication / device name',
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 10),
          _arabicField(_subtitleController, 'عنوان مختصر'),
          const SizedBox(height: 10),
          _arabicField(_purposeController, 'لماذا أستخدمه؟'),
          const SizedBox(height: 10),
          _arabicField(_useController, 'كيف أستخدمه؟'),
          const SizedBox(height: 10),
          _arabicField(_timingController, 'متى أستخدمه؟'),
          const SizedBox(height: 10),
          _arabicField(_importantController, 'أهم تنبيه'),
          const SizedBox(height: 10),
          _arabicField(_missedController, 'إذا نسيت الجرعة'),
          const SizedBox(height: 10),
          _arabicField(_helpController, 'متى أطلب المساعدة؟'),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            title: const Text('Show QR code'),
            subtitle: const Text(
              'The QR contains the card instructions, not the patient name.',
            ),
            value: _showQr,
            onChanged: (value) => setState(() => _showQr = value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Preview',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton.filledTonal(
                tooltip: 'Copy card text',
                onPressed: _copyInstructions,
                icon: const Icon(Icons.copy_all_outlined),
              ),
            ],
          ),
          const SizedBox(height: 10),
          PatientCardPreview(card: _card, showQr: _showQr),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, _card),
            icon: const Icon(Icons.save_outlined),
            label: const Text('Save card'),
          ),
        ],
      ),
    );
  }
}
