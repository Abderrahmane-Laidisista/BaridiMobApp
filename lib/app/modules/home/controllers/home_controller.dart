import 'package:flutter/material.dart'; // لاستخدام IconData
import 'package:get/get.dart';
import 'package:baridimob_app/app/routes/app_routes.dart'; // لاستخدام المسارات

class HomeController extends GetxController {
  // بيانات الرصيد
  final currentBalance = '19,000.00'.obs; // قيمة قابلة للملاحظة للرصيد

  // قائمة الأنشطة الأخيرة (بيانات وهمية)
  final lastActivities = <Map<String, dynamic>>[
    {
      'description': 'E-Pay Operation success',
      'amount': '-500.00',
      'date': '12/03/2023',
      'type': 'debit', // خصم
    },
    {
      'description': 'Receiving 17,000 DA',
      'amount': '+17,000.00',
      'date': '10/03/2023',
      'type': 'credit', // إيداع
    },
    {
      'description': '500 DA recharge with QR Code',
      'amount': '-500.00',
      'date': '09/03/2023',
      'type': 'debit',
    },
  ].obs;

  // قائمة الإجراءات السريعة (بيانات وهمية)
  final quickActions = <Map<String, dynamic>>[
    {
      'icon': Icons.qr_code_scanner,
      'label': 'QR Scan',
      'onTap': () => Get.toNamed(Routes.TRANSFER_QR_SCAN), // افترض أن هذا المسار موجود
    },
    {
      'icon': Icons.credit_card_outlined,
      'label': 'Card Info',
      'onTap': () => Get.toNamed(Routes.ACCOUNT_CARD_SETTINGS), // افترض أن هذا المسار موجود
    },
    {
      'icon': Icons.receipt_long_outlined,
      'label': 'E-Pay Report',
      'onTap': () => Get.toNamed(Routes.HOME_EPAY_REPORT), // افترض أن هذا المسار موجود
    },
    {
      'icon': Icons.swap_horiz,
      'label': 'Transfer',
      'onTap': () => Get.toNamed(Routes.TRANSFER), // الانتقال لصفحة التحويل الرئيسية
    },
    {
      'icon': Icons.phone_android_outlined,
      'label': 'Recharge Mobile',
      'onTap': () => Get.toNamed(Routes.APPLICATIONS_RECHARGE_MOBILE), // افترض أن هذا المسار موجود
    },
    {
      'icon': Icons.more_horiz,
      'label': 'More',
      'onTap': () => Get.toNamed(Routes.APPLICATIONS), // الانتقال لصفحة التطبيقات الرئيسية
    },
  ].obs;

  // مؤشر علامة التبويب المحددة في BottomNavigationBar
  final selectedIndex = 0.obs; // 0 for Home, 1 for Transfer, 2 for Applications, 3 for Account

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    // هنا يتم التعامل مع التنقل الفعلي بين الشاشات الرئيسية لـ BottomNavigationBar
    // يمكن استخدام Get.offAllNamed أو Get.toNamed حسب حاجتك لسلوك المكدس
    switch (index) {
      case 0:
        // أنت بالفعل على شاشة Home، لذا لا تفعل شيئًا أو Get.offAllNamed(Routes.HOME);
        // ولكن لا داعي لذلك إذا كنت تستخدم PageView مع BottomNavigationBar
        break;
      case 1:
        Get.offAllNamed(Routes.TRANSFER); // الانتقال إلى شاشة التحويل
        break;
      case 2:
        Get.offAllNamed(Routes.APPLICATIONS); // الانتقال إلى شاشة التطبيقات
        break;
      case 3:
        Get.offAllNamed(Routes.ACCOUNT); // الانتقال إلى شاشة الحساب
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // يمكنك جلب البيانات من API هنا عند تهيئة الشاشة
    // fetchBalance();
    // fetchLastActivities();
  }

  // يمكنك إضافة دوال لجلب البيانات من API هنا
  // void fetchBalance() async {
  //   // استدعاء API لجلب الرصيد
  //   await Future.delayed(const Duration(seconds: 1));
  //   currentBalance.value = '25,500.50';
  // }
}