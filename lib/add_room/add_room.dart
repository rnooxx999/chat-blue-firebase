import 'dart:async';

import 'package:chat_blue_firebase/add_room/add_room_navigator.dart';
import 'package:chat_blue_firebase/add_room/add_room_view_model.dart';
import 'package:chat_blue_firebase/model/category.dart';
import 'package:chat_blue_firebase/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_blue_firebase/utilites/func.dart' as Utility;

import 'package:provider/provider.dart';

class AddRoom extends StatefulWidget {
  static String routeName = "AddRoom";

  const AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> implements AddRoomNavigator {
  @override
  String titleRoom = '';
  String describtionRoom = '';
  var formKey = GlobalKey<FormState>();
  var categoryList = Category.getCategory();
  late Category selectedItem;

  AddRoomViewModel addRoomViewModel = AddRoomViewModel();

  void initState() {
    addRoomViewModel.navigator = this;
    selectedItem = categoryList[0];
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => addRoomViewModel,
      child: Stack(children: [
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
            title: Text("Add Room"),
          ),
          body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 19),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Create New Room",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Image.asset("assets/car.jpg"),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: "enter Room Title"),
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter title room";
                          }
                          return null;
                        },
                        onChanged: (text) {
                          titleRoom = text;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownButton<Category>(
                              items: categoryList
                                  .map((category) => DropdownMenuItem<Category>(
                                      value: category,
                                      child: Row(
                                        children: [
                                          Text(category.title),
                                          Icon(category.icon),
                                        ],
                                      )))
                                  .toList(),
                              value: selectedItem,
                              onChanged: (newCategory) {
                                if (newCategory == null) return;
                                selectedItem = newCategory;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter Description room";
                          }
                          return null;
                        },
                        onChanged: (text) {
                          describtionRoom = text;
                        },
                        maxLines: 4,
                        minLines: 4,
                        decoration:
                            InputDecoration(hintText: "enter Room describtion"),
                      ),
                      SizedBox(),
                      ElevatedButton(
                          onPressed: () {
                            validateForm();
                          },
                          child: Text("ADD ROOM"))
                    ]),
              )),
        ),
      ]),
    );
  }

  void validateForm() {
    if (formKey.currentState?.validate() == true) {
      print("yyyyyyyyyyyy");
      addRoomViewModel.addRoom(titleRoom, describtionRoom, selectedItem.id);
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
          Timer(Duration(seconds: 2), () {
            Navigator.pop(context);
          });
        });
  }

  @override
  void navigatorToHome() {
    Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

// @override
// void navigatorToHome() {
//
// }
}
