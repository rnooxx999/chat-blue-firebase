import 'package:chat_blue_firebase/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

var radius = Radius.circular(12);

class MessageWidget extends StatelessWidget {
  Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return provider.user?.id == message.senderId
        ? SentMessage(message: message)
        : ReciveMessage(message: message);
  }
}

class SentMessage extends StatelessWidget {
  Message message;

  SentMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: Text(message.content,
              style: TextStyle(color: Colors.white, fontSize: 18)),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: radius, topLeft: radius, bottomLeft: radius)),
        ),
        Text(
          message.dateFormatter(),
          style: TextStyle(color: CupertinoColors.inactiveGray),
        ),
      ],
    );
  }
}

class ReciveMessage extends StatelessWidget {
  Message message;

  ReciveMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message.senderName, style: TextStyle(color: Colors.purple)),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                  topRight: radius, topLeft: radius, bottomLeft: radius)),
          child: Text(
            message.content,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Text(
          message.dateFormatter(),
          style: TextStyle(color: CupertinoColors.inactiveGray),
        ),
      ],
    );
  }
}
