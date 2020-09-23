import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectSelection extends StatefulWidget {
  final List<String> elements;
  final onSelectedItemChanged;
  DirectSelection({Key key, this.elements, this.onSelectedItemChanged}) : super(key: key);

  @override
  DirectSelectionState createState() => DirectSelectionState();
}

class DirectSelectionState extends State<DirectSelection> {
  int selectedIndex = 0;

  List<Widget> _buildItems1() {
    return widget.elements
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DirectSelect(
      backgroundColor: Color(0xFF34495E),
      itemExtent: 50.0,
      selectedIndex: selectedIndex,
      child: MySelectionItem(
        isForList: false,
        title: widget.elements[selectedIndex],
      ),
      onSelectedItemChanged: (index) {
        setState(() {
          selectedIndex = index;
          widget.onSelectedItemChanged(index);
        });
      },
      items: _buildItems1(),
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFBFC9CA),
        borderRadius: BorderRadius.circular(35),
      ),
      child: SizedBox(
        height: 40.0,
        child: isForList
            ? Container(
                child: _buildItem(context),
              )
            : Container(
                child: Stack(
                  children: <Widget>[
                    _buildItem(context),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_drop_down_circle,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(color: Colors.white, fontSize: 15)),
          )),
    );
  }
}
