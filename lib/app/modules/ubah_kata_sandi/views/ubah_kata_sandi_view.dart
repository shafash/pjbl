import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahKataSandiView extends StatelessWidget {
  UbahKataSandiView({super.key});

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final RxBool isObscureOld = true.obs;
  final RxBool isObscureNew = true.obs;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Ubah Kata Sandi'),
        backgroundColor: isDark ? Colors.grey[900] : Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan kata sandi lama dan baru',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            Obx(
              () => TextField(
                controller: oldPasswordController,
                obscureText: isObscureOld.value,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Lama',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscureOld.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => isObscureOld.value = !isObscureOld.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => TextField(
                controller: newPasswordController,
                obscureText: isObscureNew.value,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Baru',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscureNew.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => isObscureNew.value = !isObscureNew.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  final oldPass = oldPasswordController.text.trim();
                  final newPass = newPasswordController.text.trim();
                  if (oldPass.isEmpty || newPass.isEmpty) {
                    Get.snackbar('Gagal', 'Semua field harus diisi');
                  } else {
                    // Simulasi ubah password
                    Get.snackbar('Berhasil', 'Kata sandi berhasil diubah');
                    Get.back(); // kembali ke halaman sebelumnya
                  }
                },
                child: const Text(
                  'Simpan Perubahan',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
