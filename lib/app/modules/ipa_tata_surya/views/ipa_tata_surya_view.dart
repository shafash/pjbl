import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaTataSuryaView extends StatelessWidget {
  final List<Map<String, dynamic>> tataSuryaItems = [
    {
      'name': 'Matahari',
      'image': 'assets/tata_surya/sun.png',
      'desc': 'Pusat tata surya kita yang memancarkan cahaya dan panas.',
    },
    {
      'name': 'Merkurius',
      'image': 'assets/tata_surya/mercurius.png',
      'desc': 'Planet terdekat dari Matahari dan terkecil di tata surya.',
    },
    {
      'name': 'Venus',
      'image': 'assets/tata_surya/venus.png',
      'desc': 'Planet yang sangat panas dan disebut saudara Bumi.',
    },
    {
      'name': 'Bumi',
      'image': 'assets/tata_surya/earth.png',
      'desc': 'Satu-satunya planet tempat tinggal manusia.',
    },
    {
      'name': 'Mars',
      'image': 'assets/tata_surya/mars.png',
      'desc': 'Disebut planet merah, punya gunung tertinggi di tata surya.',
    },
    {
      'name': 'Jupiter',
      'image': 'assets/tata_surya/jupiter.png',
      'desc': 'Planet terbesar dengan banyak bulan mengelilinginya.',
    },
    {
      'name': 'Saturnus',
      'image': 'assets/tata_surya/saturnus.png',
      'desc': 'Dikenal dengan cincin besar yang mengelilinginya.',
    },
    {
      'name': 'Uranus',
      'image': 'assets/tata_surya/uranus.png',
      'desc': 'Planet yang berputar miring dan berwarna kebiruan.',
    },
    {
      'name': 'Neptunus',
      'image': 'assets/tata_surya/neptunus.png',
      'desc': 'Planet terjauh dari Matahari dengan angin sangat kencang.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tata Surya',
          style: GoogleFonts.mochiyPopOne(),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tataSuryaItems.length,
        itemBuilder: (context, index) {
          final item = tataSuryaItems[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black26,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  item['image'],
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: GoogleFonts.mochiyPopOne(
                          fontSize: 20,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['desc'],
                        style: GoogleFonts.roboto(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
