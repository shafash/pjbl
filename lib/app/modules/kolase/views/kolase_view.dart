import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KolaseView extends StatelessWidget {
  const KolaseView({super.key});

  final List<Map<String, String>> collageIdeas = const [
    {
      'title': 'Kolase Alam',
      'desc':
          'Gunakan daun, bunga, dan ranting kering untuk membuat gambar cantik.',
      'emoji': '🍂🌸🌿',
    },
    {
      'title': 'Kolase Warna-warni',
      'desc': 'Potong kertas warna-warni dan susun menjadi bentuk menarik.',
      'emoji': '🟠🟡🟢',
    },
    {
      'title': 'Kolase Binatang',
      'desc': 'Buat gambar binatang dari potongan kertas dan gambar sederhana.',
      'emoji': '🐶🐱🐰',
    },
    {
      'title': 'Kolase Makanan',
      'desc':
          'Susun gambar atau potongan kertas makanan favoritmu jadi karya seni.',
      'emoji': '🍎🍌🍰',
    },
    {
      'title': 'Kolase Bentuk Geometri',
      'desc':
          'Campurkan berbagai bentuk seperti lingkaran, segitiga, dan persegi.',
      'emoji': '🔺⚪⬛',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kolase Kreatif'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade50, Colors.pink.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.separated(
          itemCount: collageIdeas.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = collageIdeas[index];
            return GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: item['title']!,
                  titleStyle: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 22,
                  ),
                  middleText: item['desc']!,
                  middleTextStyle: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                  backgroundColor: Colors.white,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      item['emoji']!,
                      style: const TextStyle(fontSize: 48),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
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
