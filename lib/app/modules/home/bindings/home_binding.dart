import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/home/controllers/home_controller.dart'; // تأكد من المسار الصحيح

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}