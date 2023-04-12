

import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();
  static final AppColors _singleton = AppColors._internal();
  final Color whiteColor = const Color(0XFFFFFFFF);
  final Color whiteColorF8 = const Color(0XFFF8F8FF);
  final Color blackColor = const Color(0XFF000000);
  final Color black19 = const Color(0XFF191C24);
  final Color black2D = const Color(0XFF2D2E49);
  final Color fontColor00 = const Color(0XFF003F40);
  final Color fontColor74 = const Color(0XFF749A96);

  final Color backGroundColor = const Color(0XFFF9F9FF);
  final Color primaryColor = const Color(0XFF223385);//Color(0XFF5449F8);
  final Color primaryColorB8 = const Color(0XFFB8C4FF);//Color(0XFF5449F8);
  final Color greyEE = const Color(0XFFEEEDFE);
  final Color shadowColor = const Color(0XFF7E7BA0);
  final Color fontPrimaryColor = const Color(0XFF222833);
  final Color fontSecondaryColor = const Color(0XFF4B5563);

  final Color transparent =  Colors.transparent;
  final Color redColor =  Colors.red;
}