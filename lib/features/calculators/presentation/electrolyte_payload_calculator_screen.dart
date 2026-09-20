import 'package:flutter/material.dart';

class ElectrolytePayloadCalculatorScreen extends StatefulWidget {
  const ElectrolytePayloadCalculatorScreen({super.key});

  @override
  State<ElectrolytePayloadCalculatorScreen> createState() =>
      _ElectrolytePayloadCalculatorScreenState();
}

class _ElectrolytePayloadCalculatorScreenState
    extends State<ElectrolytePayloadCalculatorScreen> {
  final _phosphateController = TextEditingController();
  int _productIndex = 0;

  static const _products = [
    _PhosphateProduct(
      name: 'Potassium phosphate',
      phosphatePerMl: 3,
      companionPerMl: 4.4,
      companionUnit: 'mEq K',
    ),
    _PhosphateProduct(
      name: 'Sodium phosphate',
      phosphatePerMl: 3,
      companionPerMl: 4,
      companionUnit: 'mEq Na',
    ),
  ];

  @override
  void dispose() {
    _phosphateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = _products[_productIndex];
    final ordered =
        double.tryParse(_phosphateController.text.trim());

    double? volume;
    double? payload;

    if (ordered != null) {
      volume = ordered / product.phosphatePerMl;
      payload = volume * product.companionPerMl;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Electrolyte Payload')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const Text(
            'Select the exact phosphate product. The calculator shows both phosphate and the linked potassium or sodium contribution.',
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            key: ValueKey(_productIndex),
            initialValue: _productIndex,
            decoration: const InputDecoration(labelText: 'Product'),
            items: List.generate(
              _products.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(_products[index].name),
              ),
            ),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _productIndex = value;
                _phosphateController.clear();
              });
            },
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_fmt(product.phosphatePerMl)} mmol phosphate/mL',
                  ),
                  Text(
                    '${_fmt(product.companionPerMl)} ${product.companionUnit}/mL',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _phosphateController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Prescribed phosphate (mmol)',
            ),
            onChanged: (_) => setState(() {}),
          ),
          if (volume != null && payload != null) ...[
            const SizedBox(height: 14),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  children: [
                    _row('Phosphate', '${_fmt(ordered!)} mmol'),
                    _row('Volume to withdraw', '${_fmt(volume)} mL'),
                    const Divider(),
                    _row(
                      'Associated ${product.companionUnit}',
                      _fmt(payload),
                      strong: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static Widget _row(String label, String value, {bool strong = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              fontWeight: strong ? FontWeight.w900 : FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  static String _fmt(double value) {
    final text = value.toStringAsFixed(3);
    return text
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }
}

class _PhosphateProduct {
  const _PhosphateProduct({
    required this.name,
    required this.phosphatePerMl,
    required this.companionPerMl,
    required this.companionUnit,
  });

  final String name;
  final double phosphatePerMl;
  final double companionPerMl;
  final String companionUnit;
}
