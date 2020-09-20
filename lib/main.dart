import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';


void main() => runApp(CalcApp());

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalcAppSate();
  }
}

class CalcAppSate extends State<CalcApp> {
  String _expression = '';
  String _history = '';

  void numClick(String num) {
    setState(() {
      if (!(_expression.length == 1 && _expression[0] == '0')){
        _expression += num;
      }
      else{
        _expression = num;
      }
    });
  }

  void dotClick(String dot){
    setState(() {
      if(!_expression.contains('.')) {
        if(_expression == ''){
          _expression += '0';
        }
        _expression += dot;
      }
      else{
        final lastChar = _expression[_expression.length - 1];
        if(lastChar == "+" || lastChar == "-" || lastChar == "*" || lastChar == "/"){
          _expression += '0';
        }
        for(var index = _expression.length-1; index>=0; index--){
          if(_expression[index] == "+" || _expression[index] == "-" || _expression[index] == "*" || _expression[index] == "/"){
            break;
          }else if(_expression[index] == "."){
            return;
          }
        }
        _expression += dot;
      }
    });
  }
  
  void del(String del){
    setState(() {
      if(_expression != ''){
        _expression = _expression.substring(0, _expression.length-1);
      }
    });
  }

  void clear(String c){
    setState(() {
      _expression = '';
    });
  }

  void clearAll(String ac){
    setState(() {
      _expression = _history = '';
    });
  }

  void solve(String s){
    setState(() {
      if(_expression != ''){
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);

        _history = _expression + ' = ' + eval.toString();
        _expression = eval.toString();
      }
    });
  }

  void operator(String operator){
    setState(() {
      if(_expression != ''){
        final lastChar = _expression[_expression.length - 1];
        if(lastChar != "+" && lastChar != "-" && lastChar != "*" && lastChar != "/" && lastChar != "."){
          if(_expression.contains("+") || _expression.contains("-") || _expression.contains("*") || _expression.contains("/")){
            solve('');
          }
          _expression += operator;
        }
        else{
          _expression = _expression.substring(0, _expression.length-1) + operator;
        }
      }
    });
  }

  void negative(String np){
    setState(() {
      if(_expression != ''){
        if(_expression[0] == '-'){
          _expression = _expression.substring(1);
        }
        else{
          _expression = '-' + _expression;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
          backgroundColor: Color(0xFF34495E),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 15.0),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontSize: 20.0, color: Color(0xFFBDC3C7))),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(15.0),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontSize: 50.0, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: 'AC',
                    color: Color(0xFFBFC9CA),
                    textSize: 25.0,
                    callback: clearAll,
                  ),
                  CalcButton(
                    text: 'C',
                    color: Color(0xFFBFC9CA),
                    textSize: 30.0,
                    callback: clear,
                  ),
                  CalcButton(
                    text: 'Del',
                    color: Color(0xFFBFC9CA),
                    textSize: 22.0,
                    callback: del,
                  ),
                  CalcButton(
                    text: '/',
                    color: Color(0xFFFFFFFF),
                    textColor: Color(0xFF2980B9),
                    textSize: 30.0,
                    callback: operator,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '7',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    color: Color(0xFFFFFFFF),
                    textColor: Color(0xFF2980B9),
                    textSize: 30.0,
                    callback: operator,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '4',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    color: Color(0xFFFFFFFF),
                    textColor: Color(0xFF2980B9),
                    textSize: 30.0,
                    callback: operator,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '1',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    color: Color(0xFFFFFFFF),
                    textColor: Color(0xFF2980B9),
                    textSize: 30.0,
                    callback: operator,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '0',
                    textSize: 25.0,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '.',
                    textSize: 30.0,
                    callback: dotClick,
                  ),
                  CalcButton(
                    text: '+/-',
                    textSize: 20.0,
                    callback: negative,
                  ),
                  CalcButton(
                    text: '=',
                    color: Color(0xFFFFFFFF),
                    textColor: Color(0xFF2980B9),
                    textSize: 30.0,
                    callback: solve,
                  )
                ],
              )
            ],
          )),
    );
  }
}
