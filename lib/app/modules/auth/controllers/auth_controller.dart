import 'package:get/get.dart';
import 'package:kelas_pintar/app/services/auth_service.dart';

class AuthController extends GetxController {
  final authService = AuthService.to;

  var email = ''.obs;
  var password = ''.obs;

  String? validateEmail(String value) {
    if (!value.contains('@') || !value.contains('.')) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  Future<bool> login(String emailInput, String passwordInput) async {
    try {
      await authService.login(emailInput, passwordInput);
      if (authService.isLoggedIn.value) {
        email.value = emailInput;
        password.value = passwordInput;
        return true;
      }
    } catch (e) {
      // Bisa pakai Get.snackbar di sini juga kalau mau
    }
    return false;
  }

  Future<bool> register(
      String emailInput, String passwordInput, String nameInput) async {
    if (emailInput.isNotEmpty &&
        passwordInput.length >= 6 &&
        nameInput.isNotEmpty) {
      authService.isLoggedIn.value = true;
      email.value = emailInput;
      password.value = passwordInput;
      return true;
    }
    return false;
  }

  void logout() {
    authService.logout();
    email.value = '';
    password.value = '';
  }
}
