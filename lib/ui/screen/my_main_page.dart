import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninjatools/ui/screen/spinner/spinner_create.dart';

import '../../utils/color_const.dart';
import '../../utils/font_style_const.dart';
import '../../utils/image_path_const.dart';
import '../const/bottom_bar/bottom_bar_const.dart';
import '../const/container_const.dart';
import 'calculator/calculator_page.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  Size? size;
  int selectedIndex = 0;

  List<Widget> homePage = const [
    CalculatorPage(),
    SpinnerCreate(),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors().primaryColor,
            leading: Builder(builder: (cntx) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    child: Image.asset(
                        ImagePathConst.menu,
                      color: AppColors().whiteColor,
                      width: 30,
                      height: 40,
                    )),
              );
            }),
            leadingWidth: 60,
            centerTitle: true,
            title: Text(
              "Ninja Tools",
              style: AppFontStyle.poppinsBoldTextStyle(18,
                  fontColor: AppColors().whiteColor),
            ),
          ),
          body: homePage[selectedIndex],
          bottomNavigationBar: bottomNavigatorData()),
    );
  }

 // Bottom navigator where we are having two items that are calculator & spinner
  Widget bottomNavigatorData() {
    return ContainerGlassConst(
        leftPadding: 0,
        rightPadding: 0,
        topPadding: 0,
        radius: 0,
        height: size!.height * 0.077,
        width: size!.width,
        child: Padding(
          padding: EdgeInsets.only(
              left: size!.width * 0.02,
              top: size!.height * 0.01,
              right: size!.width * 0.01),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // This is the Calculator bottom tab
                GestureDetector(
                  onTap: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                  child: Container(
                    width: size!.width * 0.15,
                    height: size!.height * 0.07,
                    color: AppColors().transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selectedIndex == 0
                            ? BottomBarConstColorIcon(
                                image: ImagePathConst.homeLogoColor,
                              )
                            : BottomBarConstIcon(
                                image: ImagePathConst.homeLogo,
                              ),
                        selectedIndex == 0
                            ? BottomBarConstColorText(
                                text: "Calculator",
                              )
                            : BottomBarConstText(
                                text: "Calculator",
                              ),
                      ],
                    ),
                  ),
                ),
                // This is the Spinner bottom tab
                GestureDetector(
                    onTap: () {
                      selectedIndex = 1;
                      setState(() {});
                    },
                    child: Container(
                      width: size!.width * 0.15,
                      height: size!.height * 0.07,
                      color: AppColors().transparent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            selectedIndex == 1
                                ? BottomBarConstColorIcon(
                                    image: ImagePathConst.favoriteLogoColor,
                                  )
                                : BottomBarConstIcon(
                                    image: ImagePathConst.favoriteLogo,
                                  ),
                            selectedIndex == 1
                                ? BottomBarConstColorText(
                                    text: "Spinner",
                                  )
                                : BottomBarConstText(
                                    text: "Spinner",
                                  ),
                          ]),
                    )),
              ]),
        ));
  }
}
