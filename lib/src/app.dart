import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen(),
        )
      )
    );
  }
}