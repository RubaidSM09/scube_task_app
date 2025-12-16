import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';
import '../../custom_fonts.dart';

class TopTab extends StatelessWidget {
  final int index;
  final String text;
  final RxBool isSelected;
  final void Function(int)? select;

  const TopTab({
    required this.index,
    required this.text,
    required this.isSelected,
    required this.select,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => select?.call(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 11.h,),
          decoration: BoxDecoration(
            color: isSelected.value ? AppColors.loginBackground : AppColors.scubeTransparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: Text(
            text,
            style: isSelected.value ? h1.copyWith(
              fontSize: 14.sp,
              color: AppColors.scubeWhite,
            ) : h4.copyWith(
              fontSize: 14.sp,
              color: AppColors.dashboardText,
            ),
          ),
        ),
      );
    });
  }
}
