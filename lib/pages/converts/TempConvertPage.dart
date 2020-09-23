import 'package:calculator/widgets/ConvertInput.dart';
import 'package:calculator/widgets/ConvertUnitButton.dart';
import 'package:flutter/material.dart';

class TempConvertPage extends StatelessWidget {
  final List<String> unit = [
    "Celsius",
    "Kelvin",
    "Fahrenheit"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConvertInput(hintText: "From", elements: unit),
          Padding(
            padding: EdgeInsets.all(25),
            child: ConvertUnitButton(
              size: 40.0,
              iconColor: Colors.white,
            ),
          ),
          ConvertInput(hintText: "To", elements: unit),
        ],
      ),
    );
  }
}
