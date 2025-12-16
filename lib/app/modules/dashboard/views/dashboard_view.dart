import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scube_task_app/common/app_colors.dart';
import 'package:scube_task_app/common/custom_fonts.dart';
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
