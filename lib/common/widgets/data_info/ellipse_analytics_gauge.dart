import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task_app/common/custom_fonts.dart';

import '../../app_colors.dart';

class EllipseAnalyticsGauge extends StatelessWidget {
  final double value;
  final double max;
  final String unit;
  final double width;
  final double height;
  final double strokeWidth;
  final double startAngleDeg;
  final double sweepAngleDeg;
  final Color trackColor;
  final Color progressColor;

  const EllipseAnalyticsGauge({
    required this.value,
    this.max = 90,
    this.unit = "kWh/Sqft",
    this.width = 200,
    this.height = 170,
    this.strokeWidth = 15,
    this.startAngleDeg = 139.19,
    this.sweepAngleDeg = 300,
    this.trackColor = AppColors.progressColor,
    this.progressColor = AppColors.dashboardGradientColor3,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final pct = (value/max).clamp(0.0, 1.0);

    return SizedBox(
      width: width.w,
      height: height.h,
      child: CustomPaint(
        painter: _EllipseGaugePainter(
          pct: pct,
          strokeWidth: strokeWidth.r,
          startAngle: _degToRad(startAngleDeg),
          sweepAngle: _degToRad(sweepAngleDeg),
          trackColor: trackColor.withOpacity(0.15),
          progressColor: progressColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value.toStringAsFixed(2),
                style: h3.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.appBarForeground,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                unit,
                style: h3.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.appBarForeground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _degToRad(double deg) => deg*math.pi/180.0;
}

class _EllipseGaugePainter extends CustomPainter {
  final double pct;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;
  final Color trackColor;
  final Color progressColor;

  _EllipseGaugePainter({
    required this.pct,
    required this.strokeWidth,
    required this.startAngle,
    required this.sweepAngle,
    required this.trackColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double diameter = math.min(size.width, size.height);
    final double radius = diameter/2;
    final double padding = strokeWidth/2;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width/2, size.height/2),
      radius: radius-padding,
    );

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, trackPaint);
    canvas.drawArc(rect, startAngle, sweepAngle * pct, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _EllipseGaugePainter oldDelegate) {
    return oldDelegate.pct != pct ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.startAngle != startAngle ||
        oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor;
  }
}
