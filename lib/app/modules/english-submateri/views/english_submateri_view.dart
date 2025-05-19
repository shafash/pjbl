import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnglishSubmateriView extends StatelessWidget {
  const EnglishSubmateriView({super.key});

  final List<Map<String, String>> subtopics = const [
    {'label': 'flags', 'image': 'assets/flags.png'},
    {'label': 'animals', 'image': 'assets/animals.png'},
    {'label': 'vegetables', 'image': 'assets/vegetables.png'},
    {'label': 'shapes', 'image': 'assets/shapes.png'},
    {'label': 'alphabet', 'image': 'assets/alpabet.png'},
    {'label': 'colors', 'image': 'assets/color.png'},
    {'label': 'fruits', 'image': 'assets/fruit.png'},
    {'label': 'clothes', 'image': 'assets/clothes.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBEE),
      appBar: AppBar(
        title: const Text(
          'English Topics',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: subtopics.map((topic) {
          return GestureDetector(
            onTap: () {
              switch (topic['label']) {
                case 'alphabet':
                  Get.toNamed('/english-alphabet');
                  break;
                case 'vegetables':
                  Get.toNamed('/vegetables');
                  break;
                case 'flags':
                  Get.toNamed('/flags');
                  break;
                case 'animals':
                  Get.toNamed('/animals');
                  break;
                case 'fruits':
                  Get.toNamed('/fruits');
                  break;
                case 'clothes':
                  Get.toNamed('/clothes');
                  break;
                case 'colors':
                  Get.toNamed('/colors');
                  break;
                case 'shapes':
                  Get.toNamed('/shapes');
                  break;
                default:
                  Get.snackbar(
                    'Belum Tersedia',
                    'Halaman ${topic['label']} belum tersedia',
                    backgroundColor: Colors.brown.shade100,
                    colorText: Colors.brown.shade800,
                  );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(topic['image']!, height: 80),
                  const SizedBox(height: 8),
                  Text(
                    topic['label']!.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 14,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
