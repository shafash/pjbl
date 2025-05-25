import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    // warna soft
    final softBackground = const Color(0xFFFFFBF3);
    final softTextColor = Colors.brown.shade700;
    final softAccent = Colors.orange.shade200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: softBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: softTextColor),
        title: Text(
          'Setting',
          style: GoogleFonts.mochiyPopOne(
            color: softTextColor,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: softBackground,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark mode toggle (dummy for now)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mode Gelap',
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 18,
                    color: softTextColor,
                  ),
                ),
                Obx(() {
                  // dummy reactive bool, replace with your controller if ada
                  final isDarkMode = false.obs;
                  return Switch(
                    value: isDarkMode.value,
                    onChanged: (val) {
                      // implementasi toggle nanti di sini
                      isDarkMode.value = val;
                      // misal: Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
                    },
                    activeColor: softAccent,
                  );
                }),
              ],
            ),
            const SizedBox(height: 30),

            // Pilihan Bahasa
            Text(
              'Bahasa',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 18,
                color: softTextColor,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: 'Indonesia',
              items: const [
                DropdownMenuItem(value: 'Indonesia', child: Text('Indonesia')),
                DropdownMenuItem(value: 'English', child: Text('English')),
              ],
              onChanged: (val) {
                // nanti implementasi penggantian bahasa
                Get.snackbar('Info', 'Fitur bahasa belum tersedia');
              },
            ),
            const SizedBox(height: 30),

            // Tentang aplikasi
            Text(
              'Tentang Aplikasi',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 18,
                color: softTextColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Versi 1.0.0\n© 2025 Kelas Pintar',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 14,
                color: softTextColor.withOpacity(0.7),
              ),
            ),
            const Spacer(),

            // Logout Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // logout logic (misal Get.offAllNamed('/login'))
                  Get.defaultDialog(
                    title: 'Konfirmasi Logout',
                    middleText: 'Apakah Anda yakin ingin keluar?',
                    textConfirm: 'Ya',
                    textCancel: 'Batal',
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      // misal:
                      Get.offAllNamed('/login');
                    },
                    onCancel: () {},
                  );
                },
                child: Text(
                  'Logout',
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
