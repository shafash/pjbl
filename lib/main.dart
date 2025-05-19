import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/theme.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Registrasi AuthService agar bisa dipakai di mana saja
  Get.put(AuthService());

  runApp(const MyApp());
}

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Demo',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        ));
  }
}
