import 'package:chat_blue_firebase/add_room/add_room_navigator.dart';
import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:flutter/widgets.dart';

class AddRoomViewModel extends ChangeNotifier {
  late AddRoomNavigator navigator;

  void addRoom(String roomTitle, String roomDescrip, String category) async {
    RoomModel room = RoomModel(
        roomId: "",
        title: roomTitle,
        description: roomDescrip,
        categoryId: category);
    try {
      navigator.showLoading();
      var createRoom = await DataBaseUtil.addRoomFireBase(room);
      navigator.hideLoading();
      navigator.showMessage("Room was Added Succsufully");
      navigator.navigatorToHome();
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString());
    }
  }
}
