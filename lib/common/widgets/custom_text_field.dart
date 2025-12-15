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
            child: SvgPicture.asset(suffixIcon, fit: BoxFit.scaleDown,),
          ),
        ) : null,
      ),

      obscureText: isObscureText.value,
    );
  }
}
