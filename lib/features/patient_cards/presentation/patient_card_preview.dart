import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../domain/patient_card_data.dart';

class PatientCardPreview extends StatelessWidget {
  const PatientCardPreview({
    super.key,
    required this.card,
    this.showQr = true,
  });

  final PatientCardData card;
  final bool showQr;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: scheme.outlineVariant),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  card.category == 'Device'
                      ? Icons.medical_services_outlined
                      : Icons.medication_outlined,
                  color: scheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.medicationName,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        card.subtitleAr,
                        textAlign: TextAlign.right,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < card.items.length; i++) ...[
                    Text(
                      card.items[i].titleAr,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: scheme.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      card.items[i].bodyAr,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.65),
                    ),
                    if (i != card.items.length - 1) ...[
                      const SizedBox(height: 12),
                      Divider(color: scheme.outlineVariant),
                      const SizedBox(height: 12),
                    ],
                  ],
                ],
              ),
            ),
          ),
          if (showQr) ...[
            const SizedBox(height: 18),
            Divider(color: scheme.outlineVariant),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: QrImageView(
                    data: card.toQrText(),
                    version: QrVersions.auto,
                    size: 108,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'امسح الرمز لعرض التعليمات',
                          textAlign: TextAlign.right,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'الرمز يحتوي على التعليمات فقط ولا يضع اسم المريض داخله.',
                          textAlign: TextAlign.right,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(
                Icons.local_pharmacy_outlined,
                size: 17,
                color: scheme.primary,
              ),
              const SizedBox(width: 7),
              Text(
                'Drug Edu',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
