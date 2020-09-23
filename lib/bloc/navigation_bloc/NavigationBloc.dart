import 'package:bloc/bloc.dart';
import 'package:calculator/pages/CalcPage.dart';
import 'package:calculator/pages/ConvertPage.dart';
import 'dart:async';

enum NavigationEvents{
  CalcPageClicked,
  ConvertPageClicked,
}

abstract class NavigationState{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationState>{
  @override
  // TODO: implement initialState
  NavigationState get initialState => CalcPage();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvents event) async*{
    switch (event){
      case NavigationEvents.CalcPageClicked:
        yield CalcPage();
        break;
      case NavigationEvents.ConvertPageClicked:
        yield ConvertPage();
        break;
    }
  }
}