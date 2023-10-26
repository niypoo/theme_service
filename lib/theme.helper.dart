import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeDataHelper {
  static ThemeData create(
    ThemeData theme, {
    Color? fontColor,
    Color? secondaryTextColor,
    Color? primaryColor,
    Color? canvasColor,
    Color? secondaryColor,
    Color? scaffoldBackgroundColor,
    Color? appBarColor,
    Color? cardColor,
    Color? iconColor,
    Color? secondaryIconColor,
    String? fontName,
    double iconSize = 25,
    Brightness? brightness,
  }) {
    return theme.copyWith(
      brightness: brightness,
      primaryColor: primaryColor,
      canvasColor: canvasColor,
      colorScheme: theme.colorScheme.copyWith(
        secondary: secondaryColor,
        onSecondary: secondaryTextColor,
      ),
      secondaryHeaderColor: secondaryTextColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: cardColor,
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(color: primaryColor, fontSize: 18),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(color: primaryColor, fontSize: 18),
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 13,
            fontFamily: fontName,
            color: fontColor,
          ),
        ),
      ),
      iconTheme: IconThemeData(color: iconColor, size: iconSize),
      // textTheme: Get.textTheme.apply(
      //   fontFamily: fontName,
      //   bodyColor: fontColor,
      //   displayColor: fontColor,
      // ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 26,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        titleMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        titleSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w200,
          fontSize: 12,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: 10,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 2,
        backgroundColor: cardColor,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: brightness),
        color: appBarColor,
        iconTheme: IconThemeData(color: iconColor, size: iconSize),
        actionsIconTheme: IconThemeData(color: iconColor),
        titleTextStyle: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    );
  }
}
