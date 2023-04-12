import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:ninjatools/utils/color_const.dart';
import 'package:ninjatools/utils/font_style_const.dart';

import 'calculator_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var userInput = '';
  var answer = '';

// Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: AppFontStyle.poppinsBoldItalicTextStyle( 18, fontColor: AppColors().blackColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: AppFontStyle.poppinsBoldTextStyle( 30, fontColor: AppColors().blackColor),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // GridView builder to arrange the calculator buttons in grid
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: AppColors().blackColor,
                      );
                    }

                    // +/- button
                    else if (index == 1) {
                      return CalculatorButton(
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: AppColors().blackColor,
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: AppColors().blackColor,
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: AppColors().blackColor,
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: AppColors().whiteColor,
                      );
                    }

                    // other buttons
                    else {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? AppColors().primaryColor
                            : AppColors().whiteColor,
                        textColor: isOperator(buttons[index])
                            ? AppColors().whiteColor
                            : AppColors().blackColor,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

// function to check if the pressed button is an operator or not
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

