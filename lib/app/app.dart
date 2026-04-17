import 'package:crack_and_tell/app/router.dart';
import 'package:crack_and_tell/theme/app_colors.dart';
import 'package:crack_and_tell/core/components/app_background.dart';
import 'package:flutter/material.dart';

class CrackAndTell extends StatelessWidget {
  const CrackAndTell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Koalma',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      builder: (context, child) => AppBackground(child: child!),
      routerConfig: router,
    );
  }
}