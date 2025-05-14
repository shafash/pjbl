import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class MateriView extends StatelessWidget {
  const MateriView({super.key});

  @override
  Widget build(BuildContext context) {
    final materiList = [
      {
        'title': 'English',
        'icon': 'assets/english.png',
        'route': Routes.ENGLISH_SUBMATERI,
      },
      {'title': 'Math', 'icon': 'assets/math.png', 'route': null},
      {'title': 'IPA', 'icon': 'assets/ipa.png', 'route': null},
      {'title': 'IPS', 'icon': 'assets/ips.png', 'route': null},
      {
        'title': 'Bahasa Indonesia',
        'icon': 'assets/bahasa indonesia.png',
        'route': null,
      },
      {'title': 'Seni', 'icon': 'assets/seni.png', 'route': null},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Materi Pembelajaran',
          style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children:
              materiList.map((materi) {
                return GestureDetector(
                  onTap: () {
                    final route = materi['route'];
                    if (route != null) {
                      Get.toNamed(route);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(materi['icon']!, height: 80),
                        const SizedBox(height: 10),
                        Text(
                          materi['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
