import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeDataHelper {
  static ThemeData create(
    ThemeData theme,
    double scalablePixel, {
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
            TextStyle(color: primaryColor, fontSize: (12 * scalablePixel)),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(color: primaryColor, fontSize: (12 * scalablePixel)),
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 18 * scalablePixel,
            fontFamily: fontName,
            color: fontColor,
          ),
        ),
      ),
      iconTheme: IconThemeData(
          color: iconColor, size: (iconSize ?? 16) * scalablePixel),
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
          fontWeight: FontWeight.w100,
          fontSize: scalablePixel * 40,
        ),
        displayMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: scalablePixel * 38,
        ),
        displaySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: scalablePixel * 34,
        ),

        // HEADLINE
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: scalablePixel * 26,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: scalablePixel * 20,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: scalablePixel * 15,
        ),

        // TITLE
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: scalablePixel * 24,
        ),
        titleMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: scalablePixel * 21,
        ),
        titleSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: scalablePixel * 18,
        ),

        // BODY
        bodyLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: scalablePixel * 17,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: scalablePixel * 15,
        ),
        bodySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: scalablePixel * 13,
        ),

        // LABEL
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: scalablePixel * 12,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: scalablePixel * 11,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: scalablePixel * 9,
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
          size: 18 * scalablePixel,
        ),
        actionsIconTheme: IconThemeData(color: iconColor),
        titleTextStyle: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.bold,
          fontSize: (iconSize ?? 16) * scalablePixel,
        ),
      ),
    );
  }
}
