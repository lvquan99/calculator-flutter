import 'package:calculator/widgets/components/DirectSelection.dart';
import 'package:calculator/widgets/components/InputField.dart';
import 'package:flutter/material.dart';

class ConvertInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Function onSelectedChanged;
  final List<String> elements;
  const ConvertInput({
    Key key,
    this.hintText,
    this.controller,
    this.elements,
    this.onChanged,
    this.onSelectedChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputField(hintText: hintText, onChanged: onChanged, controller: controller,),
        SizedBox(
          width: 7,
        ),
        DirectSelection(elements: elements, onSelectedItemChanged: onSelectedChanged,)
      ],
    );
  }
}

