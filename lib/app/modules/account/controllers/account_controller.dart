import 'package:get/get.dart';

class AccountController extends GetxController {
  // يمكنك إضافة منطق خاص بشاشة الحساب هنا لاحقًا
  @override
  void onInit() {
    super.onInit();
    print('[Account Controller] onInit called.');
  }

  @override
  void onClose() {
    print('[Account Controller] onClose called.');
    super.onClose();
  }
}