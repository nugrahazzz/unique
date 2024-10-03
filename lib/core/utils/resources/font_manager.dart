import 'package:flutter/material.dart';

class Fonts {
  static const poppinsBold = 'poppins_bold';
  static const poppinsMedium = 'poppins_medium';
  static const poppinsSemiBold = 'poppins_semi_bold';
}

class TextStyles {
  static const poppinsMedium = TextStyle(
    fontFamily: Fonts.poppinsMedium,
    wordSpacing: 1,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );
  static const poppinsSemiBold = TextStyle(
    fontFamily: Fonts.poppinsSemiBold,
    wordSpacing: 1,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );
  static const poppinsBold = TextStyle(
    fontFamily: Fonts.poppinsBold,
    fontWeight: FontWeight.bold,
  );
}
