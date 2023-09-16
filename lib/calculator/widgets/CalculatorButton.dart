import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Function onButtonPress;

  CalculatorButton({required this.text, required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {
            onButtonPress(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
