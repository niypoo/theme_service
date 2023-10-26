import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_service/localStorage.service.dart';
import 'package:theme_service/models/theme.model.dart';

class ThemeService extends GetxService {
  //share controller in to
  static ThemeService get to => Get.find();

  //map of themes light/dark
  final List<ThemeX> themes;

  // constructor
  ThemeService({
    required this.themes,
  });

  //current form settings table  // default is auto
  String? currentTheme;

  Future<ThemeService> init() async {
    //get theme from locale storage
    currentTheme =
        currentTheme = LocaleStorageService.to.instance.read('theme') ?? 'Auto';

    return this;
  }

  applyThemes(List<ThemeX> themes) {
    themes.addAll(themes);
  }

  // get isDarkMode mode
  bool get isDark =>
      Get.isDarkMode || Get.isPlatformDarkMode || currentTheme == 'Dark';

  ///return light them if user set auto/light or dark if user set them as dark
  ThemeData? get getLightTheme => getTheme('Light').theme;

  ///in case user set auto return dark theme to make dark theme as dark theme
  ThemeData? get getDarkTheme => getTheme('Dark').theme;

  // return custom them as user choose
  // this get use it only if there is ability in app that
  // make user change theme like from setting
  ThemeData? get getCustomTheme {
    // if current null return light as default
    if (currentTheme == null || currentTheme == 'Auto') {
      return getTheme('Light').theme;
    }
    // return custom
    return getTheme(currentTheme).theme;
  }

  ThemeX getTheme(String? themeName) =>
      themes.firstWhere((theme) => theme.name == themeName,
          orElse: () => themes.first);

  ///to change instant theme option with out load
  ///from settings and notify listener
  Future<void> changeTheme(String theme) async {
    currentTheme = theme;
    Get.changeTheme(getTheme(theme).theme!);
    await LocaleStorageService.to.instance.write('theme', theme);

    // this delay fix card and some element have not color changes
    await Future.delayed(const Duration(milliseconds: 300));
    Get.forceAppUpdate();
  }
}
