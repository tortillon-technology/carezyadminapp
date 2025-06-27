import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_palette.dart';

class PlusJakartaFontPalette {
  static const String fontFamily = "PlusJakartaSans";

  /*<---11--->*/
  static TextStyle get fWhite_11_500 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: ColorPalette.white);

  /*<---12--->*/
  static TextStyle get fBlack_12_400 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalette.black);

  static TextStyle get fBlack_12_600 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: ColorPalette.black);
  /*<---13--->*/
  static TextStyle get f777777_13_600 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: HexColor("#777777"));

  /*<---14--->*/

  static TextStyle get fBlack_14_400 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalette.black);
  static TextStyle get fBlack_14_600 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ColorPalette.black);
  static TextStyle get f1C1C1C_14_600 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: HexColor("#1C1C1C"));

  static TextStyle get f616161_14_400 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalette.f616161);

  /*<---15--->*/
  static TextStyle get f6E6E6E_15_500 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: ColorPalette.f6E6E6E);

  /*<---16--->*/
  static TextStyle get fBlack_16_600 => TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: ColorPalette.black);
}
