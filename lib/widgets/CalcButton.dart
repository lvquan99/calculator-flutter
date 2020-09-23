import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color color;
  final textSize;
  final icon;
  final Color textColor;
  final Function callback;

  const CalcButton(
      {Key key,
      this.text,
      this.icon,
      this.color,
      this.textSize,
      this.textColor,
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
                callback(text);
              },
              color: color != null ? color : null,
              child: icon == null
                  ? Text(
                      text,
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: textSize,
                              color: textColor != null
                                  ? textColor
                                  : Colors.white)),
                    )
                  : Icon(icon, color: Colors.white)),
        ));
  }
}
