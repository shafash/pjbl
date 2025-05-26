import 'package:flutter/material.dart';

class TariTradisionalView extends StatefulWidget {
  @override
  _TariTradisionalViewState createState() => _TariTradisionalViewState();
}

class _TariTradisionalViewState extends State<TariTradisionalView> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> tariList = [
    {
      'nama': 'Tari Saman',
      'gambar': 'assets/saman.jpg',
      'deskripsi':
          'Tari Saman adalah tarian yang sangat terkenal dari Aceh. Uniknya, tarian ini tidak pakai iringan musik alat, tapi suara nyanyian dari penarinya sendiri dan tepukan tangan ke dada atau paha. Penari Saman duduk berbaris rapat, lalu bergerak serentak dengan cepat dan kompak, seperti gelombang yang indah!',
    },
    {
      'nama': 'Tari Kecak',
      'gambar': 'assets/kecak.jpg',
      'deskripsi':
          'Tari Kecak adalah tarian yang sangat terkenal dari Bali. Tarian ini unik karena tidak pakai alat musik, tapi penarinya akan duduk melingkar dan mengucapkan kata "cak, cak, cak" secara bersamaan, sambil mengangkat tangan. Gerakan mereka serempak dan ceria, sering bercerita tentang kisah Ramayana!',
    },
    {
      'nama': 'Tari Piring',
      'gambar': 'assets/piring.jpg',
      'deskripsi':
          'Tari Piring adalah tarian yang indah dari Sumatera Barat. Para penarinya akan memegang piring di kedua telapak tangan, lalu menari dengan gerakan cepat dan dinamis tanpa menjatuhkan piringnya. Seru banget, kan, melihat mereka menjaga piring tetap di tempatnya sambil menari!',
    },
    {
      'nama': 'Tari Jaipong',
      'gambar': 'assets/jaipong.jpg',
      'deskripsi':
          'Tari Jaipong adalah tarian yang penuh semangat dan ceria dari Jawa Barat. Gerakannya lincah, dinamis, dan terkadang genit, diiringi musik gamelan yang riang. Penari Jaipong biasanya memakai selendang yang ikut meliuk-liuk saat mereka menari.!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4A5A5),
        title: const Text(
          'Tari Tradisional',
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
        itemCount: tariList.length,
        itemBuilder: (context, index) {
          final item = tariList[index];
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
