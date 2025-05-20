import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaHewanContohView extends StatelessWidget {
  final List<Map<String, String>> animals = [
    {
      'name': 'Kucing',
      'image': 'assets/ipa/cat.png',
      'desc': 'Hewan peliharaan lucu yang suka tidur dan bermain.',
    },
    {
      'name': 'Sapi',
      'image': 'assets/ipa/cow.png',
      'desc': 'Hewan ternak penghasil susu.',
    },
    {
      'name': 'Burung',
      'image': 'assets/ipa/bird.png',
      'desc': 'Hewan berbulu yang bisa terbang.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Hewan', style: GoogleFonts.mochiyPopOne()),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: Image.asset(animal['image']!, height: 50),
              title: Text(animal['name']!, style: GoogleFonts.mochiyPopOne()),
              subtitle: Text(animal['desc']!),
            ),
          );
        },
      ),
    );
  }
}
