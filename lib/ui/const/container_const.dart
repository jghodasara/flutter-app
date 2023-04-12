import 'package:flutter/cupertino.dart';

import '../../utils/color_const.dart';

class ContainerGlassConst extends StatelessWidget {
  double? topPadding,
      bottomPadding,
      rightPadding,
      leftPadding,
      height,
      width,
      radius;
  Widget? child;

  ContainerGlassConst(
      {this.child,
        this.height,
        this.rightPadding,
        this.leftPadding,
        this.bottomPadding,
        this.topPadding,
        this.width,
        this.radius});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 8,
          left: leftPadding ?? 16,
          right: rightPadding ?? 16,
          bottom: bottomPadding ?? 0),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors().whiteColor.withOpacity(0.70),
                AppColors().primaryColorB8.withOpacity(0.50)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            backgroundBlendMode: BlendMode.darken,
            boxShadow: [
              BoxShadow(
                color: AppColors().shadowColor.withOpacity(0.15),
                offset: const Offset(0.0, 0.0),
                blurStyle: BlurStyle.inner,),
              BoxShadow(
                color: AppColors().whiteColor.withOpacity(0.10),
                offset: const Offset(0.0, 0.0),
                blurStyle: BlurStyle.inner,
              ),

            ],
            borderRadius: BorderRadius.circular(radius ?? 25),
          ),
          child: child),
    );
  }
}