import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/routes/app_routes.dart'; // تأكد من المسار الصحيح

class SignUpController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  Future<void> signUp() async {
    if (signUpFormKey.currentState?.validate() ?? false) {
      isLoading.value = true; // ابدأ التحميل

      // **احصل على قيم حقول الإدخال هنا قبل أي عملية await طويلة أو التنقل**
      // (هذه خطوة جيدة إذا كنت ستستخدم هذه القيم بعد الـ await)
      final String enteredFullName = fullNameController.text;
      final String enteredPassword = passwordController.text;
      // ... وهكذا لباقي الحقول

      // محاكاة استدعاء API وهمي لمدة 2 ثانية
      await Future.delayed(const Duration(seconds: 2));

      // **قم بتحديث حالة التحميل هنا، قبل أي عملية تنقل**
      isLoading.value = false; // أوقف التحميل هنا

      // مثال بسيط على التحقق من نجاح/فشل التسجيل
      if (enteredFullName.isNotEmpty && enteredPassword.length >= 6) {
        Get.snackbar(
          'Success',
          'Account created successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // **قم بالتنقل هنا بعد أن تكون جميع العمليات وتحديثات الحالة قد اكتملت**
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(
          'Error',
          'Registration failed. Please check your details.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      // لا تضع أي كود هنا بعد Get.offAllNamed
    }
  }

  // @override
  // void onClose() {
  //   // التخلص من وحدات التحكم لتحرير الذاكرة عند إغلاق الـ Controller
  //   fullNameController.dispose();
  //   phoneNumberController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //   cardNumberController.dispose();
  //   super.onClose();
  // }
}