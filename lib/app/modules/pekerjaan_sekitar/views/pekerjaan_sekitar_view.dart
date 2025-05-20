import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PekerjaanSekitarView extends StatelessWidget {
  const PekerjaanSekitarView({super.key});

  @override
  Widget build(BuildContext context) {
    final pekerjaanList = [
      {
        'title': 'Petani',
        'icon': Icons.agriculture,
        'desc':
            'Bekerja di sawah atau ladang untuk menanam padi, sayur, dan buah.',
        'color': Colors.green.shade100,
      },
      {
        'title': 'Guru',
        'icon': Icons.school,
        'desc': 'Mengajar murid di sekolah supaya pintar dan berpengetahuan.',
        'color': Colors.orange.shade100,
      },
      {
        'title': 'Dokter',
        'icon': Icons.local_hospital,
        'desc': 'Membantu orang sakit agar bisa sembuh dan sehat kembali.',
        'color': Colors.red.shade100,
      },
      {
        'title': 'Polisi',
        'icon': Icons.local_police,
        'desc': 'Menjaga keamanan dan ketertiban di lingkungan masyarakat.',
        'color': Colors.blue.shade100,
      },
      {
        'title': 'Pedagang',
        'icon': Icons.store,
        'desc':
            'Menjual barang di pasar atau toko, seperti makanan atau pakaian.',
        'color': Colors.purple.shade100,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      appBar: AppBar(
        title: Text(
          'Pekerjaan Sekitar',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 22,
            color: Colors.teal.shade900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Ada banyak pekerjaan di sekitar kita. Yuk kenali apa saja!',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: pekerjaanList.length,
                itemBuilder: (context, index) {
                  final item = pekerjaanList[index];
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
                                  color: Colors.teal.shade900,
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
