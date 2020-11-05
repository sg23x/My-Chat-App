import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat_app/UI/test_homescreen.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  String email, username, name, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'email'),
            onChanged: (val) {
              email = val;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'password'),
            onChanged: (val) {
              password = val;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'username'),
            onChanged: (val) {
              username = val;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'name'),
            onChanged: (val) {
              name = val;
            },
          ),
          RaisedButton(
            onPressed: () async {
              // print("$email $password");
              await Firebase.initializeApp();
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: email, password: password)
                  .then((user) {
                FirebaseFirestore.instance.collection('users').add({
                  'email': user.user.email,
                  'uid': user.user.uid,
                  'name': name,
                  'username': username,
                }).then((v) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TestHomeScreen(
                        name: name,
                      ),
                    ),
                  );
                });
              }).catchError((e) {
                print("signup error $e");
              });
            },
            child: Text("Signup"),
          ),
        ],
      ),
    );
  }
}
