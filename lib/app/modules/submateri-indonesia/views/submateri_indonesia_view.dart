import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class BahasaIndonesiaView extends StatelessWidget {
  BahasaIndonesiaView({super.key});

  final List<Map<String, dynamic>> submateriList = const [
    {
      'title': 'Membaca Cerita',
      'emoji': '📚👦',
      'desc': 'Membaca cerita pendek yang menarik dan bergambar.',
      'route': Routes.MEMBACA_CERITA,
    },
    {
      'title': 'Menulis Kalimat',
      'emoji': '✍️📝',
      'desc': 'Latihan menyusun kalimat dari kata yang dipelajari.',
      'route': Routes.MENULIS_KALIMAT,
    },
    {
      'title': 'Teks Naratif',
      'emoji': '📖✨',
      'desc': 'Mengenal cerita naratif: tokoh, alur, dan latar.',
      'route': Routes.TEKS_NARATIF,
    },
    {
      'title': 'Teks Deskriptif',
      'emoji': '🔍🌳',
      'desc': 'Belajar menggambarkan benda, tempat, atau suasana.',
      'route': Routes.TEKS_DESKRIPTIF,
    },
    {
      'title': 'Puisi & Pantun',
      'emoji': '🎵💌',
      'desc': 'Membaca dan membuat puisi dan pantun anak-anak.',
      'route': Routes.PUISI_PANTUN,
    },
    {
      'title': 'Berbicara di Depan Umum',
      'emoji': '🎙️😁',
      'desc':
          'Latihan menyampaikan pendapat atau bercerita dengan percaya diri.',
      'route': Routes.BERBICARA_DEPAN_UMUM,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bahasa Indonesia',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          itemCount: submateriList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = submateriList[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(item['route']);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['emoji'],
                      style: const TextStyle(fontSize: 38),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 15,
                        color: Colors.black87,
                      ),
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
