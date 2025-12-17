import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scube_task_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:scube_task_app/common/app_colors.dart';
import 'package:scube_task_app/common/custom_fonts.dart';
import 'package:scube_task_app/common/widgets/custom_button.dart';
import 'package:scube_task_app/common/widgets/custom_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 35.h,),

                    Image.asset(
                      'assets/images/login/scube_logo.png',
                      scale: 4,
                    ),

                    SizedBox(height: 20.h,),

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'SCUBE\n',
                            style: h2.copyWith(
                              fontSize: 24.sp,
                              color: AppColors.scubeWhite,
                            ),
                          ),

                          TextSpan(
                            text: 'Control & Monitoring System',
                            style: h2.copyWith(
                              fontSize: 20.sp,
                              color: AppColors.scubeWhite,
                            ),
                          )
                        ]
                      ),
                    ),

                    SizedBox(height: 80.h,),

                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 32.h,),
                        decoration: BoxDecoration(
                          color: AppColors.scubeWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Login',
                                style: h1.copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.loginText,
                                ),
                              ),
                          
                              SizedBox(height: 24.h,),
                          
                              CustomTextField(
                                hintText: 'Username',
                                isObscureText: false.obs,
                              ),
                          
                              SizedBox(height: 12.h,),
                          
                              Obx(() {
                                return CustomTextField(
                                  hintText: 'Password',
                                  isObscureText: controller.isSignInPasswordInvisible,
                                  suffixIcon: controller.isSignInPasswordInvisible.value
                                      ? 'assets/images/login/invisible.png'
                                      : 'assets/images/login/visible.png',
                                );
                              }),
                          
                              SizedBox(height: 8.h,),
                          
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {  },
                                    child: Text(
                                      'Forget password?',
                                      style: h3.copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.loginText2,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          
                              SizedBox(height: 20.h,),
                          
                              CustomButton(
                                onTap: () => Get.to(DashboardView()),
                                padding: EdgeInsets.symmetric(vertical: 18.h,),
                                color: AppColors.loginBackground,
                                buttonContent: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: h2.copyWith(
                                        fontSize: 18.sp,
                                        color: AppColors.scubeWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          
                              SizedBox(height: 8.h,),
                          
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don’t have any account?',
                                      style: h3.copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.loginText2,
                                      ),
                                    ),
                          
                                    Text(
                                      ' ',
                                      style: h3.copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                          
                                    GestureDetector(
                                      onTap: () {  },
                                      child: Text(
                                        'Register Now',
                                        style: h2.copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.loginBackground,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
