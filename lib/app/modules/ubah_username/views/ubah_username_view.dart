import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahUsernameView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();

  UbahUsernameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // pastel blue
      appBar: AppBar(
        backgroundColor: const Color(0xFFE3F2FD),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          'Ganti Username',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username Baru',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: usernameController,
              style: const TextStyle(
                fontFamily: 'MochiyPopOne',
              ),
              decoration: InputDecoration(
                hintText: 'Masukkan username baru',
                filled: true,
                fillColor: Colors.white,
                hintStyle: const TextStyle(
                  fontFamily: 'MochiyPopOne',
                  color: Colors.black38,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  final newUsername = usernameController.text.trim();
                  if (newUsername.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Username tidak boleh kosong!',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(16),
                    );
                  } else {
                    // Simulasikan update username
                    Get.snackbar(
                      'Berhasil',
                      'Username berhasil diubah!',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.black,
                      margin: const EdgeInsets.all(16),
                    );
                    // Balik ke halaman sebelumnya setelah delay
                    Future.delayed(const Duration(seconds: 1), () {
                      Get.back();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent.shade100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'Simpan',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
