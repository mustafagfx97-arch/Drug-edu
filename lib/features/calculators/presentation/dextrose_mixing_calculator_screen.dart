import 'package:flutter/material.dart';

class DextroseMixingCalculatorScreen extends StatefulWidget {
  const DextroseMixingCalculatorScreen({super.key});

  @override
  State<DextroseMixingCalculatorScreen> createState() =>
      _DextroseMixingCalculatorScreenState();
}

class _DextroseMixingCalculatorScreenState
    extends State<DextroseMixingCalculatorScreen> {
  final _weakController = TextEditingController(text: '10');
  final _strongController = TextEditingController(text: '50');
  final _targetController = TextEditingController(text: '20');
  final _volumeController = TextEditingController(text: '100');

  @override
  void dispose() {
    _weakController.dispose();
    _strongController.dispose();
    _targetController.dispose();
    _volumeController.dispose();
    super.dispose();
  }

  double? _value(TextEditingController controller) =>
      double.tryParse(controller.text.trim());

  @override
  Widget build(BuildContext context) {
    final weak = _value(_weakController);
    final strong = _value(_strongController);
    final target = _value(_targetController);
    final finalVolume = _value(_volumeController);

    String? error;
    double? strongVolume;
    double? weakVolume;

    if (weak != null &&
        strong != null &&
        target != null &&
        finalVolume != null) {
      if (strong <= weak) {
        error = 'Strong solution must be greater than weak solution.';
      } else if (target < weak || target > strong) {
        error =
            'Target concentration must lie between the two source solutions.';
      } else if (finalVolume <= 0) {
        error = 'Final volume must be greater than zero.';
      } else {
        strongVolume =
            finalVolume * (target - weak) / (strong - weak);
        weakVolume = finalVolume - strongVolume;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dextrose Mixing')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const Text(
            'Mix two verified dextrose source solutions to a target concentration. This is a concentration calculation only; vascular-access rules remain profile-specific.',
          ),
          const SizedBox(height: 16),
          _field(_weakController, 'Weak solution (%)'),
          const SizedBox(height: 10),
          _field(_strongController, 'Strong solution (%)'),
          const SizedBox(height: 10),
          _field(_targetController, 'Target concentration (%)'),
          const SizedBox(height: 10),
          _field(_volumeController, 'Final total volume (mL)'),
          if (error != null) ...[
            const SizedBox(height: 14),
            _ErrorBox(text: error),
          ],
          if (strongVolume != null && weakVolume != null) ...[
            const SizedBox(height: 14),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  children: [
                    _row(
                      'Strong solution',
                      '${_fmt(strongVolume)} mL',
                    ),
                    _row(
                      'Weak solution',
                      '${_fmt(weakVolume)} mL',
                    ),
                    const Divider(),
                    _row(
                      'Final volume',
                      '${_fmt(finalVolume!)} mL',
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

  Widget _field(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: label),
      onChanged: (_) => setState(() {}),
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

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text),
    );
  }
}
