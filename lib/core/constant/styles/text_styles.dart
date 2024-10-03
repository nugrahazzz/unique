import 'package:flutter/material.dart';

class AppTextStyles {
  static const bold = 'poppins_bold';
  static const medium = 'poppins_medium';
  static const semiBold = 'poppins_semi_bold';

  static const poppinsMedium = TextStyle(
    fontFamily: medium,
    wordSpacing: 1,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );

  static const poppinsSemiBold = TextStyle(
    fontFamily: semiBold,
    wordSpacing: 1,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );
  static const poppinsBold = TextStyle(
    fontFamily: bold,
    fontWeight: FontWeight.bold,
  );
}
