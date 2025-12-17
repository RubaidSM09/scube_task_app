import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/app/modules/data_info/views/data_info_view.dart';

import '../../app_colors.dart';
import '../../custom_fonts.dart';

class DataCard extends StatelessWidget {
  final String icon;
  final Color dataColor;
  final String title;
  final bool activeStatus;
  final List<double> data;

  const DataCard({
    required this.icon,
    required this.dataColor,
    required this.title,
    required this.activeStatus,
    required this.data,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                icon,
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
                          color: dataColor,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),

                      SizedBox(width: 8.w,),

                      Text(
                        title,
                        style: h3.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.appBarForeground,
                        ),
                      ),

                      SizedBox(width: 14.w,),

                      Text(
                        activeStatus ? '(Active)' : '(Inactive)',
                        style: h3.copyWith(
                          fontSize: 10.sp,
                          color: activeStatus ? AppColors.loginBackground : AppColors.inactiveColor,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    spacing: 4.h,
                    children: data.asMap().entries.map((entry) {
                      final index = entry.key;
                      final datum = entry.value;

                      return Row(
                        children: [
                          Text(
                            'Data ${index+1}      : ',
                            style: h4.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.dashboardText,
                            ),
                          ),

                          Text(
                            '$datum',
                            style: h4.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.appBarForeground,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          ),

          GestureDetector(
            onTap: () => Get.to(DataInfoView()),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 24.r,
              color: AppColors.dashboardText,
            ),
          )
        ],
      ),
    );
  }
}
