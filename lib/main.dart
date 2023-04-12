import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjatools/ui/screen/splash_screen.dart';
import 'package:ninjatools/utils/color_const.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ninja Tools",
        theme: ThemeData(
            fontFamily: "PTSans",
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: AppColors().whiteColor.withOpacity(0.8))),
        home: SplashScreen(),
    );
  }
}

