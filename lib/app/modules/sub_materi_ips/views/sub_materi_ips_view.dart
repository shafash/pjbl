import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SubMateriIpsView extends StatelessWidget {
  const SubMateriIpsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuList = [
      {
        'title': 'Lingkungan Sekitar',
        'icon': Icons.nature,
        'route': '/lingkungan-sekitar',
        'color': Colors.lightGreen.shade200,
        'textColor': Colors.green.shade900,
      },
      {
        'title': 'Peta & Arah Mata Angin',
        'icon': Icons.explore,
        'route': '/peta-arah-mata-angin',
        'color': Colors.lightBlue.shade200,
        'textColor': Colors.blue.shade900,
      },
      {
        'title': 'Kebudayaan & Tradisi',
        'icon': Icons.festival,
        'route': '/kebudayaan-tradisi',
        'color': Colors.orange.shade200,
        'textColor': Colors.deepOrange.shade900,
      },
      {
        'title': 'Pekerjaan Sekitar',
        'icon': Icons.work,
        'route': '/pekerjaan-sekitar',
        'color': Colors.purple.shade200,
        'textColor': Colors.deepPurple.shade900,
      },
      {
        'title': 'Tanggung Jawab di Sekolah',
        'icon': Icons.school,
        'route': '/tanggung-jawab-sekolah',
        'color': Colors.pink.shade200,
        'textColor': Colors.pink.shade900,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: Text(
          'Sub Materi IPS',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 20,
            color: Colors.brown.shade700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: menuList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = menuList[index];
            return GestureDetector(
              onTap: () => Get.toNamed(item['route']),
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: item['color'].withOpacity(0.5),
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'],
                      size: 50,
                      color: item['textColor'],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mochiyPopOne(
                          fontSize: 14,
                          color: item['textColor'], // warna teks kontras
                        ),
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
