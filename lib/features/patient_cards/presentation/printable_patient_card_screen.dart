import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../domain/patient_card_data.dart';
import 'patient_card_preview.dart';

class PrintablePatientCardScreen extends StatefulWidget {
  const PrintablePatientCardScreen({
    super.key,
    required this.card,
  });

  final PatientCardData card;

  @override
  State<PrintablePatientCardScreen> createState() =>
      _PrintablePatientCardScreenState();
}

class _PrintablePatientCardScreenState
    extends State<PrintablePatientCardScreen> {
  final GlobalKey _printKey = GlobalKey();
  bool _printing = false;

  Future<void> _printCard() async {
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
          pageFormat: PdfPageFormat.a5,
          margin: const pw.EdgeInsets.all(18),
          build: (_) => pw.Center(
            child: pw.Image(cardImage, fit: pw.BoxFit.contain),
          ),
        ),
      );

      await Printing.layoutPdf(
        name: '${widget.card.medicationName} patient card',
        onLayout: (_) async => pdf.save(),
      );
    } finally {
      if (mounted) setState(() => _printing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Print Patient Card')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Patient handout',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Focused Arabic instructions only. The QR contains the same counseling text shown on the card.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          RepaintBoundary(
            key: _printKey,
            child: Material(
              color: theme.colorScheme.surface,
              child: PatientCardPreview(card: widget.card),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _printing ? null : _printCard,
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
      ),
    );
  }
}
