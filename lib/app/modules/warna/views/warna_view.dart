import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarnaView extends StatelessWidget {
  const WarnaView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> colors = [
      {'name': 'Merah', 'color': Colors.red, 'desc': 'Warna hati dan apel 🍎'},
      {'name': 'Kuning', 'color': Colors.yellow, 'desc': 'Warna matahari ☀️'},
      {
        'name': 'Biru',
        'color': Colors.blue,
        'desc': 'Warna langit dan laut 🌊'
      },
      {
        'name': 'Hijau',
        'color': Colors.green,
        'desc': 'Warna daun dan rumput 🌿'
      },
      {'name': 'Ungu', 'color': Colors.purple, 'desc': 'Warna anggur 🍇'},
      {'name': 'Jingga', 'color': Colors.orange, 'desc': 'Warna jeruk 🍊'},
      {
        'name': 'Putih',
        'color': Colors.white,
        'desc': 'Warna kapas dan awan ☁️'
      },
      {'name': 'Hitam', 'color': Colors.black, 'desc': 'Warna bayangan 🕶️'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengenal Warna'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.purple.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: colors.map((item) {
            return GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: '🎉 ${item['name']}!',
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: item['color'],
                    child: item['color'] == Colors.white
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'MochiyPopOne',
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
