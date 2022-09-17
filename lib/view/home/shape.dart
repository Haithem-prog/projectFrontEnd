import 'package:flutter/material.dart';

/// Clip widget in oval shape at top side
class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.7);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 1.7);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip!
    return true;
  }
}
