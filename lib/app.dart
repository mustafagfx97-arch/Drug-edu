import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/shell/presentation/app_shell.dart';

class DrugEduApp extends StatefulWidget {
  const DrugEduApp({super.key});

  @override
  State<DrugEduApp> createState() => _DrugEduAppState();
}

class _DrugEduAppState extends State<DrugEduApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode value) {
    setState(() => _themeMode = value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drug Edu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: AppShell(
        themeMode: _themeMode,
        onThemeModeChanged: _setThemeMode,
      ),
    );
  }
}
