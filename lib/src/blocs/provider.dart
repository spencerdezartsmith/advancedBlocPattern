import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // define constructor and then pass to the super class constructor
  Provider({ Key key, Widget child })
    : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    // Go look up the treee until you find the first instance of provider
    // when you find it return the bloc property from that provider
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }
}