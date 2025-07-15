// ignore_for_file: constant_identifier_names

abstract class Routes {
  static const SPLASH = '/';
  static const ONBOARDING = '/onboarding';
  static const SIGN_IN = '/sign-in';
  static const SIGN_UP = '/sign-up';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const HOME = '/home'; // تأكد من وجودها
  static const TRANSFER = '/transfer'; // مسار لصفحة التحويل الرئيسية
  static const APPLICATIONS = '/applications'; // مسار لصفحة التطبيقات الرئيسية
  static const ACCOUNT = '/account'; // مسار لصفحة الحساب الرئيسية

  // يمكنك إضافة مسارات فرعية هنا كما في Quick Actions
  static const HOME_EPAY_REPORT = '/home/epay-report';
  static const TRANSFER_QR_SCAN = '/transfer/qr-scan';
  static const ACCOUNT_CARD_SETTINGS = '/account/card-settings';
  static const APPLICATIONS_RECHARGE_MOBILE = '/applications/recharge-mobile';

  // ... باقي المسارات
}