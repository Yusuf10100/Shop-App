import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/components/constants.dart';

ThemeData darkTheme = ThemeData(
    primarySwatch: defaultColor, //the primary or default color that applying in all for the app
    scaffoldBackgroundColor: Color(0xff333739),
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility:
          false, //to control the status bar ,true value means that I can't control the status bar
      systemOverlayStyle: SystemUiOverlayStyle(
          //this is the method of controlling the status bar
          statusBarColor: Color(0xff333739),
          statusBarBrightness: Brightness.light),
      backgroundColor: Color(0xff333739),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: Color(0xff333739),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    fontFamily: 'Jannah');

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor, //the primary or default color that applying in all for the app
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility:
          false, //to control the status bar ,true value means that I can't control the status bar
      systemOverlayStyle: SystemUiOverlayStyle(
          //this is the method of controlling the status bar
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    fontFamily: 'Jannah');
