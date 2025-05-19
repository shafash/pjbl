import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathSubmateriView extends StatelessWidget {
  final List<Map<String, String>> mathTopics = [
    {
      "title": "Bilangan",
      "image": "assets/math/numbers.png",
      "info": "Mari belajar mengenal dan menghitung bilangan!",
      "route": "" // Belum dibuat
    },
    {
      "title": "Penjumlahan",
      "image": "assets/math/addition.png",
      "info": "Penjumlahan adalah proses menambahkan dua atau lebih angka.",
      "route": "/addition"
    },
    {
      "title": "Pengurangan",
      "image": "assets/math/subtraction.png",
      "info": "Pengurangan adalah proses mengurangi angka dari angka lainnya.",
      "route": "" // Belum dibuat
    },
    {
      "title": "Perkalian",
      "image": "assets/math/multiplication.png",
      "info": "Perkalian adalah penjumlahan berulang dari angka yang sama.",
      "route": "" // Belum dibuat
    },
    {
      "title": "Pembagian",
      "image": "assets/math/division.png",
      "info":
          "Pembagian adalah membagi angka menjadi beberapa bagian yang sama.",
      "route": "" // Belum dibuat
    },
    {
      "title": "Bentuk Bangun",
      "image": "assets/math/shapes.png",
      "info": "Kenali bentuk seperti segitiga, persegi, dan lingkaran!",
      "route": "/shapes" // Contoh jika sudah punya halaman shapes
    },
    {
      "title": "Pola dan Urutan",
      "image": "assets/math/patterns.png",
      "info": "Temukan pola dan susunan angka atau bentuk yang berulang!",
      "route": "" // Belum dibuat
    },
    {
      "title": "Pengukuran",
      "image": "assets/math/measurement.png",
      "info": "Mari belajar mengukur panjang, berat, dan waktu.",
      "route": "" // Belum dibuat
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Matematika',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      backgroundColor: Colors.teal[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: mathTopics.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final topic = mathTopics[index];
            return GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: Text(topic['title']!),
                    content: Text(topic['info']!),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          topic['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      topic['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
