import 'package:crack_and_tell/theme/app_colors.dart';
import 'package:crack_and_tell/core/components/app_background.dart';
import 'package:crack_and_tell/features/authentication/presentation/pages/signin_page.dart';
import 'package:crack_and_tell/features/main_tab_page.dart';
import 'package:flutter/material.dart';

class CrackAndTell extends StatelessWidget {
  const CrackAndTell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crack and Tell',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      builder: (context, child) => AppBackground(child: child!),
      home: MainTabPage()
    );
  }
}