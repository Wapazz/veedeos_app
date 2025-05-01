import 'package:flutter/material.dart';
import 'package:veedeos_app/design/colors.dart';
import 'package:veedeos_app/design/typography.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.accentPrimary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accentPrimary,
      secondary: AppColors.accentSecondary,
      surface: AppColors.surface,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      onSurface: AppColors.textSecondary,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTypography.headline1,
      headlineMedium: AppTypography.headline2,
      bodyLarge: AppTypography.body1,
      bodyMedium: AppTypography.body2,
      labelSmall: AppTypography.caption,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentPrimary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.accentPrimary,
      labelStyle: TextStyle(color: AppColors.textPrimary),
      secondaryLabelStyle: TextStyle(color: AppColors.textPrimary),
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
