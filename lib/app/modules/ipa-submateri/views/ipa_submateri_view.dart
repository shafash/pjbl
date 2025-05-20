import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class IpaSubmateriView extends StatelessWidget {
  final List<Map<String, dynamic>> subMateriList = [
    {
      'title': 'Bagian Tubuh Manusia',
      'route': Routes.IPA_BAGIAN_TUBUH,
      'icon': Icons.accessibility_new,
      'color': Colors.pinkAccent
    },
    {
      'title': 'Indera Manusia',
      'route': Routes.IPA_INDERA_MANUSIA,
      'icon': Icons.remove_red_eye,
      'color': Colors.teal
    },
    {
      'title': 'Tumbuhan & Hewan',
      'route': Routes.IPA_TUMBUHAN_HEWAN,
      'icon': Icons.nature,
      'color': Colors.green
    },
    {
      'title': 'Benda & Sifatnya',
      'route': Routes.IPA_BENDA_SIFAT,
      'icon': Icons.category,
      'color': Colors.orange
    },
    {
      'title': 'Tata Surya',
      'route': Routes.IPA_TATA_SURYA,
      'icon': Icons.public,
      'color': Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Submateri IPA',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subMateriList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = subMateriList[index];
          return GestureDetector(
            onTap: () => Get.toNamed(item['route']),
            child: Container(
              decoration: BoxDecoration(
                color: item['color'].withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 48, color: Colors.white),
                  const SizedBox(height: 12),
                  Text(
                    item['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
