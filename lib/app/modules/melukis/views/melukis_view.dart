import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MelukisView extends StatelessWidget {
  const MelukisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Melukis Bebas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.yellow.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Yuk, berkreasi dengan warna dan bentuk sesukamu! 🎨✨',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MochiyPopOne',
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Di sini nanti bisa dibuat kanvas menggambar interaktif (placeholder).',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MochiyPopOne',
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Get.snackbar(
                  'Coming Soon',
                  'Fitur melukis interaktif akan segera hadir! 🎉',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.pink.shade100,
                  colorText: Colors.black87,
                  duration: const Duration(seconds: 3),
                );
              },
              icon: const Icon(Icons.brush),
              label: const Text(
                'Mulai Melukis',
                style: TextStyle(fontFamily: 'MochiyPopOne'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
