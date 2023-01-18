import 'dart:async';

import 'package:chat_blue_firebase/home/home_screen.dart';
import 'package:chat_blue_firebase/model/my_user.dart';
import 'package:chat_blue_firebase/register/register_navigator.dart';
import 'package:chat_blue_firebase/register/register_view_model.dart';
import 'package:chat_blue_firebase/utilites/func.dart' as Utility;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterNovigator {
  String firstName = "";

  String email = "";

  String password = "";

  String lastName = "";

  String username = "";

  var formKey = GlobalKey<FormState>();

  RegisterViewModel viewModel = RegisterViewModel();

  @override
  void initState() {
    //السطر يشير الى نوع الكلاس الذي واقفين فيه
    viewModel.novigator = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
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
                      decoration: InputDecoration(labelText: "name"),
                      onChanged: (text) {
                        firstName = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "please Enter first Name";
                        }
                        return null;
                      },
                    ), //fist name
                    TextFormField(
                      decoration: InputDecoration(labelText: "last name"),
                      onChanged: (text) {
                        lastName = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please Enter :Last Name";
                        }
                        return null;
                      },
                    ), //lastName
                    TextFormField(
                      decoration: InputDecoration(labelText: "username"),
                      onChanged: (text) {
                        username = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please Enter username";
                        }
                        return null;
                      },
                    ), //username
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
                    ElevatedButton(
                        onPressed: () {
                          validationPasswordVailad();
                        },
                        child: Text("HHHIIII"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void validationPasswordVailad() async {
    if (formKey.currentState?.validate() == true) {
      viewModel.registerFirebasrAuth(
          email: email,
          password: password,
          username: username,
          firstName: firstName,
          lastName: lastName);
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
          Navigator.pop(context);
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
