import 'package:get/get.dart';
import '../services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  String? redirect(String? route) {
    final authService = AuthService.to;

    if (!authService.isLoggedIn.value) {
      return '/login';
    }
    return null;
  }
}
