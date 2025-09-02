import 'package:crack_and_tell/app/themes.dart';
import 'package:crack_and_tell/features/quote/presentation/pages/quote_page.dart';
import 'package:flutter/material.dart';

class CrackAndTell extends StatelessWidget {
  const CrackAndTell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crack and Tell',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system
      ,
      home: QuotePage()
    );
  }
}