import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BentukView extends StatelessWidget {
  const BentukView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> shapes = [
      {
        'name': 'Lingkaran',
        'emoji': '⚪',
        'desc': 'Bentuk bulat seperti bola 🏀'
      },
      {
        'name': 'Persegi',
        'emoji': '🟥',
        'desc': 'Bentuk kotak seperti papan 🎲'
      },
      {
        'name': 'Segitiga',
        'emoji': '🔺',
        'desc': 'Bentuk dengan tiga sisi, seperti gunung ⛰️'
      },
      {
        'name': 'Persegi Panjang',
        'emoji': '▭',
        'desc': 'Seperti buku atau papan tulis 📘'
      },
      {
        'name': 'Oval',
        'emoji': '🥚',
        'desc': 'Seperti telur atau semangka kecil 🥚'
      },
      {
        'name': 'Bintang',
        'emoji': '⭐',
        'desc': 'Bentuk cantik seperti bintang di langit ✨'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menggambar Bentuk'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.orange.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: shapes.map((item) {
            return GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: item['name'],
                  titleStyle: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'MochiyPopOne',
                  ),
                  middleText: item['desc'],
                  middleTextStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'MochiyPopOne',
                  ),
                  backgroundColor: Colors.white,
                );
              },
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
                        item['name'],
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
