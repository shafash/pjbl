import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatternsView extends StatelessWidget {
  final List<Map<String, dynamic>> patternData = [
    {
      'title': 'Pola Bilangan Genap',
      'pattern': '2, 4, 6, 8, ...',
      'explanation':
          'Ini adalah pola bilangan genap. Setiap angka bertambah 2.',
      'color': 0xFFA5D6A7,
    },
    {
      'title': 'Pola Bilangan Ganjil',
      'pattern': '1, 3, 5, 7, ...',
      'explanation':
          'Ini adalah pola bilangan ganjil. Setiap angka bertambah 2.',
      'color': 0xFF81D4FA,
    },
    {
      'title': 'Pola Bentuk',
      'pattern': '🔺 🔺 ⚪ 🔺 🔺 ⚪ ...',
      'explanation': 'Pola ini mengulang dua segitiga dan satu lingkaran.',
      'color': 0xFFFFF59D,
    },
    {
      'title': 'Pola Warna',
      'pattern': '🔴 🟢 🔵 🔴 🟢 🔵 ...',
      'explanation': 'Warna berulang setiap tiga: Merah, Hijau, Biru.',
      'color': 0xFFCE93D8,
    },
    {
      'title': 'Pola Campuran',
      'pattern': '🔺🔵 🔺🔴 🔺🟢 🔺🔵 ...',
      'explanation': 'Segitiga selalu tetap, warnanya berubah berurutan.',
      'color': 0xFFFFAB91,
    },
    {
      'title': 'Pola Naik Bertahap',
      'pattern': '1, 2, 4, 7, 11, ...',
      'explanation': 'Penambahan bertahap: +1, +2, +3, +4, ...',
      'color': 0xFFB39DDB,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pola & Urutan',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: patternData.length,
        itemBuilder: (context, index) {
          final item = patternData[index];
          return GestureDetector(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.white,
                  title: Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'MochiyPopOne',
                      color: Colors.redAccent,
                    ),
                  ),
                  content: Text(
                    item['explanation'],
                    style: const TextStyle(fontFamily: 'MochiyPopOne'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                          fontFamily: 'MochiyPopOne',
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(item['color']),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'MochiyPopOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['pattern'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'MochiyPopOne',
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
