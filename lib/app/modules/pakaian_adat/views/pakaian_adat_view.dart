import 'package:flutter/material.dart';

class PakaianAdatView extends StatefulWidget {
  @override
  _PakaianAdatViewState createState() => _PakaianAdatViewState();
}

class _PakaianAdatViewState extends State<PakaianAdatView> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> pakaianAdatList = [
    {
      'nama': 'Baju Bodo',
      'gambar': 'assets/pakaian_adat/baju_bodo.png',
      'deskripsi':
          'Baju bodo itu baju adat dari Sulawesi yang bentuknya longgar kayak kelelawar. Bajunya tipis dan warna-warni, cantik sekali!',
    },
    {
      'nama': 'Kebaya',
      'gambar': 'assets/pakaian_adat/kebaya.png',
      'deskripsi':
          'Kebaya itu baju khas Indonesia yang lengannya panjang dan pas di badan. Biasanya dipakai sama rok panjang batik yang cantik.',
    },
    {
      'nama': 'Ulos',
      'gambar': 'assets/pakaian_adat/ulos.png',
      'deskripsi':
          'Ulos itu kain istimewa dari suku Batak. Kain ini suka dipakai saat acara penting dan jadi lambang kasih sayang juga doa.',
    },
    {
      'nama': 'Pakaian Adat Bali',
      'gambar': 'assets/pakaian_adat/adat_bali.png',
      'deskripsi':
          'Pakaian adat Bali itu unik dan cantik sekali, lho! Kalau cewek biasanya pakai kebaya yang warnanya cerah dan kain di bawahnya. Kalau cowok pakai baju yang mirip kemeja namanya baju safari, lalu pakai kain di pinggang, dan penutup kepala yang disebut udeng.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F3), // warna pastel kalem
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4A5A5),
        title: const Text(
          'Pakaian Adat Indonesia',
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
        itemCount: pakaianAdatList.length,
        itemBuilder: (context, index) {
          final item = pakaianAdatList[index];
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
