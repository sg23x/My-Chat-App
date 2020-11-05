import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  String email;
  String password;
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
          RaisedButton(
            onPressed: () async {
              print("$email $password");
              await Firebase.initializeApp();
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, password: password);
              FirebaseFirestore.instance.collection('users').add(
                {'email': email, 'password': password},
              );
            },
            child: Text("Signup"),
          ),
        ],
      ),
    );
  }
}
