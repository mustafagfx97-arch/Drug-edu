import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/iv_prep/presentation/iv_only_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DrugIvApp());
}

/// Dedicated web/PWA entry point. The original Drug Edu app remains available
/// for existing uses, but the published PWA is IV ONLY.
class DrugIvApp extends StatelessWidget {
  const DrugIvApp({super.key});

  // Drug IV has its own compact, readable mobile layout. Avoid changing the
  // broader Drug Edu application's typography and input behavior.
  ThemeData _ivTheme(ThemeData base) => base.copyWith(
        inputDecorationTheme: base.inputDecorationTheme.copyWith(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 18,
          ),
        ),
        navigationBarTheme: base.navigationBarTheme.copyWith(height: 66),
      );

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Drug IV',
        debugShowCheckedModeBanner: false,
        theme: _ivTheme(AppTheme.light),
        darkTheme: _ivTheme(AppTheme.dark),
        home: const IvOnlyShell(),
      );
}
