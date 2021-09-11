import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppTextStyles {
  static TextStyle whiteText({double fontSize = 20}) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      letterSpacing: 2,
    );
  }

  static TextStyle blackText(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
      letterSpacing: 2,
      fontWeight: FontWeight.w500,
    );
  }
}
