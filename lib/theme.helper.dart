import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

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
    double fontSizeRatio = 1,
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
            TextStyle(color: primaryColor, fontSize: (12 * fontSizeRatio)),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(color: primaryColor, fontSize: (12 * fontSizeRatio)),
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 13 * fontSizeRatio,
            fontFamily: fontName,
            color: fontColor,
          ),
        ),
      ),
      iconTheme: IconThemeData(color: iconColor, size: (iconSize ?? 16) * fontSizeRatio),
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
          fontSize: 42 * fontSizeRatio,
        ),
        displayMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: 36 * fontSizeRatio,
        ),
        displaySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w100,
          fontSize: 33 * fontSizeRatio,
        ),

        // HEADLINE
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w800,
          fontSize: 24 * fontSizeRatio,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 20 * fontSizeRatio,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 17 * fontSizeRatio,
        ),

        // TITLE
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 16 * fontSizeRatio,
        ),
        titleMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 14 * fontSizeRatio,
        ),
        titleSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 12 * fontSizeRatio,
        ),

        // BODY
        bodyLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 12 * fontSizeRatio,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 11 * fontSizeRatio,
        ),
        bodySmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 10 * fontSizeRatio,
        ),

        // LABEL
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w600,
          fontSize: 11 * fontSizeRatio,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w400,
          fontSize: 10 * fontSizeRatio,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: fontColor,
          fontWeight: FontWeight.w300,
          fontSize: 9 * fontSizeRatio,
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
          size: 18 * fontSizeRatio,
        ),
        actionsIconTheme: IconThemeData(
          color: iconColor,
          size: 18 * fontSizeRatio,
        ),
        titleTextStyle: TextStyle(
          fontFamily: fontName,
          color: primaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 17 * fontSizeRatio,
          // fontFeatures: const <FontFeature>[
          //   FontFeature.enable('smcp'),
          // ],
        ),
      ),
    );
  }
}
