import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnglishSubmateriView extends StatelessWidget {
  const EnglishSubmateriView({Key? key}) : super(key: key);

  final subtopics = const [
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
      appBar: AppBar(
        title: const Text('English Topics'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children:
            subtopics.map((topic) {
              return GestureDetector(
                onTap: () {
                  if (topic['label'] == 'alphabet') {
                    Get.toNamed('/english-alphabet');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.brown.shade50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(topic['image']!, height: 80),
                      const SizedBox(height: 8),
                      Text(
                        topic['label']!.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
