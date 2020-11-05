import 'package:flutter/material.dart';

class TestHomeScreen extends StatelessWidget {
  TestHomeScreen({this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text("Hello $name"),
      ),
    );
  }
}
