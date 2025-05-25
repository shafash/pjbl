import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import './app/modules/auth/controllers/auth_controller.dart';
import 'app/services/auth_service.dart';

void main() {
  Get.put(AuthService());
  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Auth App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFFBF3),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.redAccent,
              secondary: Colors.redAccent,
            ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    );
  }
}
