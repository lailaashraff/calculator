import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/CalculatorButton.dart';

class Calculator extends StatefulWidget {
  static const String routeName = 'calculator-screen';

  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  child: Text(
                    resText,
                    style: TextStyle(fontSize: 24),
                  ),
                  margin: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: 'Clear', onButtonPress: clear),
                CalculatorButton(text: '⌫', onButtonPress: backSpace),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    text: '%', onButtonPress: onMultiSideOperatorClick),
                CalculatorButton(
                    text: 'sqrt', onButtonPress: onSingleSideOperatorClick),
                CalculatorButton(
                    text: 'sin', onButtonPress: onSingleSideOperatorClick),
                CalculatorButton(
                    text: 'cos', onButtonPress: onSingleSideOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '7', onButtonPress: onDigitClick),
                CalculatorButton(text: '8', onButtonPress: onDigitClick),
                CalculatorButton(text: '9', onButtonPress: onDigitClick),
                CalculatorButton(
                    text: '*', onButtonPress: onMultiSideOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '4', onButtonPress: onDigitClick),
                CalculatorButton(text: '5', onButtonPress: onDigitClick),
                CalculatorButton(text: '6', onButtonPress: onDigitClick),
                CalculatorButton(
                    text: '/', onButtonPress: onMultiSideOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '1', onButtonPress: onDigitClick),
                CalculatorButton(text: '2', onButtonPress: onDigitClick),
                CalculatorButton(text: '3', onButtonPress: onDigitClick),
                CalculatorButton(
                    text: '+', onButtonPress: onMultiSideOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '.', onButtonPress: onDigitClick),
                CalculatorButton(text: '0', onButtonPress: onDigitClick),
                CalculatorButton(text: '=', onButtonPress: onEqualClick),
                CalculatorButton(
                    text: '-', onButtonPress: onMultiSideOperatorClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clear(text) {
    resText = '';
    lhs = '';
    operator = '';
    setState(() {});
  }

  void backSpace(text) {
    resText = resText.substring(0, resText.length - 1);
    setState(() {});
  }

  void onDigitClick(String text) {
    resText += text;
    setState(() {});
  }

  ///5*15+20
  String lhs = '';
  String operator = '';

  void onMultiSideOperatorClick(String chosenOp) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;

      lhs = calculate(lhs, operator, rhs);
    }
    operator = chosenOp;

    resText = '';

    setState(() {});
  }

  void onSingleSideOperatorClick(String chosenOp) {
    setState(() {
      if (chosenOp == 'sqrt') {
        resText = sqrt(double.parse(resText)).toString();
      } else if (chosenOp == 'sin') {
        resText = sin(double.parse(resText)).toString();
      } else if (chosenOp == 'cos') {
        resText = cos(double.parse(resText)).toString();
      }
      lhs = '';
      operator = '';
    });
  }

  void onEqualClick(text) {
    String rhs = resText;
    resText = calculate(lhs, operator, rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double result = 0;
    if (operator == '+') {
      result = num1 + num2;
    } else if (operator == '-') {
      result = num1 - num2;
    } else if (operator == '*') {
      result = num1 * num2;
    } else if (operator == '/') {
      result = num1 / num2;
    } else if (operator == '%') {
      result = num1 % num2;
    }
    setState(() {});
    return result.toString();
  }
}

///clear, backspace, %,sqrt, sin, cos
