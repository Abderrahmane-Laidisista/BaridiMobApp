import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:baridimob_app/app/modules/onboarding/widgets/onboarding_page.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart';
import 'package:baridimob_app/app/shared/constants/app_dimens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // أضف هذه الحزمة إلى pubspec.yaml

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: const [
              OnboardingPage(
                imagePath: 'assets/images/onboarding1.png', // استبدل بمسارات صورك
                title: 'Transfer Money',
                description: 'Easily send and receive money from your account to anyone.',
              ),
              OnboardingPage(
                imagePath: 'assets/images/onboarding2.png',
                title: 'View Statistics',
                description: 'Keep track of your financial activities with detailed statistics.',
              ),
              OnboardingPage(
                imagePath: 'assets/images/onboarding3.png',
                title: 'Pay Bills Online',
                description: 'Pay all your bills conveniently from the comfort of your home.',
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.paddingDefault * 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3, // عدد صفحات Onboarding
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryBlue,
                      dotColor: AppColors.lightGray,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 4,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.currentPage.value == 2
                          ? () => controller.getStarted()
                          : () {
                              controller.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        minimumSize: Size(Get.width * 0.8, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
                        ),
                      ),
                      child: Text(
                        controller.currentPage.value == 2 ? 'Get Started' : 'Next',
                        style: const TextStyle(color: AppColors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}