

import 'package:flutter/cupertino.dart';

class LongButtonConst extends StatelessWidget {
  Widget? child;
  Color? colors;
  Function()? onTap;
  double? width,radius,height;
  LongButtonConst({this.child,this.colors,this.onTap,this.width,this.radius,this.height,});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(radius ?? 25),

        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}