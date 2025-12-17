import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../../custom_fonts.dart';

class EllipseAnalyticsTaka extends StatelessWidget {
  final num amount;
  final double max;
  final String unit;
  final double width;
  final double height;
  final double strokeWidth;
  final double startAngleDeg;
  final double sweepAngleDeg;
  final Color trackColor;
  final Color progressColor;

  const EllipseAnalyticsTaka({
    required this.amount,
    required this.max,
    this.unit = "tk",
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
    final pct = (amount.toDouble()/max).clamp(0.0, 1.0);

    return SizedBox(
      width: width.r,
      height: height.r,
      child: CustomPaint(
        painter: _CircleGaugePainter(
          pct: pct,
          strokeWidth: strokeWidth.r,
          startAngle: _degToRad(startAngleDeg),
          sweepAngle: _degToRad(sweepAngleDeg),
          trackColor: trackColor.withOpacity(0.18),
          progressColor: progressColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$amount',
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

class _CircleGaugePainter extends CustomPainter {
  final double pct;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;
  final Color trackColor;
  final Color progressColor;

  _CircleGaugePainter({
    required this.pct,
    required this.strokeWidth,
    required this.startAngle,
    required this.sweepAngle,
    required this.trackColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final diameter = math.min(size.width, size.height);
    final padding = strokeWidth/2;

    final rect = Rect.fromCircle(
      center: Offset(size.width/2, size.height/2),
      radius: (diameter/2)-padding,
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
  bool shouldRepaint(covariant _CircleGaugePainter oldDelegate) {
    return oldDelegate.pct != pct ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.startAngle != startAngle ||
        oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor;
  }
}
