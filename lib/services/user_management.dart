import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/UI/test_homescreen.dart';

class UserManagement {
  Future<User> retrieveUser() async {
    await Firebase.initializeApp();
    return FirebaseAuth.instance.currentUser;
  }

  storeNewUser({
    @required user,
    @required context,
    @required name,
    @required username,
  }) async {
    await Firebase.initializeApp();
    FirebaseFirestore.instance.collection('users').doc(user.user.uid).set({
      'email': user.user.email,
      'uid': user.user.uid,
      'name': name,
      'username': username,
    }).then(
      (v) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => TestHomeScreen(
              user: user.user,
            ),
          ),
        );
      },
    );
  }
}
