import 'package:chat_blue_firebase/chat/chat_screen.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  RoomModel room;

  RoomWidget({required this.room});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            Image.asset(
              "assets/${room.categoryId}.png",
              fit: BoxFit.fill,
              width: 150,
            ),
            Text(room.title ?? "")
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: room);
      },
    );
  }
}
