import 'package:get/get.dart';

import '../../../../common/app_colors.dart';

class DataInfoController extends GetxController {
  RxBool isDataView = true.obs;
  RxBool isTodaySelected = true.obs;
  RxBool isDataCostInfoOpen = true.obs;

  Map<String, dynamic> dataInfoToday = {
    'energy': 5.53,
    'data_info': [
      {
        'data_color': AppColors.loginBackground,
        'name': 'Data A',
        'data': 2798.50,
        'data_percentage': 29.53,
        'cost': 35689,
      },
      {
        'data_color': AppColors.dataBColor,
        'name': 'Data B',
        'data': 72598.50,
        'data_percentage': 35.39,
        'cost': 5259689,
      },
      {
        'data_color': AppColors.dataCColor,
        'name': 'Data C',
        'data': 6598.36,
        'data_percentage': 83.90,
        'cost': 5698756,
      },
      {
        'data_color': AppColors.dataDColor,
        'name': 'Data D',
        'data': 6598.26,
        'data_percentage': 36.59,
        'cost': 356987,
      },
    ],
  };

  List<Map<String, dynamic>> dataInfoCustom = [
    {
      'energy': 20.05,
      'data_info': [
        {
          'data_color': AppColors.loginBackground,
          'name': 'Data A',
          'data': 2798.50,
          'data_percentage': 29.53,
          'cost': 35689,
        },
        {
          'data_color': AppColors.dataBColor,
          'name': 'Data B',
          'data': 72598.50,
          'data_percentage': 35.39,
          'cost': 5259689,
        },
        {
          'data_color': AppColors.dataCColor,
          'name': 'Data C',
          'data': 6598.36,
          'data_percentage': 83.90,
          'cost': 5698756,
        },
        {
          'data_color': AppColors.dataDColor,
          'name': 'Data D',
          'data': 6598.26,
          'data_percentage': 36.59,
          'cost': 356987,
        },
      ],
    },
    {
      'energy': 5.53,
      'data_info': [
        {
          'data_color': AppColors.loginBackground,
          'name': 'Data A',
          'data': 2798.50,
          'data_percentage': 29.53,
          'cost': 35689,
        },
        {
          'data_color': AppColors.dataBColor,
          'name': 'Data B',
          'data': 72598.50,
          'data_percentage': 35.39,
          'cost': 5259689,
        },
        {
          'data_color': AppColors.dataCColor,
          'name': 'Data C',
          'data': 6598.36,
          'data_percentage': 83.90,
          'cost': 5698756,
        },
        {
          'data_color': AppColors.dataDColor,
          'name': 'Data D',
          'data': 6598.26,
          'data_percentage': 36.59,
          'cost': 356987,
        },
      ],
    },
  ];

  List<Map<String, dynamic>> revenueData = [
    {
      'data': 2798.50,
      'data_percentage': 29.53,
      'cost': 35689,
    },
    {
      'data': 2798.50,
      'data_percentage': 29.53,
      'cost': 35689,
    },
    {
      'data': 2798.50,
      'data_percentage': 29.53,
      'cost': 35689,
    },
    {
      'data': 2798.50,
      'data_percentage': 29.53,
      'cost': 35689,
    },
  ];

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
