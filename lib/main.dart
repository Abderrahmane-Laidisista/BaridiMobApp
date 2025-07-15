import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // لاستخدام SystemChrome

// استيراد مسارات التطبيق والـ Theme
import 'package:baridimob_app/app/routes/app_pages.dart';
import 'package:baridimob_app/app/shared/themes/app_theme.dart';

void main() {
  // للتأكد من تهيئة Flutter Bindings قبل أي استخدام
  WidgetsFlutterBinding.ensureInitialized();

  // لتعيين اتجاه العرض الرأسي فقط (اختياري، ولكن جيد لتطبيقات الهاتف)
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BaridiMob App",
      initialRoute: AppPages.INITIAL, // يبدأ من المسار الأولي المحدد في AppPages
      getPages: AppPages.routes, // قائمة جميع صفحات GetX
      theme: AppTheme.lightTheme, // تطبيق السمة التي عرفتها
      debugShowCheckedModeBanner: false, // إخفاء لافتة "DEBUG"
      builder: (context, child) {
        // يمكنك هنا إضافة أي Widget يحيط بجميع الشاشات
        // مثل AlertDialogs المخصصة أو Loading Overlays
        return Directionality(
          textDirection: TextDirection.ltr, // أو TextDirection.rtl إذا كان التطبيق عربي بشكل كامل
          child: child!,
        );
      },
    );
  }
}