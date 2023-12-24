import 'package:flutter/material.dart';

class ColorSystem {
  ColorSystem._();
  static const Color color_white = Color(0xffffffff);
  static const Color color_black = Color(0xff000000);
  static const Color color_button = Color(0xff2B637B);

  static const LinearGradient gradient_background = LinearGradient(
    colors: [
      Color(0xff459cac),
      Color(0xff7594a6),
      Color(0xff386d8c),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
