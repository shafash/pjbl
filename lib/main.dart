import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // WAJIB
  Get.put(ThemeController()); // WAJIB SEBELUM runApp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.find(); // INI DI LUAR build()

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Kelas Pintar",
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
