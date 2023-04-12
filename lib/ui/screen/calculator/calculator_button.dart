import 'package:flutter/material.dart';

import '../../../utils/font_style_const.dart';

// creating Stateless Widget for buttons
class CalculatorButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String? buttonText;
  final Function()? buttontapped;

//Constructor
  CalculatorButton({Key? key,this.color, this.textColor, this.buttonText, this.buttontapped}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText!,
                style: AppFontStyle.poppinsBoldTextStyle( 25, fontColor: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
