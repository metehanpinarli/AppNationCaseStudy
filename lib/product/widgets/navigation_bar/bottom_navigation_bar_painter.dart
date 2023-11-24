import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = ColorPalette.secondarySystemBackground;
    path = Path();

    path.lineTo(size.width * 0.04, size.height * 0.14);
    path.cubicTo(size.width * 0.04, size.height * 0.06, size.width * 0.06, 0, size.width * 0.08, 0);
    path.cubicTo(size.width * 0.08, 0, size.width * 0.92, 0, size.width * 0.92, 0);
    path.cubicTo(size.width * 0.94, 0, size.width * 0.96, size.height * 0.06, size.width * 0.96, size.height * 0.14);
    path.cubicTo(size.width * 0.96, size.height * 0.14, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, size.width * 0.04, size.height * 0.14, size.width * 0.04, size.height * 0.14);
    path.cubicTo(size.width * 0.04, size.height * 0.14, size.width * 0.04, size.height * 0.14, size.width * 0.04,
        size.height * 0.14);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
