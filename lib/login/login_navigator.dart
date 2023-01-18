import 'package:chat_blue_firebase/model/my_user.dart';

abstract class LoginNovigator {
  void showLoading();

  void hideLoading();

  void showMessage(String message);

  void navigatorToHome(MyUser user);
}
