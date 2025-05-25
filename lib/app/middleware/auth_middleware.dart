import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService =
        Get.isRegistered<AuthService>() ? Get.find<AuthService>() : null;

    if (authService == null || !authService.isLoggedIn.value) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    return null;
  }
}
