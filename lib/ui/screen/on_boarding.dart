

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninjatools/ui/screen/my_main_page.dart';

import '../../utils/color_const.dart';
import '../../utils/font_style_const.dart';
import '../const/ConstConfig.dart';
import '../const/long_button_const.dart';
import '../const/on_boarding_const.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding();

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  int currentIndex = 0;
  var lengthCount = 3;

  List<dynamic> onBoardingPoints = [];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors().backGroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ConstConfig().onBoardingImages[currentIndex],height: size.height * 0.50,fit: BoxFit.contain,),
            OnBoardingConst(
              // Getting the title & subtitle from the const file and showing according to the currentIndex value.
              title: "${ConstConfig().onBoardingTitle[currentIndex]}",
              subTitle: '''${ConstConfig().onBoardingSubTitle[currentIndex]}''',
              function:buttonWidget(size),
            ),
          ],
        ),

    );
  }


  Widget buttonWidget(size) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ConstConfig().onBoardingTitle.asMap().entries.map((entry) {
              return GestureDetector(
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == entry.key
                          ? AppColors().primaryColor
                          : AppColors().whiteColor),
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: size.height * 0.03,bottom: size.height * 0.03),
          child: LongButtonConst(
            width: size.width,
            colors: AppColors().primaryColor,
            child: Center(
              child: Text(lengthCount > currentIndex + 1 ? "Next":"Get Started",style: AppFontStyle.poppinsBoldTextStyle(16,fontColor: AppColors().whiteColor),),
            ),
            // On clicking the button increase the currentIndex
            onTap: () {
              if (lengthCount > currentIndex + 1) {
                currentIndex += 1;
                setState(() {});
              } else {
                Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (_) =>  MyMainPage()));
              }
            },
          ),
        ),
      ],
    );
  }
}