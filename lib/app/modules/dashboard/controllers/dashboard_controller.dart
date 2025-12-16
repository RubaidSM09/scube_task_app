import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/app_colors.dart';

class DashboardController extends GetxController {
  RxList<RxBool> selectedTopTab = [true.obs, false.obs, false.obs].obs;
  RxBool isSourceSelected = true.obs;

  final ScrollController scrollController = ScrollController();
  RxDouble scrollOffset = 0.0.obs;
  RxDouble maxScrollExtent = 1.0.obs;

  List<Map<String,dynamic>> data = [
    {
      'icon': 'assets/images/dashboard/solar_cell.png',
      'dataColor': AppColors.dashboardData1,
      'title': 'Data View',
      'activeStatus': true,
      'data': [55505.63, 58805.63],
    },
    {
      'icon': 'assets/images/dashboard/electric_station.png',
      'dataColor': AppColors.dashboardData2,
      'title': 'Data Type 2',
      'activeStatus': true,
      'data': [55505.63, 58805.63],
    },
    {
      'icon': 'assets/images/dashboard/power_station.png',
      'dataColor': AppColors.dashboardData1,
      'title': 'Data Type 3',
      'activeStatus': false,
      'data': [55505.63, 58805.63],
    },
  ];

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
    scrollController.addListener(() {
      scrollOffset.value = scrollController.offset;
      maxScrollExtent.value = scrollController.position.maxScrollExtent == 0 ? 1 : scrollController.position.maxScrollExtent;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
