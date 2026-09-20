import 'package:flutter/material.dart';

import '../data/patient_card_templates.dart';
import '../domain/patient_card_data.dart';
import 'patient_card_editor_screen.dart';
import 'patient_card_preview.dart';

class PatientCardsScreen extends StatefulWidget {
  const PatientCardsScreen({super.key});

  @override
  State<PatientCardsScreen> createState() => _PatientCardsScreenState();
}

class _PatientCardsScreenState extends State<PatientCardsScreen> {
  final List<PatientCardData> _cards = [...patientCardTemplates];

  Future<void> _editCard(int index) async {
    final updated = await Navigator.of(context).push<PatientCardData>(
      MaterialPageRoute(
        builder: (_) => PatientCardEditorScreen(initialCard: _cards[index]),
      ),
    );

    if (updated == null) return;
    setState(() => _cards[index] = updated);
  }

  void _duplicateCard(int index) {
    final original = _cards[index];
    final duplicate = original.copyWith(
      id: original.id + '-copy-' + (_cards.length + 1).toString(),
      templateName: original.templateName + ' Copy',
    );

    setState(() => _cards.insert(index + 1, duplicate));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(original.templateName + ' duplicated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Patient Cards')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'Reusable counseling cards',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Clone a template, edit only what is patient-specific, then use the QR as an offline copy of the counseling instructions.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.55),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.privacy_tip_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Privacy default: patient-identifying information is not placed inside the QR code.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          for (var i = 0; i < _cards.length; i++) ...[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.fromLTRB(16, 10, 8, 4),
                    title: Text(
                      _cards[i].templateName,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      _cards[i].medicationName + ' · ' + _cards[i].category,
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') _editCard(i);
                        if (value == 'duplicate') _duplicateCard(i);
                      },
                      itemBuilder: (_) => const [
                        PopupMenuItem(
                          value: 'edit',
                          child: ListTile(
                            leading: Icon(Icons.edit_outlined),
                            title: Text('Edit'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        PopupMenuItem(
                          value: 'duplicate',
                          child: ListTile(
                            leading: Icon(Icons.copy_all_outlined),
                            title: Text('Duplicate'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
                    child: PatientCardPreview(card: _cards[i]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _duplicateCard(i),
                            icon: const Icon(Icons.copy_outlined),
                            label: const Text('Duplicate'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _editCard(i),
                            icon: const Icon(Icons.edit_outlined),
                            label: const Text('Customize'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
