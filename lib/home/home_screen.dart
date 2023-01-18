import 'package:chat_blue_firebase/add_room/add_room.dart';
import 'package:chat_blue_firebase/add_room/room_widget.dart';
import 'package:chat_blue_firebase/database/database_util.dart';
import 'package:chat_blue_firebase/home/home_navigator.dart';
import 'package:chat_blue_firebase/home/home_view_model.dart';
import 'package:chat_blue_firebase/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeNavigator {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.navigator = this;
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewModel,
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
            title: Text("HOME"),
          ),
          body: StreamBuilder<QuerySnapshot<RoomModel>>(
            stream: DataBaseUtil.getRooms(),
            builder: (cotext, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (asyncSnapshot.hasError) {
                return Text(asyncSnapshot.error.toString());
              } else {
                var roomList =
                    asyncSnapshot.data?.docs.map((doc) => doc.data()).toList();
                return GridView.builder(
                    itemCount: roomList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return RoomWidget(room: roomList[index]);
                    });
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddRoom.routeName);
            },
            child: Text("+"),
          ),
        ),
      ]),
    );
  }
}
