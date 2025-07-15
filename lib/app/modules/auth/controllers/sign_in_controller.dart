import 'package:baridimob_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> signIn() async {
    if (signInFormKey.currentState?.validate() ?? false) {
      isLoading.value = true; // 1. ابدأ التحميل

      // **احصل على قيم حقول الإدخال هنا قبل أي عملية await طويلة أو التنقل**
      final String username = usernameController.text;
      final String password = passwordController.text;

      // قم بمنطق تسجيل الدخول هنا (استدعاء API)
      await Future.delayed(const Duration(seconds: 2)); // 2. محاكاة استدعاء API

      // **3. قم بتحديث حالة التحميل هنا، قبل أي عملية تنقل**
      isLoading.value = false; // أوقف التحميل هنا

      if (username == 'test' && password == '12345678') {
        Get.snackbar('Success', 'Signed In Successfully!',
            backgroundColor: Colors.green, colorText: Colors.white);
        // **4. قم بالتنقل هنا بعد أن تكون جميع العمليات وتحديثات الحالة قد اكتملت**
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', 'Invalid username or password',
            backgroundColor: Colors.red, colorText: Colors.white);
        // في حالة الفشل، لا يوجد تنقل، لذا لا مشكلة في isLoading.value = false; هنا
      }
      // **لا تضع أي كود هنا بعد Get.offAllNamed**
    }
  }

//   @override
//   void onClose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.onClose();
//   }
 }