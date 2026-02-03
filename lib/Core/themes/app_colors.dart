// lib/core/themes/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBg = Color(0xFFFDF9E8); // Cream
  static const Color secondaryBg = Color(0xFFFAE0C9); // Peach
  static const Color accent1 = Color(0xFFFFB598); // Coral
  static const Color accent2 = Color(0xFFFFF8CC); // Light Yellow
  static const Color black = Color(0xFF000000); // Black

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textHint = Color(0xFF999999);

  // Status Colors
  static const Color success = Color(0xFF34C759);
  static const Color error = Color(0xFFFF3B30);
  static const Color warning = Color(0xFFFF9500);
  static const Color info = Color(0xFF007AFF);

  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent1, secondaryBg],
  );
}
