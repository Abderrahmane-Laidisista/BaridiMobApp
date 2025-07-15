import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ستحتاجها لاستخدام Get.height
import 'package:baridimob_app/app/shared/constants/app_colors.dart';
import 'package:baridimob_app/app/shared/constants/app_dimens.dart';
import 'package:baridimob_app/app/shared/text_styles/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingDefault * 2), // مسافة بادئة حول المحتوى
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الصورة
          Image.asset(
            imagePath,
            height: Get.height * 0.3, // حجم الصورة بناءً على ارتفاع الشاشة
            fit: BoxFit.contain, // تأكد من تناسب الصورة
          ),
          const SizedBox(height: 40), // مسافة بعد الصورة
          // العنوان
          Text(
            title,
            style: AppTextStyles.title1.copyWith(color: AppColors.primaryBlue), // استخدام نمط الخط
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20), // مسافة بعد العنوان
          // الوصف
          Text(
            description,
            style: AppTextStyles.bodyText1.copyWith(color: AppColors.mediumGray), // استخدام نمط الخط
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}