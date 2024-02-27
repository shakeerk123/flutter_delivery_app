import 'package:flutter/material.dart';

class AppColor {
  static Color kOnBoardingColor = const Color(0XFFFEFEFE);
  static Color kGrayscale40 = const Color(0XFFAEAEB2);
  static Color kGrayscaleDark100 = const Color(0XFF1C1C1E);
  static const Color kPrimary = Color(0xFF84BD93);
  static const Color kSecondary = Color(0xFF3F2D20);
  static const Color kBackground = Color(0xFFFFF5E0);
  static const Color kOrange = Color(0xFFEF8829);
  static const Color kLine = Color(0xFFE6DCCD);
  static const Color kLine2 = Color(0xFFD3BBAA);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kLightPink = Color(0xFFF5D3BB);
  static const Color kLightPink2 = Color(0xFFFFE2CD);
  static const Color kLightBrown = Color(0xFF73665C);
  static const Color kDarkRed = Color(0xFFC53F3F);
  static const Color kGrey60 = Color(0xFF9CA4AB);
  static const Color kGrey70 = Color(0xFF78828A);
  static const Color kGrey100 = Color(0xFF171725);
}

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}
