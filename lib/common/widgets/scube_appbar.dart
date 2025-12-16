import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../custom_fonts.dart';

class ScubeAppbar extends StatelessWidget {
  const ScubeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w,),
      decoration: BoxDecoration(
        color: AppColors.scubeWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.scubeBlack.withOpacity(0.05),
            blurRadius: 14.r,
            offset: Offset(0.w, 4.h),
          ),
        ],
      ),
      child: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/images/appbar/arrow-left.svg',
              ),
            ),

            Text(
              'SCM',
              style: h3.copyWith(
                fontSize: 16.sp,
              ),
            ),

            GestureDetector(
              onTap: () {  },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/images/appbar/bell.svg',
                  ),

                  Positioned(
                    left: 8.5.w,
                    child: Container(
                      padding: EdgeInsets.all(4.5.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFDF2222),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
