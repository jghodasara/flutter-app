import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/color_const.dart';
import '../../../utils/font_style_const.dart';
import '../../../utils/image_path_const.dart';
import '../../const/long_button_const.dart';

class SpinnerCreate extends StatefulWidget {
  const SpinnerCreate({Key? key}) : super(key: key);

  @override
  State<SpinnerCreate> createState() => _SpinnerCreateState();
}

class _SpinnerCreateState extends State<SpinnerCreate> {

  Size? size;

  BehaviorSubject<int> selected = BehaviorSubject<int>();
  final items = <String>[
    "5",
    "10",
    "15",
    "20",
    "25",
    "30",
    "35",
    "40",
    "50",
    "60",
    "75",
    "100",
    "150",
    "200"
  ];

  String? reward = "";
  bool isReward = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors().whiteColor.withOpacity(0.96),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                spinnerData(),
                spinAndWinOnTap(),
                isReward == true ?Padding(
                  padding: const EdgeInsets.only(left: 30.0,top: 50),
                  child: Row(
                    children: [
                      Text("Reward is : ",style: AppFontStyle.poppinsBoldTextStyle(16),),
                      Text(reward!,style: AppFontStyle.poppinsBoldItalicTextStyle(14),),
                    ],
                  ),
                ) : Container()
              ],
            ),
          )
      ),
    );
  }

// spinner widget
  Widget spinnerData() {
    return  Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width:  size!.width * 0.84,
          height: size!.height * 0.50,
          child: Stack(
            children: [
              FortuneWheel(
                selected: selected.stream,
                alignment: Alignment.centerRight,
                items: items.map((e) {
                  return FortuneItem(
                      child: Text(
                        e,style: AppFontStyle.poppinsRegularTextStyle(16,
                          fontColor: items.indexOf(e) % 2 == 0
                              ? AppColors().fontPrimaryColor : AppColors().whiteColor),
                      ),
                      style: FortuneItemStyle(
                          color: items.indexOf(e) % 2 == 0
                              ? AppColors().whiteColor
                              : AppColors().primaryColor,
                          borderColor: AppColors().primaryColor));
                }).toList(),
                animateFirst: false,
                indicators: [
                  FortuneIndicator(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors().fontPrimaryColor,
                        ),
                      )),

                ],
                curve: Curves.easeOutBack,

                onAnimationEnd: () {
                  setState(() {
                    isReward = true;
                  });
                  reward = items[selected.value];

                  print("reward data is : $reward");
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(ImagePathConst.spinArrow,height: 40,)),
        ),


      ],
    );
  }

// Spin & Win button
  Widget spinAndWinOnTap(){
    return LongButtonConst(
      onTap: () {
        setState(() {
          isReward = false;
        });
        selected.add(
          Fortune.randomInt(0, items.length),
        );
      },
      width: 150,
      radius: 25,
      colors: AppColors().primaryColor,
      child: Center(child: Text("Spin & Win",style: AppFontStyle.poppinsBoldTextStyle(16,fontColor: AppColors().whiteColor)),),
    );
  }
}
