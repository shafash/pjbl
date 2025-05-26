import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LingkunganSekitarView extends StatelessWidget {
  const LingkunganSekitarView({super.key});

  // Menentukan warna teks yang kontras dengan warna latar belakang
  Color getContrastingTextColor(Color backgroundColor) {
    return ThemeData.estimateBrightnessForColor(backgroundColor) ==
            Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Rumah',
        'icon': Icons.home,
        'description': 'Tempat tinggal kita bersama keluarga.',
        'color': Colors.pink.shade100,
      },
      {
        'title': 'Sekolah',
        'icon': Icons.school,
        'description': 'Tempat belajar bersama teman dan guru.',
        'color': Colors.blue.shade100,
      },
      {
        'title': 'Taman',
        'icon': Icons.park,
        'description': 'Tempat bermain dan melihat tanaman.',
        'color': Colors.green.shade100,
      },
      {
        'title': 'Pasar',
        'icon': Icons.store,
        'description': 'Tempat membeli sayur, buah, dan makanan.',
        'color': Colors.orange.shade100,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: Text(
          'Lingkungan Sekitar',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 20,
            color: Colors.green.shade800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final Color textColor = getContrastingTextColor(item['color']);

          return Card(
            color: item['color'],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: Icon(
                item['icon'],
                size: 40,
                color: textColor,
              ),
              title: Text(
                item['title'],
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                item['description'],
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 12,
                  color: textColor.withOpacity(0.8),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
