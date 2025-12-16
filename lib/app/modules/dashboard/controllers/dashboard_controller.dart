import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxList<RxBool> selectedTopTab = [true.obs, false.obs, false.obs].obs;
  RxBool isSourceSelected = true.obs;

  void selectTopTab(int index){
    for (int i=0; i<selectedTopTab.length; i++) {
      if (i == index) {
        selectedTopTab[i].value = true;
      } else {
        selectedTopTab[i].value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
