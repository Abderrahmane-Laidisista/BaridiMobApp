
// lib/app/modules/splash/views/splash_view.dart
import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // لا تستورده حاليا إذا استخدمت MaterialApp
import 'package:baridimob_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart';

class SplashView extends StatefulWidget { // غيرها إلى StatefulWidget
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // قم بتهيئة Controller يدويًا هنا للاختبار
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.onInit(); // استدعاء onInit يدويًا
  }

  @override
  void dispose() {
    controller.onClose(); // استدعاء onClose يدويًا
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}