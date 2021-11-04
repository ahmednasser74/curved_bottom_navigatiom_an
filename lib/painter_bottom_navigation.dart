import 'package:flutter/material.dart';
import 'enums.dart';

class CurvedBottomNavCustomPainter extends CustomPainter {
  final Color color;
  final double elevation;
  final BottomNavStyle bottomNavStyle;

  CurvedBottomNavCustomPainter({
    required this.bottomNavStyle,
    required this.elevation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    Path path = Path();
    generalDrawnPath(bottomNavStyle: bottomNavStyle, path: path, size: size);

    canvas.drawShadow(
        path.shift(Offset(0, -elevation)), Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedBottomNavCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CurvedBottomNavCustomPainter oldDelegate) => false;
}

Path generalDrawnPath({
  required BottomNavStyle bottomNavStyle,
  required Path path,
  required Size size,
}) {
  switch (bottomNavStyle) {
    case BottomNavStyle.center:
      path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
      path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
      path.arcToPoint(Offset(size.width * .60, 20),
          radius: const Radius.circular(20), clockwise: false);
      path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
      path.quadraticBezierTo(size.width * .80, 0, size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
      return path;
    // case BottomNavStyle.curvedBottomNavRight:
    //   path.moveTo(0, size.height);
    //   path.lineTo(0, 0);
    //   path.lineTo(size.width * 0.7931250, 0);
    //   path.quadraticBezierTo(size.width * 0.7920375, size.height * 0.7696200,
    //       size.width * 0.8906250, size.height * 0.7695000);
    //   path.quadraticBezierTo(size.width * 0.9756250, size.height * 0.7696200,
    //       size.width * 0.9775000, 0);
    //   path.lineTo(size.width, 0);
    //   path.lineTo(size.width * 0.9987500, size.height);
    //   path.lineTo(0, size.height);
    //   path.close();
    //   return path;
    // case BottomNavStyle.curvedBottomNavLeft:
    //   path.moveTo(0, size.height);
    //   path.lineTo(0, 0);
    //   path.lineTo(size.width * 0.0275000, 0);
    //   path.quadraticBezierTo(size.width * 0.0232875, size.height * 0.7721200,
    //       size.width * 0.1218750, size.height * 0.7720000);
    //   path.quadraticBezierTo(size.width * 0.2146875, size.height * 0.7721200,
    //       size.width * 0.2103125, 0);
    //   path.lineTo(size.width, 0);
    //   path.lineTo(size.width * 0.9987500, size.height);
    //   path.lineTo(0, size.height);
    //   path.close();
    //   return path;
    case BottomNavStyle.centerCurvy:
      path.moveTo(0,size.height);
      path.quadraticBezierTo(0,size.height*0.4011250,0,size.height*0.2015000);
      path.quadraticBezierTo(size.width*0.2040625,size.height*0.0326200,size.width*0.3636875,size.height*0.0017000);
      path.quadraticBezierTo(size.width*0.4025125,size.height*-0.0033800,size.width*0.3979750,size.height*0.0792800);
      path.cubicTo(size.width*0.3774875,size.height*0.4136000,size.width*0.4203125,size.height*0.9050000,size.width*0.5015625,size.height*0.8980000);
      path.cubicTo(size.width*0.5743750,size.height*0.9080000,size.width*0.6270625,size.height*0.4235000,size.width*0.6046375,size.height*0.0763000);
      path.quadraticBezierTo(size.width*0.6025000,size.height*-0.0058400,size.width*0.6392000,0);
      path.quadraticBezierTo(size.width*0.8140625,size.height*0.0305000,size.width*0.9975000,size.height*0.1960000);
      path.quadraticBezierTo(size.width*0.9981250,size.height*0.3970000,size.width,size.height);
      path.lineTo(0,size.height);
      path.close();
      // path.moveTo(0,size.height);
      // path.lineTo(0,size.height*0.2005000);
      // path.quadraticBezierTo(size.width*0.2286125,size.height*-0.0031400,size.width*0.4107250,0);
      // path.cubicTo(size.width*0.3817375,size.height*0.5097400,size.width*0.4352375,size.height*0.8742600,size.width*0.5015625,size.height*0.8745000);
      // path.cubicTo(size.width*0.5653125,size.height*0.8748800,size.width*0.6140625,size.height*0.5113400,size.width*0.5875000,0);
      // path.quadraticBezierTo(size.width*0.7718750,size.height*-0.0039200,size.width,size.height*0.2035000);
      // path.lineTo(size.width,size.height);
      // path.lineTo(0,size.height);
      // path.close();
      return path;
  }
}



