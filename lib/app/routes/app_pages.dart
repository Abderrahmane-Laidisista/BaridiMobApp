import 'package:baridimob_app/app/modules/auth/bindings/sign_in_binding.dart';
import 'package:baridimob_app/app/modules/auth/bindings/sign_up_binding.dart';
import 'package:baridimob_app/app/modules/auth/views/sign_up_view.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/splash/views/splash_view.dart';
import 'package:baridimob_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:baridimob_app/app/modules/onboarding/views/onboarding_view.dart';
import 'package:baridimob_app/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:baridimob_app/app/modules/auth/views/sign_in_view.dart';
import 'package:baridimob_app/app/modules/home/views/home_view.dart';
import 'package:baridimob_app/app/modules/home/bindings/home_binding.dart';

// **تأكد من استيراد ملفات الشاشات الجديدة هنا**
import 'package:baridimob_app/app/modules/transfer/views/transfer_view.dart';
import 'package:baridimob_app/app/modules/transfer/bindings/transfer_binding.dart';
import 'package:baridimob_app/app/modules/applications/views/applications_view.dart';
import 'package:baridimob_app/app/modules/applications/bindings/applications_binding.dart';
import 'package:baridimob_app/app/modules/account/views/account_view.dart';
import 'package:baridimob_app/app/modules/account/bindings/account_binding.dart';

import 'package:baridimob_app/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInView(),
      binding: SignINBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // **أضف الـ GetPage للشاشات الرئيسية الأخرى للـ Bottom Navigation Bar هنا**
    GetPage(
      name: Routes.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: Routes.APPLICATIONS,
      page: () => const ApplicationsView(),
      binding: ApplicationsBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
  ];
}