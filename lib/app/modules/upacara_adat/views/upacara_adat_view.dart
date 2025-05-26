import 'package:flutter/material.dart';

class UpacaraAdatView extends StatefulWidget {
  @override
  _UpacaraAdatViewState createState() => _UpacaraAdatViewState();
}

class _UpacaraAdatViewState extends State<UpacaraAdatView> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> upacaraList = [
    {
      'nama': 'Ngaben',
      'gambar': 'assets/ngaben.jpg',
      'deskripsi':
          'Ngaben adalah upacara adat pembakaran jenazah yang sangat penting bagi umat Hindu di Bali. Ini bukan acara sedih, lho, tapi justru dianggap sebagai cara untuk mengantar roh orang yang sudah meninggal agar bisa kembali bersatu dengan Tuhan. Upacara ini biasanya meriah dengan banyak hiasan dan musik gamelan.',
    },
    {
      'nama': 'Sekaten',
      'gambar': 'assets/sekaten.jpg',
      'deskripsi':
          'Sekaten adalah upacara adat dan perayaan besar yang diadakan setiap tahun di Yogyakarta dan Surakarta (Solo) untuk memperingati hari lahir Nabi Muhammad SAW. Acara ini dimeriahkan dengan pasar malam yang ramai, dan puncaknya adalah arak-arakan dua set gamelan pusaka keraton.',
    },
    {
      'nama': 'Rambu Solo',
      'gambar': 'assets/rambu_solo.jpg',
      'deskripsi':
          'Rambu Solo adalah upacara pemakaman adat suku Toraja di Sulawesi Selatan yang sangat besar dan penting. Ini bukan cuma acara sedih, tapi juga perayaan untuk menghormati orang yang meninggal dan mengantarkannya ke alam roh. Upacara ini biasanya berlangsung meriah dengan banyak hewan kurban seperti kerbau dan babi, serta diiringi tarian dan musik tradisional.',
    },
    {
      'nama': 'Kasada',
      'gambar': 'assets/kasada.jpg',
      'deskripsi':
          'Upacara Kasada adalah acara suku Tengger di Gunung Bromo untuk berterima kasih kepada Tuhan. Mereka membawa hasil panen ke kawah gunung dan melemparnya sebagai persembahan. Ini cara mereka berdoa dan bersyukur.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4A5A5),
        title: const Text(
          'Upacara Adat',
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
        itemCount: upacaraList.length,
        itemBuilder: (context, index) {
          final item = upacaraList[index];
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
