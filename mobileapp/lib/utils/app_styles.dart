import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class Styles {
  
  static Color primaryColor = primary;
  
  static Color ktsf=const Color(0xFF999999);
  static Color ksf=const Color(0xFFFBFBFB);
  
  static Color kinp = Color(0xFF717171);
   static Color kfbtn = Color(0xFF1E3A8A);
    static Color kbtc = Color(0xFF4285F4);
    static Color kbtnw = const Color(0xFFBFDBFE);
static Color ktxtf=const Color(0xFFC7C7C7);
  static Color textColor = const Color(0xFFFFFFFF);
  static Color btntColor = const Color(0xFF0000FF);
  static Color btntwColor = const Color( 0xFFF5F5F9);
  static Color kback = const Color(0xFF04171B);
  static Color kbtn = const Color(0x62FFFFFF);
   static Color cardcolor = const Color(0xFF6D9C);
  static Color bgColor = const Color(0xFF000000);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color kakiColor = const Color(0xFFd2bdd6);
   static Color ksearch = const Color(0xFFFBFBFB);
  
  static TextStyle textStyle =
      TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1 =
      TextStyle(fontSize: 30, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 =
      TextStyle(fontSize: 21, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(
      fontSize: 17, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
}

class AppStyles {
  static TextStyle headLineStyle2 = TextStyle(/* Define your style for headLineStyle2 */);

  static TextStyle headLineStyle3 = TextStyle(/* Define your style for headLineStyle3 */);
}

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline3: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline3: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}