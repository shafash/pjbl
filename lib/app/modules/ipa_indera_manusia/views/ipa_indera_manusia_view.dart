import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaInderaManusiaView extends StatelessWidget {
  final List<Map<String, String>> senses = [
    {
      'name': 'Penglihatan',
      'description': 'Menggunakan mata untuk melihat.',
      'image': 'assets/senses/eye.png',
    },
    {
      'name': 'Pendengaran',
      'description': 'Menggunakan telinga untuk mendengar.',
      'image': 'assets/senses/ear.png',
    },
    {
      'name': 'Penciuman',
      'description': 'Menggunakan hidung untuk mencium bau.',
      'image': 'assets/senses/nose.png',
    },
    {
      'name': 'Perasa',
      'description': 'Menggunakan lidah untuk mengecap rasa.',
      'image': 'assets/senses/tongue.png',
    },
    {
      'name': 'Peraba',
      'description': 'Menggunakan kulit untuk merasakan sentuhan.',
      'image': 'assets/senses/skin.png',
    },
  ];

  final List<Color> pastelColors = [
    Color(0xFFFFC1CC),
    Color(0xFFB2EBF2),
    Color(0xFFFFF9C4),
    Color(0xFFD1C4E9),
    Color(0xFFC8E6C9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Indera Manusia',
          style: GoogleFonts.mochiyPopOne(),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: senses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final sense = senses[index];
            return GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: sense['name'] ?? '',
                  titleStyle: GoogleFonts.mochiyPopOne(fontSize: 20),
                  content: Column(
                    children: [
                      Image.asset(sense['image']!, height: 80),
                      const SizedBox(height: 10),
                      Text(
                        sense['description']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  radius: 16,
                  backgroundColor: Colors.white,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: pastelColors[index % pastelColors.length],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
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
                    Image.asset(sense['image']!, height: 60),
                    const SizedBox(height: 10),
                    Text(
                      sense['name']!,
                      style: GoogleFonts.mochiyPopOne(fontSize: 16),
                      textAlign: TextAlign.center,
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
