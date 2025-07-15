// lib/app/shared/constants/app_colors.dart

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryBlue = Color.fromARGB(255, 3, 134, 195); //
  static const Color primaryYellow = Color(0xFFF2CE34); //

  // **أضف هذا اللون الجديد**
  static const Color accentYellow = Color(0xFFFFC107); // قيمة افتراضية للـ accentYellow (Material Yellow)

  static const Color darkGray = Color(0xFF48484A); //
  static const Color mediumGray = Color(0xFFAEAEB2); //
  static const Color lightGray = Color(0xFFD1D1D6); // (هذا اللون تم افتراضه بناءً على التصميم)
  static const Color white = Color(0xFFFFFFFF); //
  static const Color black = Color(0xFF1C1C1E); //

  static const Color redAccent = Colors.redAccent;
  static const Color greenAccent = Colors.greenAccent;

  // يمكنك إضافة المزيد من الألوان هنا حسب الحاجة
}