import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaBendaCairView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Air',
      'image': 'assets/benda cair/air.png',
    },
    {
      'name': 'Susu',
      'image': 'assets/benda cair/susu.png',
    },
    {
      'name': 'Minyak',
      'image': 'assets/benda cair/minyak.png',
    },
    {
      'name': 'Sirup',
      'image': 'assets/benda cair/sirup.png',
    },
    {
      'name': 'Madu',
      'image': 'assets/benda cair/madu.png',
    },
    {
      'name': 'Kecap',
      'image': 'assets/benda cair/kecap.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text(
          'Benda Cair',
          style: GoogleFonts.mochiyPopOne(),
        ),
        backgroundColor: Colors.lightBlue.shade700,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black12,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item['image'], height: 80),
                const SizedBox(height: 10),
                Text(
                  item['name'],
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 16,
                    color: Colors.black87,
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
