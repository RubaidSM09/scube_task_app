import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../../custom_fonts.dart';

class DataInfoCard extends StatelessWidget {
  final double energy;
  final List<Map<String, dynamic>> dataInfo;

  const DataInfoCard({
    required this.energy,
    required this.dataInfo,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        top: 20.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.scubeWhite,
        border: Border.all(
          color: AppColors.dividerColor,
        ),
      ),
      child: Column(
        spacing: 20.h,
        children: [
          Row(
            spacing: 36.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Energy Chart',
                style: h2.copyWith(
                  color: AppColors.appBarForeground,
                  fontSize: 14.sp,
                ),
              ),

              Text(
                '$energy kw',
                style: h2.copyWith(
                  color: AppColors.appBarForeground,
                  fontSize: 32.sp,
                ),
              ),
            ],
          ),

          Column(
            spacing: 4.h,
            children: dataInfo.map((data){
              return Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.scubeWhite,
                    border: Border.all(
                      color: AppColors.containerBorder,
                    )
                ),
                child: Row(
                  children: [
                    Column(
                      spacing: 2.h,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data['data_color'],
                          ),
                        ),

                        Text(
                          data['name'],
                          style: h2.copyWith(
                            color: AppColors.appBarForeground,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 4.w,),

                    Container(
                      width: 1.w,
                      height: 34.h,
                      color: AppColors.containerBorder,
                    ),

                    SizedBox(width: 8.w,),

                    Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Data',
                              style: h4.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.dashboardText,
                              ),
                            ),

                            SizedBox(width: 17.w,),

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
                              'Cost',
                              style: h4.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.dashboardText,
                              ),
                            ),

                            SizedBox(width: 17.w,),

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
                    )
                  ],
                ),
              );
            }).toList(),
            /*children: [
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.scubeWhite,
                    border: Border.all(
                      color: AppColors.containerBorder,
                    )
                ),
                child: Row(
                  children: [
                    Column(
                      spacing: 2.h,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.loginBackground,
                          ),
                        ),

                        Text(
                          'Data A',
                          style: h2.copyWith(
                            color: AppColors.appBarForeground,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 4.w,),

                    Container(
                      width: 1.w,
                      height: 34.h,
                      color: AppColors.containerBorder,
                    ),

                    SizedBox(width: 8.w,),

                    Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Data',
                              style: h4.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.dashboardText,
                              ),
                            ),

                            SizedBox(width: 17.w,),

                            Text(
                              ':',
                              style: h2.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.dashboardText,
                              ),
                            ),

                            SizedBox(width: 4.w,),

                            Text(
                              '2798.50 (29.53%)',
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
                              'Cost',
                              style: h4.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.dashboardText,
                              ),
                            ),

                            SizedBox(width: 17.w,),

                            Text(
                              ':',
                              style: h2.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.dashboardText,
                              ),
                            ),

                            SizedBox(width: 4.w,),

                            Text(
                              '35689 ৳',
                              style: h2.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.appBarForeground,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],*/
          )
        ],
      ),
    );
  }
}
