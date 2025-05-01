import 'package:flutter/material.dart';

class AppColors {
  // Private base colors
  static const Color _charcoalBlack = Color(0xFF121212);
  static const Color _darkSlate = Color(0xFF1E1E1E);
  static const Color _softWhite = Color(0xFFEDEDED);
  static const Color _coolGrey = Color(0xFFA0A0A0);
  static const Color _electricPurple = Color(0xFFA259FF);
  static const Color _neonBlue = Color(0xFF00CFFF);
  static const Color _emerald = Color(0xFF00C48C);
  static const Color _coralRed = Color(0xFFFF4C4C);

  // Public design tokens
  static const Color background = _charcoalBlack;
  static const Color surface = _darkSlate;

  static const Color textPrimary = _softWhite;
  static const Color textSecondary = _coolGrey;

  static const Color accentPrimary = _electricPurple;
  static const Color accentSecondary = _neonBlue;

  static const Color success = _emerald;
  static const Color error = _coralRed;

  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
