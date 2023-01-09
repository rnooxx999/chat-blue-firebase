import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryLight = Color(0xffB7935F);
  static Color primaryL = Color(0xffc2b495);
  static Color blackColor = Color.fromARGB(255, 63, 52, 26);
  static Color wightColor = Colors.white;
  static Color darkColor = Color.fromARGB(255, 39, 64, 141);
  static Color darkYelowColor = Color.fromARGB(255, 232, 207, 77);

  static ThemeData lightMode = ThemeData(
    //disable splash button effects :
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,

    primaryColor: primaryLight,
    canvasColor: primaryL,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(color: blackColor, fontSize: 35),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor, unselectedItemColor: wightColor),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: blackColor,
          fontFamily: 'DTHULUTH'),
      headline2: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: wightColor,
          fontFamily: 'JF Flat'),
      subtitle1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'DTHULUTH',
          color: Colors.white),
    ),
  );

  static ThemeData darkMode = ThemeData(
    canvasColor: darkYelowColor,
    primaryColor: darkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(color: wightColor, fontSize: 35),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: wightColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: darkYelowColor, unselectedItemColor: wightColor),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: darkYelowColor,
          fontFamily: 'DTHULUTH'),
      headline2: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: wightColor,
          fontFamily: 'JF Flat'),
      subtitle1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: wightColor),
      subtitle2: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'DTHULUTH',
          color: Colors.white),
    ),
  );

  static Color primarGreen = Color(0xff77be5e);
  static Color scafoldBlue = Color.fromARGB(255, 110, 164, 230);
  static Color purple = Color.fromARGB(255, 127, 130, 227);
  static Color redColor = Color.fromARGB(255, 248, 90, 114);
  static Color whiteColor = Colors.white;
  static Color background = Color.fromARGB(255, 246, 252, 240);
  static Color myGray = Color.fromARGB(255, 162, 162, 161);
  static Color primaryNight = Color.fromARGB(255, 15, 48, 87);
  static Color pinkHealth = Color.fromARGB(255, 177, 100, 192);
  static Color yellowSince = Color.fromARGB(255, 232, 229, 71);
  static Color blueLight = Color.fromARGB(255, 141, 205, 213);

  static ThemeData todoThemData = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: scafoldBlue,
          unselectedItemColor: myGray,
          backgroundColor: Colors.transparent,
          elevation: 0),
      appBarTheme: AppBarTheme(backgroundColor: scafoldBlue),
      primaryColor: whiteColor,
      canvasColor: scafoldBlue,
      cardColor: purple,
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        //white text
        headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: wightColor,
            fontFamily: 'JF Flat'),
        //white text
        headline2: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        headline3: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: scafoldBlue),
        headline4: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: primarGreen),
        headline5: TextStyle(fontSize: 18, color: Colors.black),
      ));

  static ThemeData todoThemDataNight = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: scafoldBlue,
        unselectedItemColor: myGray,
        backgroundColor: primaryNight,
        elevation: 0,
      ),
      primaryColor: primaryNight,
      canvasColor: primaryNight,
      cardColor: primaryNight,
      appBarTheme: AppBarTheme(backgroundColor: scafoldBlue),
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryNight,
            fontFamily: 'JF Flat'),
        //white text
        headline2: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        headline3: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: whiteColor),
        headline4: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: primarGreen),
        headline5: TextStyle(fontSize: 18, color: whiteColor),
      ));

  static Color greenNews = Color(0xff528c3d);

  static ThemeData newsTheming = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: scafoldBlue,
          unselectedItemColor: myGray,
          backgroundColor: Colors.transparent,
          elevation: 0),
      appBarTheme: AppBarTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          backgroundColor: greenNews),
      primaryColor: greenNews,
      canvasColor: background,
      cardColor: purple,
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(
        //white text
        headline1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: wightColor,
            fontFamily: 'JF Flat'),
        //white text
        headline2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        headline3: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ),
        headline4: TextStyle(
            fontSize: 13, fontWeight: FontWeight.bold, color: primarGreen),
        headline5: TextStyle(
            fontSize: 18, color: Colors.black87, fontFamily: 'JF Flat'),
      ));
}
