import 'package:flutter/material.dart';
import 'package:make_it_rain/widgets/custom_login_form.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  final String appTitle = "로그인";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appTitle, home: Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      backgroundColor:  Colors.blueGrey,
      body: CustomLoginForm(),
    ),);
  }
}