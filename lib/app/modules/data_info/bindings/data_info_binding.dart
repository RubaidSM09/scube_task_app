import 'package:get/get.dart';

import '../controllers/data_info_controller.dart';

class DataInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataInfoController>(
      () => DataInfoController(),
    );
  }
}
