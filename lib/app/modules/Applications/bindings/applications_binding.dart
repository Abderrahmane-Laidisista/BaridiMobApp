import 'package:baridimob_app/app/modules/Applications/controllers/applications_controller.dart';
import 'package:get/get.dart';


class ApplicationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationsController>(() => ApplicationsController());
  }
}