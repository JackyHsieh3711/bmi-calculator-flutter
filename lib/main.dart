import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          thumbColor: Color(0xFFEB1555),
          activeTrackColor: Colors.white,
          overlayColor: Color(0x1fEB1555)
        ),
      ),
      home: InputPage(),
    );
  }
}


