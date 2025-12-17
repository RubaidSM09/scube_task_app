import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scube_task_app/common/app_colors.dart';
import 'package:scube_task_app/common/custom_fonts.dart';
import 'package:scube_task_app/common/widgets/custom_text_field.dart';
import 'package:scube_task_app/common/widgets/data_info/data_info_card.dart';
import 'package:scube_task_app/common/widgets/data_info/ellipse_analytics_gauge.dart';

import '../../../../common/widgets/data_info/ellipse_analytics_taka.dart';
import '../../../../common/widgets/scube_appbar.dart';
import '../controllers/data_info_controller.dart';

class DataInfoView extends GetView<DataInfoController> {
  const DataInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DataInfoController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ScubeAppbar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h,),

              Obx(() {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      color: AppColors.scubeWhite,
                      border: Border.all(
                        color: AppColors.dividerColor,
                      )
                    ),
                    padding: EdgeInsets.only(bottom: controller.isDataView.value ? 27.5.h : controller.isDataCostInfoOpen.value ? 130.h : 360.h),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.w,),
                          child: controller.isDataView.value ? Column(
                            children: [
                              SizedBox(height: 58.h,),

                              EllipseAnalyticsGauge(
                                value: controller.isTodaySelected.value ? 55.00 : 57.00,
                                sweepAngleDeg: 139.19 + (270 * 0.4514),
                              ),

                              SizedBox(height: 40.h,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 19.w,
                                children: [
                                  Row(
                                    spacing: 4.w,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.isTodaySelected.value = true;
                                        },
                                        child: Container(
                                          width: 10.w,
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.scubeWhite,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: controller.isTodaySelected.value ? AppColors.loginBackground : AppColors.dashboardText,
                                              width: 0.5.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 8.w,
                                              height: 8.h,
                                              decoration: BoxDecoration(
                                                color: controller.isTodaySelected.value ? AppColors.loginBackground : AppColors.dashboardText,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Text(
                                        'Today Data',
                                        style: controller.isTodaySelected.value ? h2.copyWith(
                                          color: AppColors.loginBackground,
                                          fontSize: 14.sp,
                                        ) : h4.copyWith(
                                          color: AppColors.dashboardText,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    spacing: 4.w,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.isTodaySelected.value = false;
                                        },
                                        child: Container(
                                          width: 10.w,
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.scubeWhite,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: !controller.isTodaySelected.value ? AppColors.loginBackground : AppColors.dashboardText,
                                              width: 0.5.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 8.w,
                                              height: 8.h,
                                              decoration: BoxDecoration(
                                                color: !controller.isTodaySelected.value ? AppColors.loginBackground : AppColors.dashboardText,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Text(
                                        'Custom Date Data',
                                        style: !controller.isTodaySelected.value ? h2.copyWith(
                                          color: AppColors.loginBackground,
                                          fontSize: 14.sp,
                                        ) : h4.copyWith(
                                          color: AppColors.dashboardText,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              controller.isTodaySelected.value ? SizedBox(height: 20.h,) : Column(
                                children: [
                                  SizedBox(height: 8.h,),
                                  
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 7.w,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        DateTimeField(hintText: 'From Date',),

                                        DateTimeField(hintText: 'To Date',),

                                        GestureDetector(
                                          onTap: () {  },
                                          child: Container(
                                            width: 34.w,
                                            height: 36.h,
                                            // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h,),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6.r),
                                              color: AppColors.searchButtonColor,
                                              border: Border.all(color: AppColors.loginBackground,),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                'assets/images/data_info/search.svg',
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 12.h,),
                                ],
                              ),

                              controller.isTodaySelected.value ? DataInfoCard(
                                energy: controller.dataInfoToday['energy'],
                                dataInfo: controller.dataInfoToday['data_info'],
                              ) : Column(
                                spacing: 12.h,
                                children: controller.dataInfoCustom.asMap().entries.map((entry) {
                                  final dataInfo = entry.value;

                                  return DataInfoCard(
                                    energy: dataInfo['energy'],
                                    dataInfo: dataInfo['data_info'],
                                  );
                                }).toList(),
                              ),

                              SizedBox(height: 20.h,),
                            ],
                          ) : Column(
                            children: [
                              SizedBox(height: 58.h,),

                              EllipseAnalyticsTaka(
                                amount: 8897455,
                                max: 12000000,
                                sweepAngleDeg: 139.19 + (270 * 0.4514),
                              ),

                              SizedBox(height: 40.h,),

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.scubeWhite,
                                  border: Border.all(
                                    color: controller.isDataCostInfoOpen.value ? AppColors.dividerColor : AppColors.scubeTransparent,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h,),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: AppColors.scubeWhite,
                                        border: Border.all(
                                          color: AppColors.dividerColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            spacing: 8.w,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/data_info/data_cost_info.svg',
                                              ),

                                              Text(
                                                'Data & Cost Info',
                                                style: h2.copyWith(
                                                  fontSize: 12.sp,
                                                  color: AppColors.appBarForeground,
                                                ),
                                              )
                                            ],
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              controller.isDataCostInfoOpen.value = !controller.isDataCostInfoOpen.value;
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(3.r),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.loginBackground,
                                              ),
                                              child: Icon(
                                                controller.isDataCostInfoOpen.value ? Icons.keyboard_double_arrow_up_outlined : Icons.keyboard_double_arrow_down_outlined,
                                                size: 18.r,
                                                color: AppColors.scubeWhite,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    if (controller.isDataCostInfoOpen.value)
                                      Column(
                                        children: [
                                          SizedBox(height: 14.h,),

                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                            child: Column(
                                              spacing: 12.h,
                                              children: controller.revenueData.asMap().entries.map((entry) {
                                                final index = entry.key;
                                                final data = entry.value;

                                                return Column(
                                                  spacing: 4.h,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Data ${index+1}',
                                                          style: h4.copyWith(
                                                            fontSize: 12.sp,
                                                            color: AppColors.dashboardText,
                                                          ),
                                                        ),

                                                        SizedBox(width: 8.w,),

                                                        Text(
                                                          ':',
                                                          style: h2.copyWith(
                                                            fontSize: 12.sp,
                                                            color: AppColors.dashboardText,
                                                          ),
                                                        ),

                                                        SizedBox(width: 4.w,),

                                                        Text(
                                                          '${data['data']} (${data['data_percentage']}%)',
                                                          style: h2.copyWith(
                                                            fontSize: 12.sp,
                                                            color: AppColors.appBarForeground,
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Cost ${index+1}',
                                                          style: h4.copyWith(
                                                            fontSize: 12.sp,
                                                            color: AppColors.dashboardText,
                                                          ),
                                                        ),

                                                        SizedBox(width: 8.w,),

                                                        Text(
                                                          ':',
                                                          style: h2.copyWith(
                                                            fontSize: 12.sp,
                                                            color: AppColors.dashboardText,
                                                          ),
                                                        ),

                                                        SizedBox(width: 4.w,),

                                                        Text(
                                                          '${data['cost']} ৳',
                                                          style: h2.copyWith(
                                                            fontSize: 12.sp,
                                                            color: AppColors.appBarForeground,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                          ),

                                          SizedBox(height: 12.h,),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          left: 24.w,
                          right: 24.w,
                          top: -20.h,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,
                              vertical: 15.h,),
                            decoration: BoxDecoration(
                              color: AppColors.scubeWhite,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: AppColors.dividerColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 8.w,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.isDataView.value = true;
                                      },
                                      child: Container(
                                        width: 14.w,
                                        height: 14.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: controller.isDataView.value ? AppColors.loginBackground : AppColors.dividerColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 10.w,
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller.isDataView.value ? AppColors.loginBackground : AppColors.dividerColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Text(
                                      'Data View',
                                      style: h2.copyWith(
                                        fontSize: 16.sp,
                                        color: controller.isDataView.value ? AppColors.loginBackground : AppColors.dashboardText,
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  spacing: 8.w,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.isDataView.value = false;
                                      },
                                      child: Container(
                                        width: 14.w,
                                        height: 14.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: !controller.isDataView.value ? AppColors.loginBackground : AppColors.dividerColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 10.w,
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: !controller.isDataView.value ? AppColors.loginBackground : AppColors.dividerColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Text(
                                      'Revenue View',
                                      style: h2.copyWith(
                                        fontSize: 16.sp,
                                        color: !controller.isDataView.value ? AppColors.loginBackground : AppColors.dashboardText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
