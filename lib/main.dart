import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';
import 'app/controllers/audio_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';

void main() {
  Get.put(AuthService());
  Get.put(AuthController());
  Get.put(ThemeController());
  Get.put(AudioController());
  Get.put(AudioController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Kelas Pintar',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xFFFFFBF3),
            colorScheme: ThemeData.light().colorScheme.copyWith(
                  primary: Colors.redAccent,
                  secondary: Colors.redAccent,
                ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.grey[900],
            colorScheme: ThemeData.dark().colorScheme.copyWith(
                  primary: Colors.redAccent,
                  secondary: Colors.redAccent,
                ),
          ),
          themeMode: themeController.themeMode.value,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        ));
  }
}
