import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaSifatBendaView extends StatelessWidget {
  final List<Map<String, dynamic>> sifatList = [
    {
      'title': 'Bentuk Tetap',
      'description': 'Benda padat memiliki bentuk tetap.',
      'image': 'assets/sifat benda/bentuk_tetap.png',
    },
    {
      'title': 'Mengalir',
      'description': 'Benda cair bisa mengalir mengikuti wadah.',
      'image': 'assets/sifat benda/mengalir.png',
    },
    {
      'title': 'Mengisi Ruang',
      'description': 'Benda gas mengisi seluruh ruang yang ada.',
      'image': 'assets/sifat benda/mengisi_ruang.png',
    },
    {
      'title': 'Menekan ke Segala Arah',
      'description': 'Gas menekan ke segala arah.',
      'image': 'assets/sifat benda/menekan.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text(
          'Sifat Benda',
          style: GoogleFonts.mochiyPopOne(),
        ),
        backgroundColor: Colors.lightBlueAccent.shade700,
      ),
      body: ListView.builder(
        itemCount: sifatList.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final sifat = sifatList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black12,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  sifat['image'],
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sifat['title'],
                        style: GoogleFonts.mochiyPopOne(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        sifat['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
