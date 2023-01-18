import 'package:chat_blue_firebase/add_room/add_room.dart';
import 'package:chat_blue_firebase/chat/chat_screen.dart';
import 'package:chat_blue_firebase/home/home_screen.dart';
import 'package:chat_blue_firebase/provider/user_provider.dart';
import 'package:chat_blue_firebase/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase/firebase_options.dart';
import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'chat-blue-firebase',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: sharedPreferences.getString("id") != null
          ? MyApp()
          : MaterialApp(initialRoute: LoginScreen.routeName, routes: {
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
            })));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return MaterialApp(
      // theme: MyThemeData.newsTheming,

      initialRoute:
          //inititFirstPage(userProvider);
          //  userProvider.initPage() ?
          //userProvider==null ?
          //  LoginScreen.routeName:
          HomeScreen.routeName,

      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddRoom.routeName: (context) => AddRoom(),
        ChatScreen.routeName: (context) => ChatScreen()
      },
    );
  }

  Future<String> inititFirstPage(user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("id") == user) {
      return HomeScreen.routeName;
    }
    return LoginScreen.routeName;
  }
}