import 'package:chat_blue_firebase/chat/chat_navigator.dart';
import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/model/message.dart';
import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatViewModel extends ChangeNotifier {
  late ChatNavigator navigator;
  late MyUser currentUser;
  late RoomModel room;
  late Stream<QuerySnapshot<Message>> streamMessage;

  void sendMessage(String content) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Message message = Message(
        roomId: room.roomId ?? "1zyerEV9T9nw5XiH9Z7w",
        content: content,
        senderId: currentUser.id,
        senderName: currentUser.userName,
        dateTime: DateTime.now().millisecondsSinceEpoch);
    try {
      var res = DataBaseUtil.insertMessage(message);
      navigator.clearMessage();
    } catch (error) {
      navigator.showMessage(error.toString());
    }
    ;
  }

  void listenForUpdateMessage() {
    streamMessage = DataBaseUtil.getMeessageFromFirebase(room.roomId ?? "");
  }
}
