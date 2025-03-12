import 'package:flutter/material.dart';
import 'package:fly_ui/views/cards/setting.widget.dart';
import 'package:get/get.dart';
import 'package:theme_service/theme.service.dart';
import 'package:theme_service/themesPicker.service.dart';

class ThemeSettingCard extends StatefulWidget {
  const ThemeSettingCard({Key? key}) : super(key: key);

  @override
  State<ThemeSettingCard> createState() => _ThemeSettingCardState();
}

class _ThemeSettingCardState extends State<ThemeSettingCard> {
  @override
  Widget build(BuildContext context) {
    return FlySettingCard(
      title: 'THEME.Theme'.tr,
      onTap: () async {
        final String? theme = await ThemesPickerService.show();

        // skip
        if (theme == null) return;

        await ThemeService.to.changeTheme(theme);

        // update
        setState(() {});
      },
      trailing: Text(
        ThemeService.to.currentTheme!.tr,
        style: Get.textTheme.bodySmall,
      ),
    );
  }
}
