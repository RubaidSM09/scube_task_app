import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/app/modules/dashboard/views/empty_dashboard_view.dart';

import '../../app_colors.dart';
import '../../custom_fonts.dart';

class BottomCard extends StatelessWidget {
  final String icon;
  final String title;

  const BottomCard({
    required this.icon,
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(EmptyDashboardView()),
      child: Container(
        width: 148.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: AppColors.scubeWhite,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.containerBorder,
          ),
        ),
        child: Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              scale: 4,
            ),

            Text(
                title,
                style: h2.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.dashboardText,
                )
            )
          ],
        ),
      ),
    );
  }
}
