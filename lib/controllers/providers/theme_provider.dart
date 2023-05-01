import 'package:flutter/cupertino.dart';
import 'package:state_management_provider/models/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isDark: false);

  void changeTheme() {
    themeModel.isDark = !themeModel.isDark;
    notifyListeners();
  }
}
