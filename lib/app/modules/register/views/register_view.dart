import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          // Membungkus seluruh konten dengan Center untuk membuatnya terpusat
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center, // Menyusun elemen secara vertikal di tengah
              crossAxisAlignment:
                  CrossAxisAlignment
                      .center, // Menyusun elemen secara horizontal di tengah
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color((0xFF7A1212)), // Menambahkan warna untuk judul
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Nama",
                    border:
                        OutlineInputBorder(), // Menambahkan border di sekitar text field
                    prefixIcon: Icon(Icons.person), // Ikon untuk input nama
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border:
                        OutlineInputBorder(), // Menambahkan border di sekitar text field
                    prefixIcon: Icon(Icons.email), // Ikon untuk input email
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border:
                        OutlineInputBorder(), // Menambahkan border di sekitar text field
                    prefixIcon: Icon(Icons.lock), // Ikon untuk input password
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color((0xFF7A1212)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                  onPressed: () {
                    Get.back(); // kembali ke login
                  },
                  child: const Text(
                    "Daftar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("Sudah punya akun? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
