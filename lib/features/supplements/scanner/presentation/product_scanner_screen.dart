import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../library/data/supplement_library_catalog.dart';
import '../../library/domain/supplement_library_entry.dart';
import '../../library/presentation/supplement_library_router.dart';
import '../../products/data/product_analyzer_data.dart';
import '../../products/domain/product_analyzer_models.dart';
import '../../products/presentation/product_analyzer_screen.dart';
import '../application/product_scan_engine.dart';
import '../domain/product_scanner_models.dart';
import '../services/on_device_product_scan_service.dart';

class ProductScannerScreen extends StatefulWidget {
  const ProductScannerScreen({super.key});

  @override
  State<ProductScannerScreen> createState() => _ProductScannerScreenState();
}

class _ProductScannerScreenState extends State<ProductScannerScreen> {
  final _picker = ImagePicker();
  final _scanService = const OnDeviceProductScanService();
  final _engine = const ProductScanEngine();
  final _servingsController = TextEditingController(text: '1');

  XFile? _frontImage;
  XFile? _factsImage;
  OnDeviceImageScan? _frontScan;
  OnDeviceImageScan? _factsScan;
  ProductScanReport? _report;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _servingsController.dispose();
    super.dispose();
  }

  Future<void> _pick({
    required bool facts,
    required ImageSource source,
  }) async {
    if (_busy) return;
    final image = await _picker.pickImage(
      source: source,
      imageQuality: 92,
      maxWidth: 2600,
    );
    if (image == null) return;

    setState(() {
      _busy = true;
      _error = null;
    });

    try {
      final scan = await _scanService.scanImage(image.path);
      if (!mounted) return;
      setState(() {
        if (facts) {
          _factsImage = image;
          _factsScan = scan;
        } else {
          _frontImage = image;
          _frontScan = scan;
        }
        _reAnalyze();
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error =
            'The image could not be processed on this device. Try a clearer image or choose it from the gallery. Technical detail: ' +
                error.toString();
      });
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  void _reAnalyze() {
    _report = _engine.analyze(
      frontText: _frontScan?.recognizedText ?? '',
      factsText: _factsScan?.recognizedText ?? '',
      frontBarcodes: _frontScan?.barcodes ?? const [],
      factsBarcodes: _factsScan?.barcodes ?? const [],
    );
  }

  Future<void> _chooseSource(bool facts) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: Text(facts
                    ? 'Photograph Supplement Facts'
                    : 'Photograph front label'),
                subtitle: const Text(
                  'Use bright, even light and keep the label flat and sharp.',
                ),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Choose existing photo'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );
    if (source != null) {
      await _pick(facts: facts, source: source);
    }
  }

  Future<void> _reviewOcr({
    required bool facts,
  }) async {
    final current = facts ? _factsScan : _frontScan;
    if (current == null) return;

    final controller = TextEditingController(text: current.recognizedText);
    final updated = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(facts ? 'Review Supplement Facts OCR' : 'Review front-label OCR'),
        content: SizedBox(
          width: 620,
          child: TextField(
            controller: controller,
            minLines: 12,
            maxLines: 22,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              helperText:
                  'Correct product names, decimal points, amounts and units before clinical use.',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Use corrected text'),
          ),
        ],
      ),
    );
    controller.dispose();

    if (updated == null || !mounted) return;
    setState(() {
      final replacement = OnDeviceImageScan(
        recognizedText: updated,
        barcodes: current.barcodes,
      );
      if (facts) {
        _factsScan = replacement;
      } else {
        _frontScan = replacement;
      }
      _reAnalyze();
    });
  }

  void _reset() {
    setState(() {
      _frontImage = null;
      _factsImage = null;
      _frontScan = null;
      _factsScan = null;
      _report = null;
      _error = null;
      _servingsController.text = '1';
    });
  }

  Color _confidenceColor(
    BuildContext context,
    ProductScanConfidence value,
  ) {
    final scheme = Theme.of(context).colorScheme;
    return switch (value) {
      ProductScanConfidence.exactVerifiedProduct => scheme.primaryContainer,
      ProductScanConfidence.highConfidenceLocalMatch =>
        scheme.secondaryContainer,
      ProductScanConfidence.probableLocalMatch => scheme.tertiaryContainer,
      ProductScanConfidence.ingredientLevelOnly =>
        scheme.surfaceContainerHighest,
      ProductScanConfidence.unresolved => scheme.errorContainer,
    };
  }

  String _formatNumber(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    if (value.abs() < 10) return value.toStringAsFixed(2);
    return value.toStringAsFixed(1);
  }

  void _openLibraryCandidate(ProductScanCandidate candidate) {
    for (final entry in supplementLibraryEntries) {
      if (entry.id == candidate.id) {
        openSupplementLibraryEntry(context, entry);
        return;
      }
    }
  }

  Future<void> _showIngredientEvidence(
    ParsedSupplementIngredient ingredient,
  ) async {
    final matches = searchSupplementLibrary(ingredient.libraryQuery).take(6).toList();
    if (matches.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No local clinical entry matched this ingredient yet.'),
        ),
      );
      return;
    }

    final entry = await showModalBottomSheet<SupplementLibraryEntry>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Local evidence for ' + ingredient.displayName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              for (final item in matches)
                ListTile(
                  title: Text(item.title),
                  subtitle: Text(
                    item.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => Navigator.pop(context, item),
                ),
            ],
          ),
        ),
      ),
    );

    if (entry != null && mounted) {
      openSupplementLibraryEntry(context, entry);
    }
  }

  List<AnalyzerLine> _analyzerLines() {
    final report = _report;
    if (report == null) return const [];
    final servings =
        double.tryParse(_servingsController.text.trim().replaceAll(',', '.'));
    if (servings == null || servings <= 0) return const [];

    var productName = 'Scanned product';
    if (report.verifiedProductCandidates.isNotEmpty) {
      productName = report.verifiedProductCandidates.first.title;
    } else if (report.libraryCandidates.isNotEmpty) {
      productName = report.libraryCandidates.first.title;
    }

    final lines = <AnalyzerLine>[];
    for (final ingredient in report.ingredients) {
      final id = ingredient.analyzerIngredientId;
      if (id == null || !ingredient.amountKnown) continue;
      AnalyzerIngredientRule? rule;
      for (final item in analyzerIngredientRules) {
        if (item.id == id) {
          rule = item;
          break;
        }
      }
      if (rule == null) continue;
      final expectedUnit = switch (rule.unit) {
        AnalyzerUnit.mg => 'mg',
        AnalyzerUnit.mcg => 'mcg',
        AnalyzerUnit.iu => 'IU',
        AnalyzerUnit.cfu => 'CFU',
      };
      if (ingredient.normalizedUnit != expectedUnit) continue;

      lines.add(
        AnalyzerLine(
          productName: productName,
          ingredientId: id,
          amountPerServing: ingredient.normalizedAmount,
          servingsPerDay: servings,
          amountKnown: true,
        ),
      );
    }
    return lines;
  }

  void _openAnalyzer() {
    final lines = _analyzerLines();
    if (lines.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No analyzer-compatible numeric lines are ready. Verify the OCR amounts and servings/day first.',
          ),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProductAnalyzerScreen(initialLines: lines),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final report = _report;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan a Supplement'),
        actions: [
          if (_frontScan != null || _factsScan != null)
            IconButton(
              tooltip: 'Reset scan',
              onPressed: _busy ? null : _reset,
              icon: const Icon(Icons.refresh_rounded),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 32),
        children: [
          Text(
            'Identify → read the label → verify → analyze',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'This scanner is local-first. It reads the photographed label on-device, then compares identity and ingredients against Supplement Edu’s clinical database. It does not use an internet search as the primary evidence engine.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Privacy in this build: OCR and barcode recognition run on-device. The selected images are not uploaded by this scanner.',
              style: TextStyle(height: 1.45, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 16),
          _ScanImageCard(
            title: '1. Front label',
            subtitle:
                'Brand + exact product name + strength/version. This is the identity layer.',
            image: _frontImage,
            scan: _frontScan,
            busy: _busy,
            onPick: () => _chooseSource(false),
            onReview: _frontScan == null ? null : () => _reviewOcr(facts: false),
          ),
          const SizedBox(height: 12),
          _ScanImageCard(
            title: '2. Supplement Facts / Ingredients',
            subtitle:
                'Serving size + ingredients + amounts. This is the formulation layer and is more important than marketing claims.',
            image: _factsImage,
            scan: _factsScan,
            busy: _busy,
            onPick: () => _chooseSource(true),
            onReview: _factsScan == null ? null : () => _reviewOcr(facts: true),
          ),
          if (_busy) ...[
            const SizedBox(height: 16),
            const LinearProgressIndicator(),
            const SizedBox(height: 8),
            const Text('Reading text and barcodes on this device...'),
          ],
          if (_error != null) ...[
            const SizedBox(height: 14),
            _Notice(text: _error!, critical: true),
          ],
          if (report != null && !_busy) ...[
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _confidenceColor(context, report.confidence),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report.confidenceLabel,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    report.confidenceReason,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
                  ),
                  if (report.servingSize != null) ...[
                    const SizedBox(height: 9),
                    Text(
                      'Detected serving size: ' + report.servingSize!,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ],
              ),
            ),
            if (report.verifiedProductCandidates.isNotEmpty) ...[
              const SizedBox(height: 18),
              _SectionTitle(
                title: 'Verified local product candidate',
                count: report.verifiedProductCandidates.length,
              ),
              const SizedBox(height: 8),
              for (final candidate in report.verifiedProductCandidates)
                Card(
                  margin: const EdgeInsets.only(bottom: 9),
                  child: ListTile(
                    title: Text(
                      candidate.title,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(
                      (candidate.score * 100).round().toString() +
                          '% identity score\n' +
                          candidate.reasons.join(' · ') +
                          '\n' +
                          candidate.subtitle,
                    ),
                    isThreeLine: true,
                  ),
                ),
            ],
            if (report.libraryCandidates.isNotEmpty) ...[
              const SizedBox(height: 18),
              _SectionTitle(
                title: 'Encyclopedia identity matches',
                count: report.libraryCandidates.length,
              ),
              const SizedBox(height: 8),
              for (final candidate in report.libraryCandidates)
                Card(
                  margin: const EdgeInsets.only(bottom: 9),
                  child: ListTile(
                    onTap: () => _openLibraryCandidate(candidate),
                    title: Text(
                      candidate.title,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(
                      (candidate.score * 100).round().toString() +
                          '% local match · ' +
                          candidate.reasons.join(' · '),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
            ],
            const SizedBox(height: 18),
            _SectionTitle(
              title: 'Ingredients read from the label',
              count: report.ingredients.length,
            ),
            const SizedBox(height: 8),
            if (report.ingredients.isEmpty)
              const _Notice(
                text:
                    'No supported ingredient lines were parsed. Retake the Supplement Facts image closer and straighter, or use Review OCR to correct the text.',
                critical: false,
              )
            else
              for (final ingredient in report.ingredients)
                Card(
                  margin: const EdgeInsets.only(bottom: 9),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 13, 12, 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                ingredient.displayName,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            if (ingredient.amountKnown)
                              Text(
                                _formatNumber(ingredient.normalizedAmount) +
                                    ' ' +
                                    ingredient.normalizedUnit,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w900,
                                ),
                              )
                            else
                              const Text(
                                'amount unresolved',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'OCR line: ' + ingredient.rawLine,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (ingredient.warning != null) ...[
                          const SizedBox(height: 7),
                          Text(
                            ingredient.warning!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.error,
                              fontWeight: FontWeight.w700,
                              height: 1.35,
                            ),
                          ),
                        ],
                        const SizedBox(height: 7),
                        OutlinedButton.icon(
                          onPressed: () => _showIngredientEvidence(ingredient),
                          icon: const Icon(Icons.menu_book_outlined),
                          label: const Text('Open local clinical evidence'),
                        ),
                      ],
                    ),
                  ),
                ),
            if (report.ingredients.any(
              (item) =>
                  item.analyzerIngredientId != null && item.amountKnown,
            )) ...[
              const SizedBox(height: 14),
              Text(
                'Daily-dose safety bridge',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'Enter how many LABEL SERVINGS are taken per day. This is required before a per-serving OCR amount can be compared with daily duplicate/UL rules.',
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
              ),
              const SizedBox(height: 9),
              SizedBox(
                width: 180,
                child: TextField(
                  controller: _servingsController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Servings per day',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              FilledButton.icon(
                onPressed: _openAnalyzer,
                icon: const Icon(Icons.add_chart_rounded),
                label: const Text(
                  'Send parsed amounts to Product & Combination Analyzer',
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'OCR-derived amounts still require visual label confirmation before clinical decisions.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
            if (report.detectedBarcodes.isNotEmpty) ...[
              const SizedBox(height: 18),
              _SectionTitle(
                title: 'Detected barcode / code',
                count: report.detectedBarcodes.length,
              ),
              const SizedBox(height: 8),
              for (final code in report.detectedBarcodes)
                _Notice(
                  text: code +
                      ' — detected only. A code does not verify the current formulation unless mapped to our verified local product registry.',
                  critical: false,
                ),
            ],
            const SizedBox(height: 18),
            Text(
              'Scanner safety checks',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            for (final warning in report.warnings)
              _Notice(text: warning, critical: true),
            const SizedBox(height: 12),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: const Text(
                'Raw OCR text',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              subtitle: const Text(
                'Use this to audit what the scanner actually read.',
              ),
              children: [
                SelectableText(
                  report.rawText.isEmpty
                      ? 'No text recognized.'
                      : report.rawText,
                  style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
                ),
              ],
            ),
            const SizedBox(height: 14),
            _Notice(
              text:
                  'Current on-device OCR is optimized for Latin-script labels. If a clinically important Arabic-only line is not read, use the manual OCR review or verify it directly from the package. A future online verification layer can add multilingual document OCR without changing the local clinical evidence engine.',
              critical: false,
            ),
          ],
        ],
      ),
    );
  }
}

class _ScanImageCard extends StatelessWidget {
  const _ScanImageCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.scan,
    required this.busy,
    required this.onPick,
    required this.onReview,
  });

  final String title;
  final String subtitle;
  final XFile? image;
  final OnDeviceImageScan? scan;
  final bool busy;
  final VoidCallback onPick;
  final VoidCallback? onReview;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            if (image != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(
                  File(image!.path),
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            if (scan != null) ...[
              const SizedBox(height: 8),
              Text(
                scan!.recognizedText.trim().isEmpty
                    ? 'No text recognized'
                    : scan!.recognizedText.trim().split(RegExp(r'[\r\n]+')).length
                            .toString() +
                        ' OCR line(s) recognized' +
                        (scan!.barcodes.isEmpty
                            ? ''
                            : ' · ' +
                                scan!.barcodes.length.toString() +
                                ' code(s)'),
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
            const SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: busy ? null : onPick,
                    icon: Icon(
                      image == null
                          ? Icons.document_scanner_outlined
                          : Icons.refresh_rounded,
                    ),
                    label: Text(image == null ? 'Scan' : 'Replace'),
                  ),
                ),
                if (onReview != null) ...[
                  const SizedBox(width: 9),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: busy ? null : onReview,
                      icon: const Icon(Icons.edit_note_rounded),
                      label: const Text('Review OCR'),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            count.toString(),
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({
    required this.text,
    required this.critical,
  });

  final String text;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: critical
            ? theme.colorScheme.errorContainer.withValues(alpha: 0.48)
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(height: 1.42),
      ),
    );
  }
}
