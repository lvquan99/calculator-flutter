import 'package:calculator/widgets/ConvertInput.dart';
import 'package:calculator/widgets/ConvertUnitButton.dart';
import 'package:flutter/material.dart';

class LengthConvertPage extends StatelessWidget {
  TextEditingController _fromEditingController = TextEditingController();
  TextEditingController _toEditingController = TextEditingController();
  List<String> unit = <String>[
    "nanometer",
    "millimeter",
    "centimeter",
    "meter",
    "kilometer",
    "yard",
    "foot",
    "inch"
  ];
  final _dataConvert = [
    1000000000.0,
    1000.0,
    100,
    1,
    0.001,
    1.0936132983,
    3.280839895,
    39.37007874
  ];
  int _fromUnit = 0;
  int _toUnit = 0;

  double _fromNumber = 0.0;
  double _toNumber = 0.0;

  void onFromUnitSelected(int index) {
    _fromUnit = index;
    _calcConvert(true);
    _displayResult();
  }

  void onToUnitSelected(int index) {
    _toUnit = index;
    _calcConvert(true);
    _displayResult();
  }

  void onTextFromChanged(String value) {
    if (value != "") {
      _fromNumber = double.parse(value);
    } else {
      _fromNumber = 0.0;
    }
    _calcConvert(true);
    _displayResult();
  }

  void onTextToChanged(String value) {
    if (value != "") {
      _toNumber = double.parse(value);
    } else {
      _toNumber = 0.0;
    }
    _calcConvert(false);
    _displayResult(isForward: false);
  }

  void _calcConvert(bool isForward) {
    if (isForward) {
      _toNumber =
          (_fromNumber * _dataConvert[_toUnit]) / _dataConvert[_fromUnit];
    } else {
      _fromNumber =
          (_toNumber * _dataConvert[_fromUnit]) / _dataConvert[_toUnit];
    }
  }

  void _displayResult({bool isForward = true}) {
    if (isForward) {
      _toEditingController.text = _toNumber.toString();
    } else {
      _fromEditingController.text = _fromUnit.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF34495E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConvertInput(
            hintText: "From",
            elements: unit,
            onChanged: onTextFromChanged,
            onSelectedChanged: onFromUnitSelected,
            controller: _fromEditingController,
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: ConvertUnitButton(
              size: 40.0,
              iconColor: Colors.white,
            ),
          ),
          ConvertInput(
            hintText: "To",
            elements: unit,
            onChanged: onTextToChanged,
            onSelectedChanged: onToUnitSelected,
            controller: _toEditingController,
          ),
        ],
      ),
    );
  }
}
