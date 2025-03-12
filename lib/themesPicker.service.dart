import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/actionSheet.helper.dart';
import 'package:get/get.dart';
import 'package:theme_service/theme.service.dart';

class ThemesPickerService {
  // open picker and return pay load theme name as string
  static Future<String?> show() async => await ActionSheetHelper.show(
        currentValue: ThemeService.to.currentTheme,
        options: [
          ActionSheetOption(
            title: 'THEME.Light'.tr,
            value: 'Light',
          ),
          ActionSheetOption(
            title: 'THEME.Dark'.tr,
            value: 'Dark',
          ),
          if (ThemeService.to.extraThemes.isNotEmpty)
            ...ThemeService.to.extraThemes
                .map(
                  (theme) => ActionSheetOption(
                    title: theme.name.tr,
                    value: theme.name,
                  ),
                )
                .toList(),
          ActionSheetOption(
            title: 'THEME.System'.tr,
            value: 'Auto',
          ),
        ],
        title: 'THEME.Theme'.tr,
        subTitle: 'THEME.Change the theme of app to fit your taste.'.tr,
      ) as String?;
}
