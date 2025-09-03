import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:wholeflutter_course/Calculator/components.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = '';
  bool decimalAdded = false;
  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      input.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 45),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      result.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(children: [
                  RoundButton(
                      value: 'AC',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input = "";
                          result = "";
                          decimalAdded = false;
                        });
                      }),
                  // Add spacing between buttons
                  RoundButton(
                      value: '+/-',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input += "+/-";
                        });
                      }),

                  RoundButton(
                      value: '%',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input += "%";
                        });
                      }),

                  RoundButton(
                      value: '/',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input += "/";
                          decimalAdded = false;
                        });
                      }),
                ]),
                Row(children: [
                  RoundButton(
                      value: '7',
                      onpress: () {
                        setState(() {
                          input += "7";
                        });
                      }),
                  RoundButton(
                      value: '8',
                      onpress: () {
                        setState(() {
                          input += "8";
                        });
                      }),
                  RoundButton(
                      value: '9',
                      onpress: () {
                        setState(() {
                          input += "9";
                        });
                      }),
                  RoundButton(
                      value: 'x',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input += "x";
                          decimalAdded = false;
                        });
                      }),
                ]),
                Row(children: [
                  RoundButton(
                      value: '4',
                      onpress: () {
                        setState(() {
                          input += "4";
                        });
                      }),
                  RoundButton(
                      value: '5',
                      onpress: () {
                        setState(() {
                          input += "5";
                        });
                      }),
                  RoundButton(
                      value: '6',
                      onpress: () {
                        setState(() {
                          input += "6";
                        });
                      }),
                  RoundButton(
                      value: '-',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input += "-";
                          decimalAdded = false;
                        });
                      }),
                ]),
                Row(children: [
                  RoundButton(
                      value: '1',
                      onpress: () {
                        setState(() {
                          input += "1";
                        });
                      }),
                  RoundButton(
                      value: '2',
                      onpress: () {
                        setState(() {
                          input += "2";
                        });
                      }),
                  RoundButton(
                      value: '3',
                      onpress: () {
                        setState(() {
                          input += "3";
                        });
                      }),
                  RoundButton(
                      value: '+',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          input += "+";
                          decimalAdded = false;
                        });
                      }),
                ]),
                Row(children: [
                  RoundButton(
                      value: '0',
                      onpress: () {
                        setState(() {
                          input += "0";
                        });
                      }),
                  RoundButton(
                      value: '.',
                      onpress: () {
                        setState(() {
                          input += ".";
                          decimalAdded = true;
                        });
                      }),
                  RoundButton(
                      value: 'DC',
                      onpress: () {
                       setState(() {
                          if (input.endsWith('.')) {
                            decimalAdded = false; // Reset decimal flag if '.' is deleted
                          }
                          input = input.isNotEmpty
                              ? input.substring(0, input.length - 1)
                              : '';
                        });
                      },
                      ),
                  RoundButton(
                      value: '=',
                      color2: Colors.white,
                      color: Colors.black,
                      onpress: () {
                        setState(() {
                          equalPress();
                          // result = '';
                        });
                      }),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
 //  NOTE :: Utils class add krni ha abi data store krna ha jo k  do din  bad delte  
 // ho jai ga automaticaly 
  void equalPress() {
    String finalUserInput = input.replaceAll('x', '*'); // Replace x with *
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel cm = ContextModel();

    try {
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
    } catch (e) {
      result = 'Error';
    }
  }
}
