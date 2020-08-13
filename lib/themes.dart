import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme get mainTextTheme {
  return TextTheme(headline6: TextStyle(color: Colors.black));
}

ThemeData get mainTheme {
  Color accentColor = Color.fromRGBO(184, 83, 83, 1);
  Color focusColor = Color.fromRGBO(184, 83, 83, 1);
  Color primaryColor = Colors.black;
  Color mainWhitePLACEHOLDER = Colors.white;
  String fontFamily = GoogleFonts.mavenPro().fontFamily;
  TextTheme textTheme = GoogleFonts.mavenProTextTheme();
  Color scaffoldBackgroundColor = Color(0xFFf8fbf8);

  return ThemeData(
    backgroundColor: Colors.black12,
    primaryColor: primaryColor,
    accentColor: accentColor,
    focusColor: focusColor,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    primaryTextTheme: mainTextTheme,
    tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: accentColor),
          insets: EdgeInsets.only(left: 5, right: 5),
        ),
        labelStyle:
            TextStyle(fontWeight: FontWeight.w700, fontFamily: fontFamily),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, fontFamily: fontFamily)),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: accentColor)),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        isDense: false,
        isCollapsed: false,
        filled: false,
        focusColor: Colors.yellow,
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: focusColor))),
    cardTheme: CardTheme(
        color: mainWhitePLACEHOLDER,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)))),
    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
            fontSize: 20, color: Colors.black12, fontFamily: fontFamily),
        backgroundColor: mainWhitePLACEHOLDER,
        elevation: 10,
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)))),
    /*bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: primaryColor,
        selectedItemColor: accentColor,
        elevation: 10),*/
  );
}
