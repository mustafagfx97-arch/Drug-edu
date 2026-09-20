import 'package:flutter/material.dart';

class MedicationFamily {
  const MedicationFamily({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.searchTerms,
  });

  final String id;
  final String name;
  final String subtitle;
  final IconData icon;
  final List<String> searchTerms;
}
