import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static String fontFamily = "AudioWide";
  static String genos = "genos";
}

extension TextStyleExtensions on TextStyle {
  // Weights
  TextStyle get bold => weight(FontWeight.w600);

  // Styles
  TextStyle get normal24w700 => customStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal24w400 => customStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  TextStyle get normal20w500 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get normal20w500g => customStyle(fontSize: 20, letterSpacing: 0.0, weight: FontWeight.w500, fontFamily: Constant.genos);
  TextStyle get normal20w300 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w300,
      );
  TextStyle get normal20w300g => customStyle(fontSize: 20, letterSpacing: 0.0, weight: FontWeight.w300, fontFamily: Constant.genos);
  TextStyle get normal20w100 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w100,
      );
  TextStyle get normal20w400 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  TextStyle get normal18w700 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal18w700g => customStyle(fontSize: 18, letterSpacing: 0.0, weight: FontWeight.w700, fontFamily: Constant.genos);

  TextStyle get normal28w700 => customStyle(
        fontSize: 28,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal28w400 => customStyle(
        fontSize: 28,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  TextStyle get normal16w700 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );

  ///
  TextStyle get normal24w500 => customStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get normal24w500g => customStyle(fontSize: 24, letterSpacing: 0.0, weight: FontWeight.w500, fontFamily: Constant.genos);

  TextStyle get normal16w500 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get normal16w500g => customStyle(fontSize: 16, letterSpacing: 0.0, weight: FontWeight.w500, fontFamily: Constant.genos);
  TextStyle get normal16w400 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal16w400g => customStyle(fontSize: 16, letterSpacing: 0.0, weight: FontWeight.w400, fontFamily: Constant.genos);

  TextStyle get normal16w600 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );

  TextStyle get normal10w500 => customStyle(
        fontSize: 10,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );

  TextStyle get normal21w700 => customStyle(
        fontSize: 21,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal21w400 => customStyle(
        fontSize: 21,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal32w600 => customStyle(
        fontSize: 32,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal26w600 => customStyle(
        fontSize: 26,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal32w700 => customStyle(
        fontSize: 32,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal22w600 => customStyle(
        fontSize: 22,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal22w400 => customStyle(
        fontSize: 22,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal22w400g => customStyle(fontSize: 22, letterSpacing: 0.0, weight: FontWeight.w400, fontFamily: Constant.genos);
  TextStyle get normal36w600 => customStyle(
        fontSize: 36,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal22w700 => customStyle(
        fontSize: 22,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal13w500 => customStyle(
        fontSize: 13,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get normal13w400 => customStyle(
        fontSize: 13,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal13w400g => customStyle(fontSize: 13, letterSpacing: 0.0, weight: FontWeight.w400, fontFamily: Constant.genos);

  TextStyle get normal11w600 => customStyle(
        fontSize: 11,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );

  TextStyle get normal18w600 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal18w500 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get normal18w500g => customStyle(fontSize: 18, letterSpacing: 0.0, weight: FontWeight.w500, fontFamily: Constant.genos);
  TextStyle get normal8w500 => customStyle(
        fontSize: 8,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );

  TextStyle get normal12w500 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );

  TextStyle get normal12w700 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );

  TextStyle get normal12w600 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );

  TextStyle get normal12w400 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  TextStyle get normal24w600 => customStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );

  TextStyle get normal20w600 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal26w600g => customStyle(fontSize: 26, letterSpacing: 0.0, weight: FontWeight.w600, fontFamily: Constant.genos);

  TextStyle get normal42w600 => customStyle(
        fontSize: 42,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal42w400 => customStyle(
        fontSize: 42,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal14w400 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  TextStyle get normal14w600 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );
  TextStyle get normal14w700 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );
  TextStyle get normal14w500 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );
  TextStyle get normal14w500g => customStyle(fontSize: 14, letterSpacing: 0.0, weight: FontWeight.w500, fontFamily: Constant.genos);

  TextStyle get normal11w400 => customStyle(
        fontSize: 11,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );

  TextStyle get normal18w400 => customStyle(
        fontSize: 18,
        letterSpacing: 0.0,
        weight: FontWeight.w400,
      );
  TextStyle get normal18w400g => customStyle(fontSize: 18, letterSpacing: 0.0, weight: FontWeight.w400, fontFamily: Constant.genos);
  TextStyle get normal20w400g => customStyle(fontSize: 18, letterSpacing: 0.0, weight: FontWeight.w400, fontFamily: Constant.genos);

  TextStyle get normal30w600 => customStyle(
        fontSize: 30,
        letterSpacing: 0.0,
        weight: FontWeight.w600,
      );

  // TextStyle get normal18w600 => customStyle(
  //     fontSize: 18,
  //     letterSpacing: 0.0,
  //     weight: FontWeight.w600,
  //     fontFamily: "poppins"
  // );
  //

  TextStyle get normal15w700 => customStyle(
        fontSize: 17,
        letterSpacing: 0.0,
        weight: FontWeight.w700,
      );

  /// Shortcut for color
  TextStyle textColor(Color v) => copyWith(color: v);

  /// Shortcut for fontWeight
  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  /// Shortcut for fontSize
  TextStyle size(double v) => copyWith(fontSize: v);

  /// Shortcut for letterSpacing
  TextStyle letterSpace(double v) => copyWith(letterSpacing: v);

  TextStyle customStyle({
    required double letterSpacing,
    required double fontSize,
    required FontWeight weight,
    String? fontFamily,
  }) =>
      copyWith(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: weight,
        fontFamily: fontFamily ?? Constant.fontFamily,
      );
}
