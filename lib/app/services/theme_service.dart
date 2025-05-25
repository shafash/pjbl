import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Ambil tema sekarang
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Cek apakah dark mode
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Ubah tema dan simpan ke box
  void switchTheme() {
    bool isDark = _loadThemeFromBox();
    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!isDark);
  }

  /// Simpan status tema
  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
}
