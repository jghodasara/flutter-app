

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/color_const.dart';
import '../../utils/image_path_const.dart';
import 'my_main_page.dart';
import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver{

  Timer? _timer;


  @override
  void initState() {
    super.initState();
    _timer =  Timer.periodic(const Duration(seconds: 4), (timer) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) =>  OnBoarding()));
      _timer!.cancel();
    });
  }


  @override
  Widget build(BuildContext context)  {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors().whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagePathConst.logo,
                  height:size.height * 0.30, width: size.width * 0.78, fit: BoxFit.contain),
            ],
          ),
        ),
      ),
    );
  }
}
