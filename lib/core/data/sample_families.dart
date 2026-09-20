import 'package:flutter/material.dart';

import '../models/medication_family.dart';

const medicationFamilies = <MedicationFamily>[
  MedicationFamily(
    id: 'cardiovascular',
    name: 'Cardiovascular',
    subtitle: 'Blood pressure, heart failure, rhythm and lipid therapy.',
    icon: Icons.monitor_heart_outlined,
    searchTerms: ['blood pressure', 'heart', 'lipid', 'antihypertensive'],
  ),
  MedicationFamily(
    id: 'diabetes-endocrine',
    name: 'Diabetes & Endocrine',
    subtitle: 'Diabetes, thyroid, corticosteroids and endocrine therapy.',
    icon: Icons.bloodtype_outlined,
    searchTerms: ['diabetes', 'insulin', 'thyroid', 'steroid'],
  ),
  MedicationFamily(
    id: 'respiratory',
    name: 'Respiratory',
    subtitle: 'Asthma, COPD, inhalers, nebulizers and respiratory devices.',
    icon: Icons.air_outlined,
    searchTerms: ['asthma', 'copd', 'inhaler', 'nebulizer'],
  ),
  MedicationFamily(
    id: 'antiinfective',
    name: 'Anti-infectives',
    subtitle: 'Antibiotics, antivirals and antifungals.',
    icon: Icons.biotech_outlined,
    searchTerms: ['antibiotic', 'antiviral', 'antifungal', 'infection'],
  ),
  MedicationFamily(
    id: 'cns',
    name: 'Neurology & Mental Health',
    subtitle: 'Seizures, migraine, pain-modulation and psychiatric medicines.',
    icon: Icons.psychology_outlined,
    searchTerms: ['seizure', 'epilepsy', 'depression', 'anxiety', 'migraine'],
  ),
  MedicationFamily(
    id: 'gastrointestinal',
    name: 'Gastrointestinal',
    subtitle: 'Acid suppression, nausea, constipation and diarrhea.',
    icon: Icons.lunch_dining_outlined,
    searchTerms: ['stomach', 'ppi', 'nausea', 'constipation', 'diarrhea'],
  ),
  MedicationFamily(
    id: 'pain-inflammation',
    name: 'Pain & Inflammation',
    subtitle: 'Analgesics, anti-inflammatory medicines and fever treatment.',
    icon: Icons.healing_outlined,
    searchTerms: ['pain', 'fever', 'nsaid', 'analgesic'],
  ),
  MedicationFamily(
    id: 'anticoagulation',
    name: 'Anticoagulation',
    subtitle: 'Oral and injectable anticoagulants and bleeding-safety counseling.',
    icon: Icons.water_drop_outlined,
    searchTerms: ['anticoagulant', 'blood thinner', 'bleeding', 'heparin'],
  ),
  MedicationFamily(
    id: 'allergy-dermatology',
    name: 'Allergy & Dermatology',
    subtitle: 'Antihistamines, topical therapy and immune/skin treatments.',
    icon: Icons.spa_outlined,
    searchTerms: ['allergy', 'skin', 'antihistamine', 'eczema'],
  ),
  MedicationFamily(
    id: 'pediatrics',
    name: 'Pediatrics',
    subtitle: 'Practical administration, liquids and caregiver counseling.',
    icon: Icons.child_care_outlined,
    searchTerms: ['child', 'pediatric', 'liquid', 'syrup'],
  ),
  MedicationFamily(
    id: 'otc',
    name: 'OTC & Self-care',
    subtitle: 'Common self-care medicines with duration and referral limits.',
    icon: Icons.shopping_bag_outlined,
    searchTerms: ['otc', 'self care', 'cold', 'diarrhea', 'constipation'],
  ),
  MedicationFamily(
    id: 'supplements',
    name: 'Vitamins & Supplements',
    subtitle: 'Vitamins, minerals, elemental amounts and practical use.',
    icon: Icons.eco_outlined,
    searchTerms: ['vitamin', 'mineral', 'iron', 'calcium', 'magnesium'],
  ),
];
