import 'package:chat_blue_firebase/chat/chat_navigator.dart';
import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/model/message.dart';
import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:flutter/widgets.dart';

class ChatViewModel extends ChangeNotifier {
  late ChatNavigator navigator;
  late MyUser currentUser;
  late RoomModel room;

  void sendMessage(String content) {
    Message message = Message(
        roomId: room.roomId ?? "",
        content: content,
        senderId: currentUser.id ?? "",
        senderName: currentUser.userName ?? "",
        dateTime: DateTime.now().millisecondsSinceEpoch);
    try {
      var res = DataBaseUtil.insertMessage(message);
      navigator.clearMessage();
    } catch (error) {
      navigator.showMessage(error.toString());
    }
    ;
  }
}
