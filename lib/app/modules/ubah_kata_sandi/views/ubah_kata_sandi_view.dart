import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahPasswordView extends StatefulWidget {
  const UbahPasswordView({super.key});

  @override
  State<UbahPasswordView> createState() => _UbahPasswordViewState();
}

class _UbahPasswordViewState extends State<UbahPasswordView> {
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  void _submit() {
    final oldPass = oldPassController.text.trim();
    final newPass = newPassController.text.trim();
    final confirmPass = confirmPassController.text.trim();

    if (oldPass.isEmpty || newPass.isEmpty || confirmPass.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua kolom wajib diisi!',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    if (newPass != confirmPass) {
      Get.snackbar(
        'Oops!',
        'Kata sandi baru tidak cocok!',
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    Get.snackbar(
      'Berhasil',
      'Kata sandi berhasil diubah!',
      backgroundColor: Colors.greenAccent,
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0), // pastel peach
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF3E0),
        elevation: 0,
        title: const Text(
          'Ubah Kata Sandi',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildPasswordField('Kata Sandi Lama', oldPassController),
            const SizedBox(height: 20),
            _buildPasswordField('Kata Sandi Baru', newPassController),
            const SizedBox(height: 20),
            _buildPasswordField('Konfirmasi Kata Sandi', confirmPassController),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent.shade100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.lock, color: Colors.white),
              label: const Text(
                'Simpan',
                style: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: true,
          style: const TextStyle(fontFamily: 'MochiyPopOne'),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: '•••••••',
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
      ],
    );
  }
}
