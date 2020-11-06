import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/UI/login.dart';

// ignore: must_be_immutable
class TestHomeScreen extends StatelessWidget {
  TestHomeScreen({this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              FirebaseAuth.instance.signOut().then(
                (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            }
            return Text("Hello " + snapshot.data['name']);
          },
        ),
      ),
    );
  }
}
