import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// * 主题色
class ThemeConfig {

  /// * 当前
  static Color currentColorTheme = defaultColor;

  /// * 默认
  static const Color defaultColor = Colors.black;

  static const String SP_COLOR_THEME_INDEX = "colorThemeIndex";

  /// * 可选
  static const List<Color> supportColors = [
    defaultColor,
    Colors.deepPurpleAccent,
    Colors.cyan,
    Colors.teal
  ];

  /// * 设置选择的主题色
  static setColorTheme(int colorThemeIndex) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(SP_COLOR_THEME_INDEX, colorThemeIndex);
  }

  /// * 获取当前主题色
  static Future<int> getColorThemeIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(SP_COLOR_THEME_INDEX);
  }
}
