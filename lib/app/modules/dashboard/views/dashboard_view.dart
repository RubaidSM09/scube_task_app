import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scube_task_app/common/app_colors.dart';
import 'package:scube_task_app/common/custom_fonts.dart';
import 'package:scube_task_app/common/widgets/dashboard/bottom_card.dart';
import 'package:scube_task_app/common/widgets/dashboard/data_card.dart';
import 'package:scube_task_app/common/widgets/dashboard/top_tab.dart';
import 'package:scube_task_app/common/widgets/scube_appbar.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ScubeAppbar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.h,),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.scubeWhite,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.containerBorder,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(11.r),
                            topLeft: Radius.circular(11.r),
                          ),
                          border: Border.all(
                            color: AppColors.containerBorder,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TopTab(
                              index: 0,
                              text: 'Summery',
                              isSelected: controller.selectedTopTab[0],
                              select: controller.selectTopTab,
                            ),

                            TopTab(
                              index: 1,
                              text: 'SLD',
                              isSelected: controller.selectedTopTab[1],
                              select: controller.selectTopTab,
                            ),

                            TopTab(
                              index: 2,
                              text: 'Data',
                              isSelected: controller.selectedTopTab[2],
                              select: controller.selectTopTab,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h,),

                      Text(
                        'Electricity',
                        style: h2.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.dashboardText2,
                        ),
                      ),

                      SizedBox(height: 8.h,),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w,),
                        child: Divider(color: AppColors.dashboardText2,),
                      ),

                      SizedBox(height: 14.h,),

                      Container(
                        padding: EdgeInsets.all((150*(1-0.7286)/2).r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.dashboardCircularContainerBlue,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(35.645.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.scubeWhite,
                          ),
                          child: Column(
                            spacing: 4.h,
                            children: [
                              Text(
                                'Total Power',
                                style: h4.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.appBarForeground,
                                ),
                              ),

                              Text(
                                '5.53 kw',
                                style: h2.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.appBarForeground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 7.h,),

                      Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.dashboardContainerBg.withOpacity(
                                0.2),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.isSourceSelected.value = true;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 31.w, vertical: 6.h,),
                                  decoration: BoxDecoration(
                                    color: controller.isSourceSelected.value
                                        ? AppColors.loginBackground
                                        : AppColors.scubeTransparent,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Text(
                                    'Source',
                                    style: controller.isSourceSelected.value ? h2.copyWith(
                                      color: AppColors.scubeWhite,
                                      fontSize: 16.sp,
                                    ) : h4.copyWith(
                                      color: AppColors.dashboardText,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  controller.isSourceSelected.value = false;
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 31.w, vertical: 6.h,),
                                  decoration: BoxDecoration(
                                    color: !controller.isSourceSelected.value
                                        ? AppColors.loginBackground
                                        : AppColors.scubeTransparent,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Text(
                                    'Load',
                                    style: !controller.isSourceSelected.value ? h2.copyWith(
                                      color: AppColors.scubeWhite,
                                      fontSize: 16.sp,
                                    ) : h4.copyWith(
                                      color: AppColors.dashboardText,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      SizedBox(height: 4.h,),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w,),
                        child: Divider(color: AppColors.dividerColor, height: 2.h,),
                      ),

                      SizedBox(height: 8.h,),

                      Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 4.w,),
                        child: Row(
                          spacing: 4.w,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 268.h,
                                    child: SingleChildScrollView(
                                      controller: controller.scrollController,
                                      child: Column(
                                        spacing: 8.h,
                                        children: [
                                          Column(
                                            spacing: 8.h,
                                            children: controller.data.map((datum) {
                                              return DataCard(
                                                icon: datum['icon'],
                                                dataColor: datum['dataColor'],
                                                title: datum['title'],
                                                activeStatus: datum['activeStatus'],
                                                data: datum['data'],
                                              );
                                            }).toList(),
                                            /*children: [
                                              DataCard(
                                                icon: 'assets/images/dashboard/solar_cell.png',
                                                dataColor: AppColors.dashboardData1,
                                                title: 'Data View',
                                                activeStatus: true,
                                                data: [55505.63, 58805.63],
                                              ),
                                            ],*/
                                          ),

                                          Container(
                                            padding: EdgeInsets.all(8.r),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4.r),
                                              color: AppColors.dashboardContainerBg2,
                                              border: Border.all(
                                                color: AppColors.dividerColor,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  spacing: 12.w,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/dashboard/solar_cell.png',
                                                      scale: 4,
                                                    ),

                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      spacing: 4.h,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.all(6.r),
                                                              decoration: BoxDecoration(
                                                                color: AppColors.dashboardData1,
                                                                borderRadius: BorderRadius.circular(2.r),
                                                              ),
                                                            ),

                                                            SizedBox(width: 8.w,),

                                                            Text(
                                                              'Total Solar',
                                                              style: h3.copyWith(
                                                                fontSize: 14.sp,
                                                                color: AppColors.appBarForeground,
                                                              ),
                                                            ),

                                                            SizedBox(width: 14.w,),

                                                            Text(
                                                              '(Active)',
                                                              style: h3.copyWith(
                                                                fontSize: 10.sp,
                                                                color: AppColors.loginBackground,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        Column(
                                                          spacing: 4.h,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Live Power      : ',
                                                                  style: h4.copyWith(
                                                                    fontSize: 12.sp,
                                                                    color: AppColors.dashboardText,
                                                                  ),
                                                                ),

                                                                Text(
                                                                  '55505.63 kW',
                                                                  style: h4.copyWith(
                                                                    fontSize: 12.sp,
                                                                    color: AppColors.appBarForeground,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Today Energy : ',
                                                                  style: h4.copyWith(
                                                                    fontSize: 12.sp,
                                                                    color: AppColors.dashboardText,
                                                                  ),
                                                                ),

                                                                Text(
                                                                  '58805.63 kWh',
                                                                  style: h4.copyWith(
                                                                    fontSize: 12.sp,
                                                                    color: AppColors.appBarForeground,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),

                                                GestureDetector(
                                                  onTap: () {  },
                                                  child: Icon(
                                                    Icons.arrow_forward_ios_outlined,
                                                    size: 24.r,
                                                    color: AppColors.dashboardText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    left: 0.w,
                                    right: 0.w,
                                    bottom: 0.h,
                                    child: Container(
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.r),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.dashboardGradientColor.withOpacity(0.6),
                                            AppColors.dashboardGradientColor2.withOpacity(0),
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Obx(() {
                              const double trackHeight = 222;
                              const double thumbHeight = 33;

                              final double scrollPercent = controller.scrollOffset.value/controller.maxScrollExtent.value;

                              final double topPosition = (trackHeight-thumbHeight)*scrollPercent.clamp(0.0, 1.0);

                              return Container(
                                width: 4.w,
                                height: trackHeight.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: AppColors.containerBorder,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: topPosition.h,
                                      child: Container(
                                        width: 4.w,
                                        height: thumbHeight.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.r),
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColors.dashboardGradientColor3,
                                              AppColors.dashboardGradientColor4,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h,),
                    ],
                  ),
                ),

                SizedBox(height: 20.h,),

                Wrap(
                  spacing: 16.w,
                  runSpacing: 8.h,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    BottomCard(
                      icon: 'assets/images/dashboard/analysis_pro.png',
                      title: 'Analysis Pro',
                    ),

                    BottomCard(
                      icon: 'assets/images/dashboard/generator.png',
                      title: 'G. Generator',
                    ),

                    BottomCard(
                      icon: 'assets/images/dashboard/plant_summery.png',
                      title: 'Plant Summery',
                    ),

                    BottomCard(
                      icon: 'assets/images/dashboard/natural_gas.png',
                      title: 'Natural Gas',
                    ),

                    BottomCard(
                      icon: 'assets/images/dashboard/generator.png',
                      title: 'D. Generator',
                    ),

                    BottomCard(
                      icon: 'assets/images/dashboard/water_process.png',
                      title: 'Water Process',
                    ),
                  ],
                ),

                SizedBox(height: 24.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
