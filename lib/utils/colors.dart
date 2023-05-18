import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color errorOnDark = Color(0xffDC5F5F);
  static const Color illuminatingEmerald = Color(0xff1F8A70);
  static const Color indigoDye = Color(0xff00425A);
  static const Color mustard = Color(0xffFFD449);
  static const Color mellowApricot = Color(0xffFBB668);
  static const Color princetonOrange = Color(0xFFF17D23);
  static const Color colorFourthOption = Color(0xFF16624F);

  static const Color gunMetal = Color(0xFF002634);
  static const Color gunMetalGradientTwo = Color(0xFF00425A);

  static const Color shamrock = Color(0xff2DC59F);



  static const globalGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gunMetal,
      gunMetalGradientTwo,
    ],
  );
  
}