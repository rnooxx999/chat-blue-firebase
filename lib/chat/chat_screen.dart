import 'package:chat_blue_firebase/chat/chat_navigator.dart';
import 'package:chat_blue_firebase/chat/chat_view_model.dart';
import 'package:chat_blue_firebase/model/message.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:chat_blue_firebase/provider/user_provider.dart';
import 'package:chat_blue_firebase/utilites/func.dart' as Utility;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'message_widget.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "ChatSplashScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements ChatNavigator {
  ChatViewModel viewModel = ChatViewModel();
  String messageContent = "";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    viewModel.navigator = this;

    super.initState();
  }

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as RoomModel;
    var provider = Provider.of<UserProvider>(context);
    viewModel.room = args;
    viewModel.currentUser = provider.user!;
    viewModel.listenForUpdateMessage();

    print("User : ${provider.user!.id}");
    print("firstName : ${provider.user!.firstName}");

    return ChangeNotifierProvider(
        create: (context) => viewModel,
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
                title: Text(args.title ?? ""),
              ),
              body: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 19),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: StreamBuilder<QuerySnapshot<Message>>(
                        stream: viewModel.streamMessage,
                        builder: (context, asyncSnapShot) {
                          if (asyncSnapShot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (asyncSnapShot.hasError) {
                            return Text(asyncSnapShot.error.toString());
                          } else {
                            var messageList = asyncSnapShot.data?.docs
                                    .map((doc) => doc.data())
                                    .toList() ??
                                [];
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return MessageWidget(
                                    message: messageList[index]);
                              },
                              itemCount: messageList.length,
                            );
                          }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            onChanged: (text) {
                              messageContent = text;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: "type a message",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12)))),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.sendMessage(controller.text);
                            },
                            child: Row(
                              children: [
                                Text("Send"),
                                Icon(Icons.send_outlined)
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ))
        ]));
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void navigatorToHome() {
    // TODO: implement navigatorToHome
  }

  @override
  void showLoading() {
    Utility.showMessage(
        context: context,
        message: "loading..",
        postActionText: "ok",
        posAction: (context) {
          Navigator.pop(context);
        });
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  @override
  void clearMessage() {
    controller.clear();
  }
}
