// lib/app/shared/text_styles/app_text_styles.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // تأكد من استيراد هذه الحزمة إذا لم تكن موجودة

abstract class AppTextStyles {
  // Line 1: Use GoogleFonts.lato for the Lato font
  static final TextStyle largeTitle = GoogleFonts.lato(
    fontSize: 34,
    fontWeight: FontWeight.w700, // Bold
  ); //

  static final TextStyle title1 = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w600, // Semibold
  ); //

  static final TextStyle title2 = GoogleFonts.lato(
    fontSize: 22,
    fontWeight: FontWeight.w600, // Semibold
  ); //

  // **أضف هذه الأنماط الجديدة**
  static final TextStyle title3 = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w500, // Medium (افترضت Medium لأن التصميم لا يحدد Semibold/Medium لـ Title 3)
  );

  static final TextStyle headline = GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w500, // Medium
  ); //

  static final TextStyle callout = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
  ); //

  static final TextStyle subhead = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w600, // Semibold
  ); //

  static final TextStyle bodyText1 = GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w400, // Regular (افترضت Regular لـ Body Text 1)
  );

  static final TextStyle bodyText2 = GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w500, // Medium (افترضت Medium لـ Body Text 2)
  );

  static final TextStyle footnote = GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w500, // Medium
  ); //

  // **أضف هذه الأنماط الجديدة**
  static final TextStyle caption1 = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w500, // Medium
  );

  static final TextStyle caption2 = GoogleFonts.lato(
    fontSize: 11,
    fontWeight: FontWeight.w400, // Regular
  );

  static final TextStyle caption3 = GoogleFonts.lato(
    fontSize: 10,
    fontWeight: FontWeight.w400, // Regular
  ); //

  static final TextStyle buttonText = GoogleFonts.lato(
    fontSize: 17, // افتراضي لحجم زر
    fontWeight: FontWeight.w600, // Semibold
  );
}