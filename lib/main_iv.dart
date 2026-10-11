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

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Drug IV',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const IvOnlyShell(),
      );
}
