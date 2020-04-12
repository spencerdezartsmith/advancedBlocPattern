import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          Container(
            margin: EdgeInsets.only(
              bottom: 15.0,
            ),
          ),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(
              bottom: 20.0
            ),
          ),
          submitButton(bloc),
        ],
      )
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'you@email.com',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      }
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        );
      }
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.pink,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}