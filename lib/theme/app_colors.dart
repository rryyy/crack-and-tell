import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Light theme colors
  static const background = Color(0xFFFAFBFF);
  static const foreground = Color(0xFF0F172A);
  static const border = Color(0x14000000); // alpha 0x14
  static const input = Color(0xFFFFFFFF);
  static const primary = Color(0xFF6C5CE7);
  static const primaryForeground = Color(0xFFFFFFFF);
  static const secondary = Color(0xFFF0F3FF);
  static const secondaryForeground = Color(0xFFF0F3FF);
  static const muted = Color(0xFFF3F6FA);
  static const mutedForeground = Color(0xFF667085);
  static const success = Color(0xFF10B981);
  static const successForeground = Color(0xFFFFFFFF);
  static const accent = Color(0xFFFFD29E);
  static const accentForeground = Color(0xFF1B1F3A);
  static const destructive = Color(0xFFEF4444);
  static const destructiveForeground = Color(0xFFFFFFFF);
  static const warning = Color(0xFFF59E0B);
  static const warningForeground = Color(0xFF1B1F3A);
  static const card = Color(0xFFFFFFFF);
  static const cardForeground = Color(0xFF0F172A);
  static const sidebar = Color(0xFFF8FAFF);
  static const sidebarForeground = Color(0xFF1F2937);
  static const sidebarPrimary = Color(0xFFEDEBFF);
  static const sidebarPrimaryForeground = Color(0xFF3B2F8C);

  // Dark theme colors (inverted/darker variants)
  static const darkBackground = Color(0xFF0F172A);
  static const darkForeground = Color(0xFFFAFBFF);
  static const darkBorder = Color(0xFF374151); // darker border
  static const darkInput = Color(0xFF1F2937);
  static const darkCard = Color(0xFF1E293B);
  static const darkCardForeground = Color(0xFFFAFBFF);
  static const darkSidebar = Color(0xFF111827);
  static const darkSidebarForeground = Color(0xFFD1D5DB);

  // Team color, use this as your brand accent if needed.
  static const team = Color(0xFF6C5CE7);
  static const teamForeground = Color(0xFFFFFFFF);
}

extension AppColorScheme on ColorScheme {
  Color get team => AppColors.team;
  Color get teamForeground => AppColors.teamForeground;
}

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryForeground,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryForeground,
      error: AppColors.destructive,
      onError: AppColors.destructiveForeground,
      surface: AppColors.card,
      onSurface: AppColors.cardForeground,
      outline: AppColors.border,
      shadow: Colors.black54,
      surfaceTint: AppColors.primary,
      inverseSurface: AppColors.sidebar,
      onInverseSurface: AppColors.sidebarForeground,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.light().textTheme
    ),
    //scaffoldBackgroundColor: const Color.fromARGB(255, 239, 236, 252),
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.card,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.input,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.team,
        foregroundColor: AppColors.teamForeground,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryForeground,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryForeground,
      error: AppColors.destructive,
      onError: AppColors.destructiveForeground,
      surface: AppColors.darkCard,
      onSurface: AppColors.darkCardForeground,
      outline: AppColors.darkBorder,
      shadow: Colors.black54,
      surfaceTint: AppColors.primary,
      inverseSurface: AppColors.darkSidebar,
      onInverseSurface: AppColors.darkSidebarForeground,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkInput,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkBorder),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.team,
        foregroundColor: AppColors.teamForeground,
      ),
    ),
  );
}
