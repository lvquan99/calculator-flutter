import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConvertUnitButton extends StatelessWidget {
  final Color backgroundColor;
  final icon;
  final size;
  final Color iconColor;
  final Function callback;

  const ConvertUnitButton(
      {Key key,
      this.backgroundColor,
      this.icon = Icons.transform,
      this.size,
      this.iconColor,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
            width: 65,
            height: 65,
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  callback();
                },
                color: backgroundColor,
                child: Icon(
                  icon,
                  color: iconColor == null? Colors.black : iconColor,
                  size: size == null ? 20 : size,
                ))));
  }
}
