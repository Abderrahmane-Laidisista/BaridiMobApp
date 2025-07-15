// lib/app/modules/splash/controllers/splash_controller.dart
import 'package:get/get.dart';
import 'package:baridimob_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('[SPLASH CONTROLLER] onInit called.'); // A: تأكد من ظهور هذه الرسالة
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    print('[SPLASH CONTROLLER] _navigateToNextScreen called. Waiting 3 seconds...'); // B: تأكد من ظهور هذه الرسالة
    await Future.delayed(const Duration(seconds: 3));
    print('[SPLASH CONTROLLER] Delay finished. Attempting to navigate to Onboarding.'); // C: تأكد من ظهور هذه الرسالة

    Get.offAllNamed(Routes.ONBOARDING);
    // إذا كنت تنتقل مباشرة إلى شاشة تسجيل الدخول بدلاً من Onboarding
    // Get.offAllNamed(Routes.SIGN_IN);

    print('[SPLASH CONTROLLER] Navigation command issued.'); // D: تأكد من ظهور هذه الرسالة
  }
}