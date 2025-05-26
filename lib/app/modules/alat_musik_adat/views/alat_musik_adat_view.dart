import 'package:flutter/material.dart';

class AlatMusikAdatView extends StatefulWidget {
  @override
  _AlatMusikAdatViewState createState() => _AlatMusikAdatViewState();
}

class _AlatMusikAdatViewState extends State<AlatMusikAdatView> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> alatMusikList = [
    {
      'nama': 'Angklung',
      'gambar': 'assets/angklung.png',
      'deskripsi':
          'Angklung itu alat musik yang terbuat dari bambu. Cara memainkannya unik, kita harus menggoyangkannya biar bambu-bambu itu berbenturan dan menghasilkan suara yang merdu. Biar bisa jadi lagu, biasanya banyak angklung dimainkan bareng-bareng oleh beberapa orang.',
    },
    {
      'nama': 'Gamelan',
      'gambar': 'assets/gamelan.png',
      'deskripsi':
          'Gamelan adalah seperangkat alat musik tradisional dari Indonesia, terutama Jawa dan Bali. Gamelan terdiri dari banyak alat musik pukul seperti gong, kendang, dan saron yang terbuat dari perunggu atau besi. Saat dimainkan bersama-sama, alat-alat musik ini menghasilkan suara yang indah dan harmonis.',
    },
    {
      'nama': 'Sasando',
      'gambar': 'assets/sasando.png',
      'deskripsi':
          'Sasando adalah alat musik petik yang unik dari Pulau Rote, Nusa Tenggara Timur. Bentuknya istimewa karena ada anyaman daun lontar yang mengelilingi dawai-dawainya, mirip kipas. Suara Sasando sangat merdu dan sering dimainkan untuk mengiringi lagu-lagu tradisional.',
    },
    {
      'nama': 'Tifa',
      'gambar': 'assets/tifa.png',
      'deskripsi':
          'Tifa adalah alat musik pukul tradisional dari daerah Papua dan Maluku. Bentuknya seperti tabung atau silinder, dan biasanya terbuat dari kayu yang dilubangi. Tifa dimainkan dengan cara dipukul menggunakan tangan, mirip seperti gendang, dan sering dipakai untuk mengiringi tarian atau upacara adat.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4A5A5),
        title: const Text(
          'Alat Musik Adat',
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
        itemCount: alatMusikList.length,
        itemBuilder: (context, index) {
          final item = alatMusikList[index];
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
