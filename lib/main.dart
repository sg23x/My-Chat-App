import 'package:flutter/material.dart';
import 'package:my_chat_app/UI/chat_screen.dart';
import 'package:my_chat_app/UI/signup.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
    );
  }
}
