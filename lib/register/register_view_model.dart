import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:chat_blue_firebase/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../firebase/firebase_errors.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNovigator novigator;

  void registerFirebasrAuth(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String username}) async {
    try {
      novigator.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Firebase ID : ${credential.user?.uid}");

      var user = MyUser(
          id: credential.user!.uid ?? '',
          firstName: firstName,
          lastName: lastName,
          email: email,
          userName: username);
      await DataBaseUtil.registerUser(user);

      novigator.hideLoading();
      novigator.showMessage("Register Successful");
      novigator.navigatorToHome();
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        novigator.hideLoading();
        novigator.showMessage('The password provided is too weak.');
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {
        novigator.hideLoading();
        novigator.showMessage("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
}
