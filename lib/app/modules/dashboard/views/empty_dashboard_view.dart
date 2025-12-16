import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scube_task_app/common/app_colors.dart';
import 'package:scube_task_app/common/custom_fonts.dart';

import '../../../../common/widgets/scube_appbar.dart';

class EmptyDashboardView extends GetView {
  const EmptyDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ScubeAppbar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 12.h,
            bottom: 23.h,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.scubeWhite,
            ),
            child: Column(
              children: [
                SizedBox(height: 148.h,),

                Image.asset(
                  'assets/images/dashboard/empty_dashboard.png',
                  scale: 4,
                ),

                SizedBox(height: 12.h,),

                Text(
                  'No data is here,\nplease wait.',
                  style: h4.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.loginText2,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
