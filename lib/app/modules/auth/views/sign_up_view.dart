import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart'; // الألوان المستخدمة في التصميم
import 'package:baridimob_app/app/shared/constants/app_dimens.dart'; // الأبعاد والمسافات
import 'package:baridimob_app/app/shared/text_styles/app_text_styles.dart'; // أنماط الخطوط المستخدمة في التصميم
import 'package:baridimob_app/app/routes/app_routes.dart';

import '../controllers/sign_up_controller.dart'; // للمسارات

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkGray),
          onPressed: () => Get.back(), // للعودة إلى الشاشة السابقة (عادةً Sign In)
        ),
        title: Text(
          'Sign Up',
          style: AppTextStyles.title2, // استخدام نمط Title 2 من التصميم
        ),
        backgroundColor: Colors.transparent, // لجعل الـ AppBar شفافًا
        elevation: 0, // لإزالة الظل تحت الـ AppBar
        centerTitle: true, // لتوسيط العنوان
      ),
      body: SingleChildScrollView( // لجعل المحتوى قابلاً للتمرير إذا كان أكبر من الشاشة
        padding: const EdgeInsets.all(AppDimens.paddingDefault), // مسافة بادئة موحدة
        child: Form(
          key: controller.signUpFormKey, // ربط النموذج بـ GlobalKey للتحقق من الصحة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // لجعل العناصر تمتد عرضيًا
            children: [
              const SizedBox(height: 30), // مسافة علوية
              Text(
                'Create Your Account',
                style: AppTextStyles.largeTitle.copyWith(color: AppColors.darkGray), // استخدام Large Title
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Fill in your details to get started',
                style: AppTextStyles.bodyText1.copyWith(color: AppColors.mediumGray), // استخدام Body Text 1
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // مسافة قبل حقول الإدخال

              // حقل الاسم الكامل
              TextFormField(
                controller: controller.fullNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person_outline, color: AppColors.mediumGray),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // حقل رقم الهاتف
              TextFormField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.phone, // لوحة مفاتيح الأرقام
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone_outlined, color: AppColors.mediumGray),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // يمكنك إضافة تحقق أكثر تعقيدًا لرقم الهاتف هنا (مثل استخدام regex)
                  // مثال: if (!RegExp(r'^\+?[0-9]{10,14}$').hasMatch(value)) { return 'Enter a valid phone number'; }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // حقل كلمة المرور
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value, // للتحكم في إخفاء/إظهار النص
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline, color: AppColors.mediumGray),
                    suffixIcon: IconButton( // زر تبديل الرؤية
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off // أيقونة إخفاء
                            : Icons.visibility, // أيقونة إظهار
                        color: AppColors.mediumGray,
                      ),
                      onPressed: controller.togglePasswordVisibility, // استدعاء دالة التبديل
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) { // مثال: كلمة المرور لا تقل عن 6 أحرف
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // حقل تأكيد كلمة المرور
              Obx(
                () => TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.isConfirmPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    prefixIcon: const Icon(Icons.lock_outline, color: AppColors.mediumGray),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.mediumGray,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != controller.passwordController.text) { // التحقق من تطابق كلمتي المرور
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // حقل رقم البطاقة / الحساب (اختياري حسب التصميم الخاص بك)
              TextFormField(
                controller: controller.cardNumberController,
                keyboardType: TextInputType.number, // لوحة مفاتيح الأرقام
                decoration: const InputDecoration(
                  labelText: 'Card Number (Optional)',
                  hintText: 'Enter your card or account number',
                  prefixIcon: Icon(Icons.credit_card_outlined, color: AppColors.mediumGray),
                ),
                // لا يوجد validator هنا لأنه اختياري، أو يمكنك إضافة تحقق معين إذا كان مطلوبًا
              ),
              const SizedBox(height: 30),

              // زر التسجيل (Sign Up)
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null // تعطيل الزر أثناء التحميل
                      : () => controller.signUp(), // استدعاء دالة التسجيل من الـ controller
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue, // لون الزر الأساسي
                    minimumSize: const Size(double.infinity, 50), // عرض كامل وارتفاع 50
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault), // زوايا دائرية
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: AppColors.white) // مؤشر تحميل عند الضغط
                      : Text(
                          'Sign Up',
                          style: AppTextStyles.buttonText, // نمط نص الزر
                        ),
                ),
              ),
              const SizedBox(height: 20),

              // رابط "Already have an account? Sign In"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTextStyles.bodyText1,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.SIGN_IN); // الانتقال إلى شاشة تسجيل الدخول
                    },
                    child: Text(
                      'Sign In',
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