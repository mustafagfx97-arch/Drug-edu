import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/encyclopedia/presentation/encyclopedia_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PatientEduStandaloneApp());
}

class PatientEduStandaloneApp extends StatefulWidget {
  const PatientEduStandaloneApp({super.key});

  @override
  State<PatientEduStandaloneApp> createState() =>
      _PatientEduStandaloneAppState();
}

class _PatientEduStandaloneAppState extends State<PatientEduStandaloneApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Edu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Patient Edu'),
          actions: [
            PopupMenuButton<ThemeMode>(
              tooltip: 'Theme',
              initialValue: _themeMode,
              onSelected: (value) => setState(() => _themeMode = value),
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: ThemeMode.system,
                  child: Text('System theme'),
                ),
                PopupMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
              ],
            ),
          ],
        ),
        body: const SafeArea(
          top: false,
          child: EncyclopediaScreen(),
        ),
      ),
    );
  }
}
