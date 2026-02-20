import 'package:flutter/material.dart';

class AppTextStyles {
  static TextTheme textTheme(TextTheme base) {
    return base.copyWith(
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      bodyMedium: base.bodyMedium?.copyWith(height: 1.3),
      bodySmall: base.bodySmall?.copyWith(
        height: 1.3,
        color: const Color(0xFF6B7280),
      ),
    );
  }
}
