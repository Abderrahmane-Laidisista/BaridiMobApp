import 'package:get/get.dart';

class TransferController extends GetxController {
  // يمكنك إضافة منطق خاص بشاشة التحويل هنا لاحقًا
  @override
  void onInit() {
    super.onInit();
    print('[Transfer Controller] onInit called.');
  }

  @override
  void onClose() {
    print('[Transfer Controller] onClose called.');
    super.onClose();
  }
}