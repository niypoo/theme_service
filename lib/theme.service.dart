import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_service/localStorage.service.dart';
import 'package:theme_service/models/theme.model.dart';
import 'package:theme_service/theme.helper.dart';

class ThemeService extends GetxService {
  //share controller in to
  static ThemeService get to => Get.find();

  final String fontName;
  final Color primary;
  final Color secondary;

  // constructor
  ThemeService({
    required this.fontName,
    required this.secondary,
    required this.primary,
  });

  //current form settings table  // default is auto
  String? currentTheme;

  //map of themes light/dark
  final List<ThemeX> themes = [];

  Future<ThemeService> init({
    List<ThemeX> additionalThemes = const [],
  }) async {
    //get theme from locale storage
    currentTheme =
        currentTheme = LocaleStorageService.to.instance.read('theme') ?? 'Auto';

    // Inject default themes Light/Dark
    themes.addAll(
      [
        ThemeX(
          name: 'Light',
          theme: ThemeDataHelper.create(
            ThemeData.light(),
            fontName: fontName,
            primaryColor: primary,
            secondaryColor: secondary,
            scaffoldBackgroundColor: Colors.white,
            cardColor: const Color(0xffF4F4F4),
            appBarColor: Colors.white,
            brightness: Brightness.light,
            fontColor: const Color(0xff333333),
            secondaryTextColor: Colors.white,
            iconColor: const Color(0xff333333),
            secondaryIconColor: Colors.white,
          ),
        ),
        ThemeX(
          name: 'Dark',
          theme: ThemeDataHelper.create(
            ThemeData.dark(),
            fontName: fontName,
            primaryColor: primary,
            secondaryColor: secondary,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xff040404),
            appBarColor: const Color(0xff040404),
            cardColor: const Color(0xff161616),
            fontColor: Colors.grey[500],
            iconColor: Colors.grey[500],
            secondaryTextColor: Colors.grey[200],
            secondaryIconColor: Colors.grey[200],
          ),
        ),
        // inject more themes
        ...additionalThemes
      ],
    );

    return this;
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
    print('${getTheme('Light').name} $currentTheme');
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
