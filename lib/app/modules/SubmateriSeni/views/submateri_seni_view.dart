import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan sudah import

class SubmateriSeniView extends StatelessWidget {
  const SubmateriSeniView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> submateri = [
      {'title': 'Mengenal Warna', 'emoji': '🎨', 'route': '/warna'},
      {'title': 'Menggambar Bentuk', 'emoji': '🖍️', 'route': '/bentuk'},
      {'title': 'Melukis Bebas', 'emoji': '🖌️', 'route': '/melukis'},
      {'title': 'Kolase Kreatif', 'emoji': '✂️', 'route': '/kolase'},
      {'title': 'Kriya Sederhana', 'emoji': '🧵', 'route': '/kriya'},
      {'title': 'Ekspresi Wajah', 'emoji': '🎭', 'route': '/ekspresi_seni'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submateri Seni',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink.shade300,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: submateri.map((item) {
            return GestureDetector(
              onTap: () => Get.toNamed(item['route']),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item['emoji'],
                        style: const TextStyle(fontSize: 48),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'MochiyPopOne',
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
