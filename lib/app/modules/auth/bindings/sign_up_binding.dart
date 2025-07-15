import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart'; // تأكد من المسار الصحيح

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut تهيئ الـ Controller فقط عندما يتم استخدامه لأول مرة
    // وهذا يضمن كفاءة في استخدام الذاكرة
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}