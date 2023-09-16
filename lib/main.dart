import 'package:flutter/material.dart';

import 'calculator/screens/calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Calculator.routeName,
      routes: {
        Calculator.routeName: (context) => Calculator(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
