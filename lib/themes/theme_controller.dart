import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController {
  static Future<void> toggleThemeMode() async {
    final prefs = Get.find<SharedPreferences>();

    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      await prefs.setBool('isPrefDarkMode', false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      await prefs.setBool('isPrefDarkMode', true);
    }
  }

  static ThemeMode prefThemeMode() {
    final prefs = Get.find<SharedPreferences>();

    if (prefs.getBool('isPrefDarkMode') != null) {
      return prefs.getBool('isPrefDarkMode')! ? ThemeMode.dark : ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }
}
