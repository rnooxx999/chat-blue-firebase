import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  MyUser? user;

  User? userFirebase;


  UserPrider() {
    userFirebase = FirebaseAuth.instance.currentUser;
    initUser();
    notifyListeners();
  }

  initUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (userFirebase != null) {
      user = await DataBaseUtil.loginUser((userFirebase!.uid ?? ""));
      await sharedPreferences.setString("name", user!.firstName);
    }
    notifyListeners();
  }
}
