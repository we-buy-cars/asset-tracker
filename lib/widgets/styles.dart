import 'package:flutter/material.dart';

class TextStyles {

  static TextStyle h2 = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Color(0xff1B2835),
  );

  static TextStyle p = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: Color(0xff1B2835),
  );

  static TextStyle cardLabel = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: Color(0xffAEAEAE),
  );
}

extension TextStyleCopy on TextStyle {

  TextStyle copyWith({
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
    );
  }
}
