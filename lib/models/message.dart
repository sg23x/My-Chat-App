import 'package:flutter/material.dart';

class Message {
  Message(
      {@required this.body,
      @required this.timestamp,
      @required this.receiver,
      @required this.sender});
  String body;
  String timestamp;
  String receiver;
  String sender;
}
