import 'package:flutter/material.dart';
import 'screen/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF833B61),
          onPrimary: Colors.black,
          secondary: Colors.purple,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.green,
          onBackground: Colors.purple,
          surface: Color(0xFF0A0D22),
          onSurface: Colors.white70,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const InputPage(),
    );
  }
}
