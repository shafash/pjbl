import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaBendaPadatView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Meja',
      'image': 'assets/benda padat/meja.png',
    },
    {
      'name': 'Buku',
      'image': 'assets/benda padat/buku.png',
    },
    {
      'name': 'Batu',
      'image': 'assets/benda padat/batu.png',
    },
    {
      'name': 'Kursi',
      'image': 'assets/benda padat/kursi.png',
    },
    {
      'name': 'Pensil',
      'image': 'assets/benda padat/pensil.png',
    },
    {
      'name': 'Piring',
      'image': 'assets/benda padat/piring.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text(
          'Benda Padat',
          style: GoogleFonts.mochiyPopOne(),
        ),
        backgroundColor: Colors.green.shade600,
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
