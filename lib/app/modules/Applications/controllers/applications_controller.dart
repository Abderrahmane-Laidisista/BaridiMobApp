import 'package:get/get.dart';

class ApplicationsController extends GetxController {
  // يمكنك إضافة منطق خاص بشاشة التطبيقات هنا لاحقًا
  @override
  void onInit() {
    super.onInit();
    print('[Applications Controller] onInit called.');
  }

  @override
  void onClose() {
    print('[Applications Controller] onClose called.');
    super.onClose();
  }
}