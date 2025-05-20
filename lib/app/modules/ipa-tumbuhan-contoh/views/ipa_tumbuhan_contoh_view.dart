import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaTumbuhanContohView extends StatelessWidget {
  final List<Map<String, String>> plants = [
    {
      'name': 'Pohon Mangga',
      'image': 'assets/ipa/mango_tree.png',
      'desc': 'Pohon besar dengan buah manis dan daun lebat.',
    },
    {
      'name': 'Bunga Matahari',
      'image': 'assets/ipa/sunflower.png',
      'desc': 'Bunga besar berwarna kuning yang suka matahari.',
    },
    {
      'name': 'Rumput',
      'image': 'assets/ipa/grass.png',
      'desc': 'Tumbuhan pendek yang tumbuh di tanah.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Tumbuhan', style: GoogleFonts.mochiyPopOne()),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: Image.asset(plant['image']!, height: 50),
              title: Text(plant['name']!, style: GoogleFonts.mochiyPopOne()),
              subtitle: Text(plant['desc']!),
            ),
          );
        },
      ),
    );
  }
}
