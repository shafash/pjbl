import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';

class LogoutConfirmView extends StatelessWidget {
  const LogoutConfirmView({super.key}); // ✅ gunakan super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text('Konfirmasi Logout'), // ✅ pakai const
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Yakin ingin logout?', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                AuthService.to.logout();
                Get.offAllNamed('/login');
              },
              child: const Text('Ya, Logout'), // ✅ pakai const
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Batal'), // ✅ pakai const
            ),
          ],
        ),
      ),
    );
  }
}
