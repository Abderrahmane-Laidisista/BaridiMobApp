import 'package:flutter/material.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart';
import 'package:baridimob_app/app/shared/text_styles/app_text_styles.dart';

import '../constants/app_dimens.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlue,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.accentYellow,
      surface: AppColors.white,
      background: AppColors.white,
      error: Colors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.darkGray,
      onSurface: AppColors.darkGray,
      onBackground: AppColors.darkGray,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.white, // خلفية الشريط العلوي
      elevation: 0, // إزالة الظل
      iconTheme: const IconThemeData(color: AppColors.darkGray), // لون الأيقونات
      titleTextStyle: AppTextStyles.headline.copyWith(color: AppColors.darkGray), // نمط عنوان الشريط
      toolbarTextStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.darkGray),
    ),
    textTheme: TextTheme(
      // استخدم أنماطك المخصصة هنا
      displayLarge: AppTextStyles.largeTitle,
      displayMedium: AppTextStyles.title1,
      displaySmall: AppTextStyles.title2,
      headlineMedium: AppTextStyles.headline,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      labelLarge: AppTextStyles.buttonText, // غالباً للـ ElevatedButton
      // يمكنك تعيين أنماط أخرى هنا
    ).apply(
      bodyColor: AppColors.darkGray, // لون النص الافتراضي للجسم
      displayColor: AppColors.darkGray, // لون النص الافتراضي للعناوين
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGray.withOpacity(0.3), // لون خلفية حقل الإدخال
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none, // إزالة الحدود الافتراضية
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2), // حدود عند التركيز
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      labelStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.mediumGray),
      hintStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.mediumGray.withOpacity(0.7)),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue, // لون زر الـ Elevated Button الافتراضي
        foregroundColor: AppColors.white, // لون النص داخل الزر
        textStyle: AppTextStyles.buttonText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
        ),
        minimumSize: const Size(double.infinity, 50), // حجم افتراضي للأزرار الرئيسية
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryBlue, // لون النص في TextButton
        textStyle: AppTextStyles.bodyText2,
      ),
    ),
    // يمكنك إضافة المزيد من السمات هنا (مثل BottomNavigationBarTheme)
  );
}