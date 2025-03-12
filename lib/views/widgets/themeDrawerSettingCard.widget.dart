import 'package:flutter/material.dart';
import 'package:fly_ui/views/drawer/widgets/drawerButton.widget.dart';
import 'package:get/get.dart';
import 'package:theme_service/theme.service.dart';
import 'package:theme_service/themesPicker.service.dart';
import 'package:unicons/unicons.dart';

class ThemeDrawerSettingCard extends StatefulWidget {
  const ThemeDrawerSettingCard({Key? key}) : super(key: key);

  @override
  State<ThemeDrawerSettingCard> createState() => _ThemeDrawerSettingCardState();
}

class _ThemeDrawerSettingCardState extends State<ThemeDrawerSettingCard> {
  @override
  Widget build(BuildContext context) {
    return FlyDrawerButton(
      title: 'THEME.Theme'.tr,
      icon: UniconsLine.palette,
      value: ThemeService.to.currentTheme!.tr,
      onTap: () async {
        final String? theme = await ThemesPickerService.show();

        // skip
        if (theme == null) return;

        await ThemeService.to.changeTheme(theme);

        // update
        setState(() {});
      },
    );
  }
}
