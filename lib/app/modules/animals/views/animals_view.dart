import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalsView extends StatefulWidget {
  const AnimalsView({super.key});

  @override
  State<AnimalsView> createState() => _AnimalsViewState();
}

class _AnimalsViewState extends State<AnimalsView>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> animals = [
    {'name': 'Cat', 'image': 'assets/animals/cat.png'},
    {'name': 'Dog', 'image': 'assets/animals/dog.png'},
    {'name': 'Elephant', 'image': 'assets/animals/elephant.png'},
    {'name': 'Giraffe', 'image': 'assets/animals/giraffe.png'},
    {'name': 'Lion', 'image': 'assets/animals/lion.png'},
    {'name': 'Monkey', 'image': 'assets/animals/monkey.png'},
    {'name': 'Panda', 'image': 'assets/animals/panda.png'},
    {'name': 'Penguin', 'image': 'assets/animals/penguin.png'},
    {'name': 'Rabbit', 'image': 'assets/animals/rabbit.png'},
    {'name': 'Tiger', 'image': 'assets/animals/tiger.png'},
    {'name': 'Zebra', 'image': 'assets/animals/zebra.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          'Animals',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: animals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final animal = animals[index];
          return GestureDetector(
            onTap: () => _showAnimalPopup(index),
            child: AnimatedScale(
              scale: 1,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child:
                            Image.asset(animal['image']!, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      animal['name']!,
                      style: const TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAnimalPopup(int index) {
    final animal = animals[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.white,
        title: Text(
          animal['name']!,
          style: const TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(animal['image']!, height: 100),
            const SizedBox(height: 12),
            Text(
              _getAnimalInfo(animal['name']!),
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
      ),
    );
  }

  String _getAnimalInfo(String name) {
    switch (name) {
      case 'Cat':
        return 'Cats love to sleep all day and purr when happy!';
      case 'Dog':
        return 'Dogs are loyal and love playing fetch!';
      case 'Elephant':
        return 'Elephants have long trunks and great memory!';
      case 'Giraffe':
        return 'Giraffes have long necks to reach high leaves!';
      case 'Lion':
        return 'Lions are known as the kings of the jungle!';
      case 'Monkey':
        return 'Monkeys swing from trees and love bananas!';
      case 'Panda':
        return 'Pandas are cuddly and eat lots of bamboo!';
      case 'Penguin':
        return 'Penguins waddle and slide on ice!';
      case 'Rabbit':
        return 'Rabbits hop around and have big ears!';
      case 'Tiger':
        return 'Tigers have stripes and love to swim!';
      case 'Zebra':
        return 'Zebras have unique black and white stripes!';
      default:
        return 'This animal is fun and interesting!';
    }
  }
}
