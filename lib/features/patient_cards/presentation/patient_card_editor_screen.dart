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
  late final TextEditingController _instructionsController;
  bool _showQr = true;

  @override
  void initState() {
    super.initState();
    _medicationController =
        TextEditingController(text: widget.initialCard.medicationName);
    _subtitleController =
        TextEditingController(text: widget.initialCard.subtitle);
    _instructionsController =
        TextEditingController(text: widget.initialCard.instructionsAr);
  }

  @override
  void dispose() {
    _medicationController.dispose();
    _subtitleController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  PatientCardData get _card => widget.initialCard.copyWith(
        medicationName: _medicationController.text.trim().isEmpty
            ? widget.initialCard.medicationName
            : _medicationController.text.trim(),
        subtitle: _subtitleController.text.trim(),
        instructionsAr: _instructionsController.text.trim(),
      );

  Future<void> _copyInstructions() async {
    await Clipboard.setData(ClipboardData(text: _card.toQrText()));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Card text copied')),
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
            'Card content',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _medicationController,
            decoration: const InputDecoration(
              labelText: 'Medication / device name',
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _subtitleController,
            decoration: const InputDecoration(
              labelText: 'Short English subtitle',
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: _instructionsController,
              minLines: 5,
              maxLines: 10,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                labelText: 'تعليمات المريض',
                alignLabelWithHint: true,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            title: const Text('Show QR code'),
            subtitle: const Text(
              'QR contains the counseling text and does not include a patient name by default.',
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
          const SizedBox(height: 8),
          Text(
            'PDF, image export and print will use this same preview component in the production export layer.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
