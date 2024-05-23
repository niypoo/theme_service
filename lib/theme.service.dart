import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_service/localStorage.service.dart';
import 'package:theme_service/models/theme.model.dart';

class ThemeService extends GetxService {
  //share controller in to
  static ThemeService get to => Get.find();

  //map of themes light/dark
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final List<ThemeX> extraThemes;

  //current form settings table  // default is auto
  String? currentTheme =
      LocaleStorageService.to.instance.read('theme') ?? 'Auto';

  // get isDarkMode mode
  bool get isDark =>
      Get.isDarkMode || Get.isPlatformDarkMode || currentTheme == 'Dark';

  ///return light them if user set auto/light or dark if user set them as dark
  ThemeData? get getLightTheme => lightTheme;

  ///in case user set auto return dark theme to make dark theme as dark theme
  ThemeData? get getDarkTheme => darkTheme;

  // constructor
  ThemeService({
    required this.lightTheme,
    required this.darkTheme,
    this.extraThemes = const [],
  });

  Future<ThemeService> init() async {
    // Android change navigation and status bar color
    setAndroidBarsColors();
    return this;
  }

  // return custom them as user choose
  // this get use it only if there is ability in app that
  // make user change theme like from setting
  ThemeData get getCustomTheme {
    // if current null return light as default
    if (currentTheme == null || currentTheme == 'Auto') {
      return isDark ? darkTheme : lightTheme;
    } else if (currentTheme == 'Dark') {
      return darkTheme;
    } else if (currentTheme == 'Light') {
      return lightTheme;
    } else {
      // return custom
      return getExtraTheme('currentTheme').theme;
    }
  }

  ThemeX getExtraTheme(String? themeName) =>
      extraThemes.firstWhere((theme) => theme.name == themeName,
          orElse: () => extraThemes.first);

  ///to change instant theme option with out load
  ///from settings and notify listener
  Future<void> changeTheme(String themeName) async {
    // set theme name
    currentTheme = themeName;

    // get theme
    ThemeData theme = getCustomTheme;

    // change theme
    Get.changeTheme(theme);

    // store theme name
    await LocaleStorageService.to.instance.write('theme', themeName);

    // this delay fix card and some element have not color changes
    await Future.delayed(const Duration(milliseconds: 300));

    Get.forceAppUpdate();
  }

  setAndroidBarsColors() {
    if (Platform.isAndroid) {
      // define style depend on current theme
      final SystemUiOverlayStyle style =
          isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;

      // set the style with change color of bars to scaffold
      SystemChrome.setSystemUIOverlayStyle(
        style.copyWith(
          systemNavigationBarColor: getCustomTheme.scaffoldBackgroundColor,
          statusBarColor: getCustomTheme.scaffoldBackgroundColor,
          systemNavigationBarIconBrightness:
              isDark ? Brightness.dark : Brightness.light,
        ),
      );
    }
  }
}
