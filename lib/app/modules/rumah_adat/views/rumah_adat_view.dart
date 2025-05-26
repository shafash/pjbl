import 'package:flutter/material.dart';

class RumahAdatView extends StatefulWidget {
  @override
  _RumahAdatViewState createState() => _RumahAdatViewState();
}

class _RumahAdatViewState extends State<RumahAdatView> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> rumahAdatList = [
    {
      'nama': 'Rumah Gadang',
      'gambar': 'assets/gadang.png',
      'deskripsi':
          'Rumah Gadang adalah rumah adat yang khas dari suku Minangkabau di Sumatera Barat. Bentuk atapnya sangat unik, melengkung tajam seperti tanduk kerbau di kedua ujungnya. Rumah ini biasanya punya banyak ruang di dalamnya dan dihiasi dengan ukiran-ukiran indah yang penuh makna.',
    },
    {
      'nama': 'Rumah Joglo',
      'gambar': 'assets/joglo.png',
      'deskripsi':
          'Rumah Joglo adalah rumah adat yang terkenal dari suku Jawa. Ciri khasnya ada di bagian atapnya yang tinggi dan berbentuk seperti piramida, tapi bagian tengahnya lebih tinggi dari sisi-sisinya. Rumah Joglo ini biasanya terbuat dari kayu jati yang kuat, dan sering punya banyak tiang penyangga di dalamnya.',
    },
    {
      'nama': 'Rumah Tongkonan',
      'gambar': 'assets/tongkonan.png',
      'deskripsi':
          'Rumah Tongkonan itu rumah adat yang sangat terkenal dari suku Toraja di Sulawesi Selatan. Bentuk atapnya unik, seperti perahu yang melengkung ke atas di bagian depan dan belakang. Rumah ini dibuat dari kayu dan dihiasi dengan banyak ukiran cantik yang punya arti khusus, lho! Tongkonan bukan cuma tempat tinggal, tapi juga pusat kegiatan penting keluarga dan tempat berkumpul.',
    },
    {
      'nama': 'Rumah Honai',
      'gambar': 'assets/honai.png',
      'deskripsi':
          'Rumah honai itu rumah adat khas suku Dani dari Papua. Bentuknya unik, mirip jamur atau kubah, dan atapnya terbuat dari jerami. Rumah ini kecil dan nggak punya jendela, biar hangat saat cuaca dingin di pegunungan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4A5A5),
        title: const Text(
          'Rumah Adat Indonesia',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: rumahAdatList.length,
        itemBuilder: (context, index) {
          final item = rumahAdatList[index];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: const Color(0xFFF2E9E4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            item['gambar']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        item['nama']!,
                        style: const TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B5B5B),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item['deskripsi']!,
                        style: const TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 16,
                          color: Color(0xFF7D6F6F),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
