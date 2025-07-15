import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/splash/controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}