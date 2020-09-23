import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

import 'package:calculator/sidebar/MenuItem.dart';
import 'package:calculator/bloc/navigation_bloc/NavigationBloc.dart';

class SideBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SideBarState();

  }
}

class SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenStreamController;
  Stream<bool> isSidebarOpenStream;
  StreamSink<bool> isSidebarOpenSink;
  final _animDuration = const Duration(milliseconds: 700);

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: _animDuration);
    isSidebarOpenStreamController = PublishSubject<bool>();
    isSidebarOpenStream = isSidebarOpenStreamController.stream;
    isSidebarOpenSink = isSidebarOpenStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenStreamController.close();
    isSidebarOpenSink.close();
    super.dispose();
  }

  void onIconPress(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted){
      isSidebarOpenSink.add(false);
      _animationController.reverse();
    }
    else{
      isSidebarOpenSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenStream,
      builder: (context, isSideBarOpenedAsync){
        return AnimatedPositioned(
          duration: _animDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth + 35,
          right: isSideBarOpenedAsync.data ? 30 : screenWidth - 35,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: const Color(0xFF140088),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text(
                          "Quan",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )
                          ),
                        ),
                        subtitle: Text(
                          "github.com/lvquan99",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              color: Color(0xFF2980B9),
                              fontSize: 15,
                              fontStyle: FontStyle.italic
                            )
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.developer_mode,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.dialpad,
                        title: "Calculator",
                        onTap: (){
                          onIconPress();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.CalcPageClicked);
                        },

                      ),
                      MenuItem(
                        icon: Icons.transform,
                        title: "Convert Unit",
                        onTap: (){
                          onIconPress();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ConvertPageClicked);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPress();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF140088),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}