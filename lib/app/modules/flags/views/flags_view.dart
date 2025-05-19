import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlagsView extends StatelessWidget {
  FlagsView({super.key});

  final List<Map<String, String>> flags = [
    {'name': 'Indonesia', 'image': 'assets/flags/indonesia.png'},
    {'name': 'Japan', 'image': 'assets/flags/japan.png'},
    {'name': 'USA', 'image': 'assets/flags/usa.png'},
    {'name': 'UK', 'image': 'assets/flags/uk.png'},
    {'name': 'France', 'image': 'assets/flags/france.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Flags of the World',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: flags.length,
        itemBuilder: (context, index) {
          final flag = flags[index];
          return GestureDetector(
            onTap: () => _showFlagSheet(context, flag),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.blueAccent, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.asset(
                      flag['image']!,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    flag['name']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'MochiyPopOne',
                      color: Colors.blue,
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

  void _showFlagSheet(BuildContext context, Map<String, String> flag) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              flag['name']!,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'MochiyPopOne',
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(flag['image']!, height: 100),
            const SizedBox(height: 16),
            Text(
              _flagInfo(flag['name']!),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Rubik',
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _flagInfo(String name) {
    switch (name) {
      case 'Indonesia':
        return 'The flag of Indonesia is red and white.\nRed means bravery, white means purity.';
      case 'Japan':
        return 'Japan\'s flag has a red circle on white.\nIt represents the sun!';
      case 'USA':
        return 'Stars and stripes — red, white, and blue.\nThe USA has 50 stars and 13 stripes.';
      case 'UK':
        return 'The Union Jack is the UK flag.\nIt combines 3 different crosses!';
      case 'France':
        return 'Blue, white, and red — France\'s flag.\nEach color has meaning from the revolution.';
      default:
        return 'This is a beautiful flag!';
    }
  }
}
