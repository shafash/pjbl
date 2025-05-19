import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegetablesView extends StatefulWidget {
  const VegetablesView({super.key});

  @override
  State<VegetablesView> createState() => _VegetablesViewState();
}

class _VegetablesViewState extends State<VegetablesView>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> vegetables = [
    {'name': 'Carrot', 'image': 'assets/vegetables/carrot.png'},
    {'name': 'Tomato', 'image': 'assets/vegetables/tomato.png'},
    {'name': 'Broccoli', 'image': 'assets/vegetables/broccoli.png'},
    {'name': 'Potato', 'image': 'assets/vegetables/potato.png'},
    {'name': 'Onion', 'image': 'assets/vegetables/onion.png'},
    {'name': 'Corn', 'image': 'assets/vegetables/corn.png'},
    {'name': 'Cabbage', 'image': 'assets/vegetables/cabbage.png'},
    {'name': 'Spinach', 'image': 'assets/vegetables/spinach.png'},
    {'name': 'Cucumber', 'image': 'assets/vegetables/cucumber.png'},
    {'name': 'Eggplant', 'image': 'assets/vegetables/eggplant.png'},
    {'name': 'Peas', 'image': 'assets/vegetables/peas.png'},
    {'name': 'Pumpkin', 'image': 'assets/vegetables/pumpkin.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // Light green
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        title: const Text(
          'Vegetables',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vegetables.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final veg = vegetables[index];
          return AnimatedContainer(
            duration: Duration(milliseconds: 300 + (index * 100)),
            curve: Curves.easeIn,
            child: GestureDetector(
              onTap: () => _showVegetablePopup(index),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
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
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          veg['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      veg['name']!,
                      style: const TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 16,
                        color: Colors.green,
                        shadows: [
                          Shadow(
                            color: Colors.lightGreen,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showVegetablePopup(int index) {
    final veg = vegetables[index];
    final isLast = index == vegetables.length - 1;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.white,
        title: Text(
          veg['name']!,
          style: const TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
            color: Colors.green,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(veg['image']!, height: 100),
            const SizedBox(height: 12),
            Text(
              _getVegetableInfo(veg['name']!),
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
              style: TextStyle(color: Colors.green),
            ),
          ),
          if (!isLast)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Get.back();
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (!mounted) return;
                  _showVegetablePopup(index + 1);
                });
              },
              child: const Text('Next'),
            ),
        ],
      ),
    );
  }

  String _getVegetableInfo(String name) {
    switch (name) {
      case 'Carrot':
        return 'Carrots are orange and help keep your eyes healthy.';
      case 'Tomato':
        return 'Tomatoes are red and often used in cooking.';
      case 'Broccoli':
        return 'Broccoli is green and full of Vitamin C.';
      case 'Potato':
        return 'Potatoes grow underground and can be fried or boiled.';
      case 'Onion':
        return 'Onions are used in many dishes to add flavor.';
      case 'Corn':
        return 'Corn is yellow and sweet, often eaten on the cob.';
      case 'Cabbage':
        return 'Cabbage is leafy and full of fiber.';
      case 'Spinach':
        return 'Spinach makes you strong like Popeye!';
      case 'Cucumber':
        return 'Cucumbers are cool and juicy, great in salads.';
      case 'Eggplant':
        return 'Eggplants are purple and used in many tasty dishes.';
      case 'Peas':
        return 'Peas are small, round, and sweet.';
      case 'Pumpkin':
        return 'Pumpkins are big and orange, often used in soup or pie!';
      default:
        return 'This is a healthy and tasty vegetable!';
    }
  }
}
