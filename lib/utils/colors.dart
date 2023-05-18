import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Color(0xffFFFFFF);

  static const Color illuminatingEmerald = Color(0xff1F8A70);
  static const Color indigoDye = Color(0xff00425A);
  static const Color mustard = Color(0xffFFD449);
  static const Color mellowApricot = Color(0xffFBB668);
  static const Color princetonOrange = Color(0xFFF17D23);

  static const Color gunMetal = Color(0xFF002634);
  static const Color gunMetalGradientTwo = Color(0xFF00425A);


  static const globalGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gunMetal,
      gunMetalGradientTwo,
    ],
  );
  
}