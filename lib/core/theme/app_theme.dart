import 'package:flutter/material.dart';
import 'package:sport_app/core/constants/app_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'ChakraPetch',
      textTheme: ThemeData.light().textTheme.copyWith(
      titleMedium:const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.chakraPetchBold,
      ),
      titleSmall:const TextStyle(
        fontSize: 12,
        fontFamily: AppFonts.chakraPetch,
      ),
    ),
    );
  }
}