import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/UI/login.dart';
import 'package:my_chat_app/UI/signup.dart';
import 'package:my_chat_app/UI/test_homescreen.dart';
import 'package:my_chat_app/services/user_management.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: UserManagement().retrieveUser(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            print("hello ji " + snapshot.data.uid);
            return TestHomeScreen(
              user: snapshot.data,
            );
          }
          return LoginScreen();
        },
      ),
    );
  }
}
