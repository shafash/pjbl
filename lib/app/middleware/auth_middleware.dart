import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    AuthService? authService;

    try {
      authService = Get.find<AuthService>();
    } catch (e) {
      authService = null;
    }

    if (authService == null || !(authService.isLoggedIn.value)) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    return null;
  }
}
