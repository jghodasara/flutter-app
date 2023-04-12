
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_const.dart';

class AppFontStyle {
  static TextStyle poppinsBoldTextStyle(double fontSize,
      {Color? fontColor, FontWeight? fontWeight, bool? isUnderlined}) {
    return TextStyle(
        fontFamily: 'PoppinsBold',
        color: fontColor ?? AppColors().fontColor00,
        fontSize: fontSize,
        decoration: isUnderlined ?? false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.w700,decorationThickness: 2 );
  }

  static TextStyle poppinsBoldItalicTextStyle(double fontSize,
      {Color? fontColor, FontWeight? fontWeight,bool? isUnderlined}) {
    return TextStyle(
        fontFamily: 'PoppinsMedium',
        color: fontColor ?? AppColors().fontColor00,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500, decoration: isUnderlined ?? false
        ? TextDecoration.lineThrough
        : TextDecoration.none,
    decorationThickness: 2);
  }

  static TextStyle poppinsRegularTextStyle(double fontSize,
      {Color? fontColor, FontWeight? fontWeight, bool? isUnderlined}) {
    return TextStyle(
        fontFamily: 'PoppinsRegular',
        color: fontColor ?? AppColors().fontColor00,
        fontSize: fontSize,
        decoration: isUnderlined ?? false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.w400,decorationThickness: 2);
  }

  static TextStyle poppinsItalicTextStyle(double fontSize,
      {Color? fontColor, FontWeight? fontWeight, bool? isUnderlined}) {
    return TextStyle(
        decoration: isUnderlined ?? false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        fontFamily: 'PoppinsItalic',
        color: fontColor ?? AppColors().fontColor00,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,decorationThickness: 2);
  }


}
