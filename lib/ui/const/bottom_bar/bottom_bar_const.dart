


import 'package:flutter/cupertino.dart';

import '../../../utils/color_const.dart';
import '../../../utils/font_style_const.dart';

class BottomBarConstIcon extends StatelessWidget {
  final String? image;
  double? height;
  BottomBarConstIcon({this.image,this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.16,
        height: height ??size.height * 0.04,
        decoration: BoxDecoration(
            // color: AppColors().whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(image!));
  }
}

class BottomBarConstColorIcon extends StatelessWidget {
  final String? image;
  double? height;
  BottomBarConstColorIcon({this.image,this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.17,
        height: height ?? size.height * 0.04,
        decoration: BoxDecoration(
            color: AppColors().greyEE,
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(image!,));
  }
}



class BottomBarConstColorText extends StatelessWidget {
  final String? text;
  BottomBarConstColorText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:1.0),
      child: Text(
        text!,
        style: AppFontStyle.poppinsRegularTextStyle(10,
            fontColor: AppColors().primaryColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class BottomBarConstText extends StatelessWidget {
  final String? text;
  BottomBarConstText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:1.0),
      child: Text(
        text!,
        style: AppFontStyle.poppinsRegularTextStyle(10,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
