import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final currentPage = 0.obs; // لمراقبة الصفحة الحالية

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void getStarted() {
    // عند النقر على "Get Started"، انتقل إلى شاشة تسجيل الدخول/التسجيل
    Get.offAllNamed(Routes.SIGN_IN); // أو Routes.SIGN_UP حسب التدفق
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}