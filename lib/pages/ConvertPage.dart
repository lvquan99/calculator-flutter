import 'package:calculator/pages/converts/LengthConvertPage.dart';
import 'package:calculator/pages/converts/TempConvertPage.dart';
import 'package:calculator/pages/converts/TimeConvertPage.dart';
import 'package:calculator/pages/converts/WeightConvertPage.dart';
import 'package:calculator/widgets/ConvertInput.dart';
import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/NavigationBloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:calculator/presentation/unit_font_icons.dart';

class ConvertPage extends StatefulWidget with NavigationState {
  @override
  State<StatefulWidget> createState() {
    return ConvertPageState();
  }
}

class ConvertPageState extends State<ConvertPage> {
  //State class
  int _index = 0;
  var _pages = [
    LengthConvertPage(),
    TempConvertPage(),
    WeightConvertPage(),
    TimeConvertPage(),
  ];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF34495E),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Color(0xFF34495E),
            color: Color(0xFFBFC9CA),
            key: _bottomNavigationKey,
            items: <Widget>[
              Icon(UnitFont.ruler, color: Color(0xFF2980B9)),
              Icon(UnitFont.temperature_high, color: Color(0xFF2980B9)),
              Icon(UnitFont.weight_hanging, color: Color(0xFF2980B9)),
              Icon(UnitFont.clock, color: Color(0xFF2980B9)),
            ],
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
          body: Container(
              color: Color(0xFF34495E), child: Center(child: _pages[_index]))),
    );
  }
}
