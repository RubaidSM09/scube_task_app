import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:scube_task_app/common/app_colors.dart';
import 'package:scube_task_app/common/custom_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final RxBool isObscureText;
  final String suffixIcon;

  const CustomTextField({
    required this.hintText,
    required this.isObscureText,
    this.suffixIcon = '',
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 20.h
        ),

        filled: true,
        fillColor: AppColors.scubeWhite,

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.loginBorder,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.loginBorder,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.loginBorder,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),

        hintText: hintText,
        hintStyle: h4.copyWith(
          fontSize: 14.sp,
          color: AppColors.loginText2,
        ),

        suffixIcon: suffixIcon != '' ? GestureDetector(
          onTap: () {
            isObscureText.value = !isObscureText.value;
          },
          child: SizedBox(
            width: 18.w,
            height: 18.h,
            child: Image.asset(suffixIcon, scale: 4,),
          ),
        ) : null,
      ),

      obscureText: isObscureText.value,
    );
  }
}


class DateTimeField extends StatelessWidget {
  final String hintText;

  const DateTimeField({
    required this.hintText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127.w,
      height: 36.h,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 11.h
          ),

          filled: true,
          fillColor: AppColors.scubeWhite,

          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.loginBorder,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.loginBorder,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.loginBorder,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),

          hintText: hintText,
          hintStyle: h4.copyWith(
            fontSize: 12.sp,
            color: AppColors.dashboardText,
          ),

          suffixIcon: Image.asset('assets/images/data_info/calendar.png', scale: 4,),
        ),
      ),
    );
  }
}
