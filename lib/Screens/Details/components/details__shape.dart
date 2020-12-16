import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.55);
    //path.quadraticBezierTo(x1, y1, x2, y2)
    path.quadraticBezierTo(size.width * 0.18, size.height * 0.42,
        size.width * 0.48, size.height * 0.56);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.75, size.width, 100);
    path.quadraticBezierTo(size.height + 200, -size.height, -size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldcleapper) => true;
}
