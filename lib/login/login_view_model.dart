import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/firebase/firebase_errors.dart';
import 'package:chat_blue_firebase/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  late LoginNovigator loginNovigator;

  void loginFirebaseAuth(String email, String password) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      loginNovigator.showLoading();
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var objLogin = await DataBaseUtil.loginUser(result.user!.uid ?? "");
      if (objLogin == null) {
        loginNovigator.showMessage("Register Failed Please try again");
      } else {
        loginNovigator.hideLoading();
        loginNovigator.showMessage("loagin Succseefuly ");
        //  sharedPreferences.setString("id", result.user!.uid);
        loginNovigator.navigatorToHome(objLogin);
      }

      print("sign Id : ${result.user?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.userNotFound) {
        loginNovigator.hideLoading();
        loginNovigator.showMessage("No user found for that email.");

        print('No user found for that email.');
      } else if (e.code == FirebaseErrors.wrongPassword) {
        loginNovigator.hideLoading();
        loginNovigator.showMessage("Wrong password provided for that user.");

        print('Wrong password provided for that user.');
      }
    }
  }
}
