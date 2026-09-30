import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/shell/presentation/app_shell.dart';

class SupplementEduApp extends StatefulWidget {
  const SupplementEduApp({super.key});

  @override
  State<SupplementEduApp> createState() => _SupplementEduAppState();
}

class _SupplementEduAppState extends State<SupplementEduApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode value) {
    setState(() => _themeMode = value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supplement Edu',
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


@Deprecated('Compatibility alias for the frozen Drug Edu regression suite.')
class DrugEduApp extends SupplementEduApp {
  const DrugEduApp({super.key});
}
