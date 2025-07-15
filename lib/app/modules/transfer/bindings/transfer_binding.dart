import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/transfer/controllers/transfer_controller.dart';

class TransferBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferController>(() => TransferController());
  }
}