import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:baridimob_app/app/shared/constants/app_colors.dart';
import 'package:baridimob_app/app/shared/constants/app_dimens.dart';
import 'package:baridimob_app/app/shared/text_styles/app_text_styles.dart';


import '../../../routes/app_routes.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkGray),
          onPressed: () => Get.back(), // للعودة إلى الشاشة السابقة
        ),
        title: Text(
          'Sign In',
          style: AppTextStyles.title2, // استخدم نمط مناسب للعنوان
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView( // استخدم SingleChildScrollView لتجنب تجاوز المحتوى
        padding: const EdgeInsets.all(AppDimens.paddingDefault),
        child: Form(
          key: controller.signInFormKey, // مفتاح الـ Form للتحقق من الصحة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Text(
                'Welcome Back!',
                style: AppTextStyles.largeTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Sign in to continue',
                style: AppTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: controller.usernameController,
                keyboardType: TextInputType.emailAddress, // أو TextInputType.text
                decoration: InputDecoration(
                  labelText: 'Username or Email',
                  hintText: 'Enter your username or email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username or email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.mediumGray,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Get.toNamed(Routes.FORGOT_PASSWORD); // للانتقال لشاشة استعادة كلمة المرور
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.bodyText2.copyWith(color: AppColors.primaryBlue),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.signIn(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: AppColors.white)
                      : Text(
                          'Sign In',
                          style: AppTextStyles.buttonText, // يجب تعريف هذا النمط
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppTextStyles.bodyText1,
                  ),
                  TextButton(
                    onPressed: () {
                       Get.toNamed(Routes.SIGN_UP); // للانتقال لشاشة التسجيل
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.bodyText1.copyWith(color: AppColors.primaryBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}