import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_helper/extensions/responsive.extension.dart';

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
            TextStyle(color: primaryColor, fontSize: 18.sp),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(color: primaryColor, fontSize: 18.sp),
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: fontName,
            color: fontColor,
          ),
        ),
      ),
      iconTheme: IconThemeData(color: iconColor, size: 16.sp),
      // textTheme: Get.textTheme.apply(
      //   fontFamily: fontName,
      //   bodyColor: fontColor,
      //   displayColor: fontColor,
      // ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w900,
          fontSize: 22.sp,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w900,
          fontSize: 20.sp,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w800,
          fontSize: 18.sp,
        ),
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        titleMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        ),
        titleSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 18.sp,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 16.sp,
        ),
        bodySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
        ),
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w200,
          fontSize: 12.sp,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: 10.sp,
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
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
