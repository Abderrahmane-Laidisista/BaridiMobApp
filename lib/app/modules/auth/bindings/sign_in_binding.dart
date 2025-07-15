import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignINBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    // تأكد أن هناك شيئاً هنا، وليس فارغاً تماماً
  }
}