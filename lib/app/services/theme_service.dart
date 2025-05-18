import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  final _themeMode = ThemeMode.light.obs;

  ThemeMode get themeMode => _themeMode.value;

  ThemeData get lightTheme =>
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.red);

  ThemeData get darkTheme =>
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.red);

  void toggleTheme() {
    _themeMode.value =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
