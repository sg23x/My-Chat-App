import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/UI/signup.dart';
import 'package:my_chat_app/UI/test_homescreen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'email',
            ),
            onChanged: (value) => email = value,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'password',
            ),
            onChanged: (value) => password = value,
          ),
          RaisedButton(
            onPressed: () async {
              await Firebase.initializeApp();
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                email: email,
                password: password,
              )
                  .then((user) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TestHomeScreen(
                      user: user.user,
                    ),
                  ),
                );
              }).catchError((e) {
                print("login error $e");
              });
            },
            child: Text('Login'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupScreen(),
                ),
              );
            },
            child: Text(
              'Go to signup',
            ),
          ),
        ],
      ),
    );
  }
}
