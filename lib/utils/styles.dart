import 'package:flutter/material.dart';

class CustomizedText {
  static Text sfProCustomized(String text,
      {required FontWeight fontWeight,
        required double size,
        required Color color,
        double? height}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'sfProCustomized',
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
