import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/account/controllers/account_controller.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}