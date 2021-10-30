import 'package:flutter/material.dart';

class PainterCenterBottomNavigation extends CustomPainter {
  final Color color;
  final double elevation;

  PainterCenterBottomNavigation({required this.elevation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    Path path = Path()..moveTo(0, 1);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
    path.arcToPoint(Offset(size.width * .60, 20),
        radius: const Radius.circular(20), clockwise: false);
    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(
        path.shift(Offset(0, -elevation)), Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PainterCenterBottomNavigation oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PainterCenterBottomNavigation oldDelegate) =>
      false;
}
