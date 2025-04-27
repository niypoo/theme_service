import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            TextStyle(color: primaryColor),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(color: primaryColor),
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontFamily: fontName,
            color: fontColor,
          ),
        ),
      ),
      iconTheme: IconThemeData(color: iconColor, size: (iconSize ?? 16)),
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
        ),
        displayMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        displaySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),

        // HEADLINE
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),

        // TITLE
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        titleMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        titleSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),

        // BODY
        bodyLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        bodySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),

        // LABEL
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
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
        ),
        actionsIconTheme: IconThemeData(
          color: iconColor,
        ),
        titleTextStyle: TextStyle(
          fontFamily: fontName,
          color: primaryColor,
          // fontFeatures: const <FontFeature>[
          //   FontFeature.enable('smcp'),
          // ],
        ),
      ),
    );
  }
}
