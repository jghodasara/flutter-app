
import 'package:flutter/cupertino.dart';

import '../../utils/color_const.dart';
import '../../utils/font_style_const.dart';
import 'container_const.dart';

class OnBoardingConst extends StatelessWidget {
  String? title,subTitle;
  Widget? function;
  double? fontSize;
  OnBoardingConst({this.title,this.subTitle,this.function,this.fontSize});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ContainerGlassConst(
      // height: 375,
      leftPadding: 0,
      rightPadding: 0,
      bottomPadding: 0,
      child: Padding(
        padding:  EdgeInsets.only(top:size.height * 0.04,left: 20,right:20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
              style: AppFontStyle.poppinsBoldTextStyle(fontSize ??24),
            ),
            const SizedBox(height: 10,),
            subTitle == null ? Container() :Text(
             subTitle!,
              style: AppFontStyle.poppinsRegularTextStyle(16,fontColor: AppColors().fontColor74),
              textAlign:TextAlign.center,
            ),
            function!
          ],
        ),
      ),
    );
  }
}
