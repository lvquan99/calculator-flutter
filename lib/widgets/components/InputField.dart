import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget{
  final String hintText;
  final ValueChanged<String> onChanged;
  final controller;
  InputField({
    Key key,
    this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return InputFieldState();
  }
}

class InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        cursorColor: Color(0xFF2980B9),
        style: GoogleFonts.rubik(
            textStyle: TextStyle(
          color: Color(0xFF2980B9),
          fontSize: 20,
        )),
        decoration: InputDecoration(
          icon: Icon(
            Icons.forward,
            color: Color(0xFF2980B9),
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Color(0xFFBFC9CA),
        borderRadius: BorderRadius.circular(35),
      ),
      child: child,
    );
  }
}
