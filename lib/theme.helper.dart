import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patata_responsive/patata_responsive.dart';

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
    double? iconSize,
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
          textStyle: WidgetStateProperty.all(
            TextStyle(color: primaryColor, fontSize: (12.sp)),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(color: primaryColor, fontSize: (12.sp)),
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
      iconTheme: IconThemeData(color: iconColor, size: (iconSize ?? 16).sp),
      // textTheme: Get.textTheme.apply(
      //   fontFamily: fontName,
      //   bodyColor: fontColor,
      //   displayColor: fontColor,
      // ),
      textTheme: TextTheme(
        // display
        displayLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w200,
          fontSize: 42.sp,
        ),
        displayMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: 36.sp,
        ),
        displaySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: 33.sp,
        ),

        // HEADLINE
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w800,
          fontSize: 24.sp,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 17.sp,
        ),

        // TITLE
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
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),

        // BODY
        bodyLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 11.sp,
        ),
        bodySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
        ),

        // LABEL
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 11.sp,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 9.sp,
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
        iconTheme: IconThemeData(
          color: iconColor,
          size: 18.sp,
        ),
        actionsIconTheme: IconThemeData(
          color: iconColor,
          size: 18.sp,
        ),
        titleTextStyle: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
