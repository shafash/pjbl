import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:lottie/lottie.dart';
import 'package:kelas_pintar/app/modules/tugas/controllers/tugas_controller.dart'; // Ganti sesuai path kamu

class ProfilView extends StatelessWidget {
  final TugasController tugasController = Get.find<TugasController>();

  @override
  Widget build(BuildContext context) {
    final fotoTugas = tugasController.getFotoTugas();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/anak_sd.png'), // Sesuaikan path asset
            ),
            const SizedBox(height: 10),
            const Text(
              'Halo, Ananda!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Section: Daftar Foto Tugas
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '📸 Tugas yang Sudah Kamu Kumpulkan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            fotoTugas.isEmpty
                ? Column(
                    children: [
                      const Text(
                        'Belum ada tugas yang dikumpulkan.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Lottie.asset('assets/lottie/empty_box.json', height: 120),
                    ],
                  )
                : Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: fotoTugas.map((path) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),

            const SizedBox(height: 30),

            // Tombol ubah kata sandi
            ElevatedButton.icon(
              onPressed: () => Get.toNamed('/forgot-password'),
              icon: const Icon(Icons.lock_outline),
              label: const Text('Ubah Kata Sandi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // Tombol logout
            ElevatedButton.icon(
              onPressed: () => Get.toNamed('/logoutconfirm'),
              icon: const Icon(Icons.logout),
              label: const Text('Keluar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
