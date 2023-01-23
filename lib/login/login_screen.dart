import 'dart:async';

import 'package:chat_blue_firebase/home/home_screen.dart';
import 'package:chat_blue_firebase/login/login_navigator.dart';
import 'package:chat_blue_firebase/login/login_view_model.dart';
import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:chat_blue_firebase/register/register_screen.dart';
import 'package:chat_blue_firebase/utilites/func.dart' as Utility;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNovigator {
  String email = "";

  String password = "";

  var formKey = GlobalKey<FormState>();

  LoginViewModel loginViewModel = LoginViewModel();

  @override
  void initState() {
    //السطر يشير الى نوع الكلاس الذي واقفين فيه
    loginViewModel.loginNovigator = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          "assets/main_background.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text("Login"),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "email"),
                    onChanged: (text) {
                      email = text;
                    },
                    validator: (text) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text!);

                      if (text == null || text.trim().isEmpty) {
                        return "please Enter email";
                      }
                      if (!emailValid) {
                        return 'please enter Vaild email';
                      }
                      return null;
                    },
                  ), //email
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "password"),
                    onChanged: (text) {
                      password = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter password";
                      }
                      if (text.length < 6) {
                        return "please must be at east 6 chars";
                      }
                      return null;
                    },
                  ), //password
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validationPasswordVailad();
                      },
                      child: Text("login")),
                  SizedBox(
                    height: 18,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: Text("Don't Have an account"))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void validationPasswordVailad() {
    if (formKey.currentState?.validate() == true) {
      loginViewModel.loginFirebaseAuth(email, password);
    }
  }

  @override
  void hideLoading() {
    Utility.hideLoading(context);
  }

  @override
  void showLoading() {
    Utility.showLoading(context, "Loading ..");
  }

  @override
  void showMessage(String message) {
    Utility.showMessage(
        context: context,
        message: message,
        postActionText: "ok",
        posAction: (context) {
          Navigator.of(context);
        });
  }

  @override
  void navigatorToHome(MyUser user) {
    var userProv = Provider.of<UserProvider>(context, listen: false);
    userProv.user = user;
    Timer(Duration(milliseconds: 500), () {
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    });
  }
}
