import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Widget? buttonContent;

  const CustomButton({
    required this.onTap,
    this.padding,
    this.color,
    this.buttonContent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: buttonContent,
      ),
    );
  }
}
