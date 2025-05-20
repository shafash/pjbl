import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KebudayaanTradisiView extends StatelessWidget {
  const KebudayaanTradisiView({super.key});

  @override
  Widget build(BuildContext context) {
    final kebudayaanList = [
      {
        'title': 'Tari Tradisional',
        'icon': Icons.groups_3,
        'desc': 'Tarian khas dari daerah seperti Tari Piring, Saman, Kecak.',
        'color': Colors.pink.shade100,
      },
      {
        'title': 'Pakaian Adat',
        'icon': Icons.checkroom,
        'desc': 'Baju khas dari berbagai provinsi di Indonesia.',
        'color': Colors.orange.shade100,
      },
      {
        'title': 'Rumah Adat',
        'icon': Icons.home_work,
        'desc': 'Rumah tradisional yang unik dari tiap daerah.',
        'color': Colors.green.shade100,
      },
      {
        'title': 'Alat Musik Daerah',
        'icon': Icons.music_note,
        'desc': 'Contohnya Angklung, Gamelan, Sasando, dan lainnya.',
        'color': Colors.blue.shade100,
      },
      {
        'title': 'Upacara Adat',
        'icon': Icons.festival,
        'desc': 'Acara adat seperti Ngaben, Sekaten, Grebeg Maulud.',
        'color': Colors.purple.shade100,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      appBar: AppBar(
        title: Text(
          'Kebudayaan & Tradisi',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 22,
            color: Colors.deepPurple.shade800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Indonesia punya banyak kebudayaan dan tradisi. Yuk kenali satu per satu!',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: kebudayaanList.length,
                itemBuilder: (context, index) {
                  final item = kebudayaanList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: item['color'] as Color,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: (item['color'] as Color).withOpacity(0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          item['icon'] as IconData,
                          size: 40,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] as String,
                                style: GoogleFonts.mochiyPopOne(
                                  fontSize: 18,
                                  color: Colors.deepPurple.shade800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['desc'] as String,
                                style: GoogleFonts.mochiyPopOne(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
