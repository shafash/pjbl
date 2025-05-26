import 'dart:math';
import 'package:flutter/material.dart';

class PetaMataAnginView extends StatefulWidget {
  const PetaMataAnginView({super.key});

  @override
  State<PetaMataAnginView> createState() => _PetaMataAnginViewState();
}

class _PetaMataAnginViewState extends State<PetaMataAnginView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final Map<String, Map<String, String>> arahPenjelasan = {
    'U': {
      'judul': 'Utara',
      'deskripsi': 'Utara adalah arah ke atas. Biasanya ke gunung atau kutub.',
      'gambar': 'assets/arah_mata_angin/utara.jpg'
    },
    'TL': {
      'judul': 'Timur Laut',
      'deskripsi': 'Utara Timur adalah arah di antara utara dan timur.',
      'gambar': 'assets/arah_mata_angin/timur_laut.jpg'
    },
    'T': {
      'judul': 'Timur',
      'deskripsi': 'Timur adalah tempat matahari terbit.',
      'gambar': 'assets/arah_mata_angin/timur.jpg'
    },
    'TNG': {
      'judul': 'Tenggara',
      'deskripsi': 'Selatan Timur adalah arah di antara selatan dan timur.',
      'gambar': 'assets/arah_mata_angin/tenggara.jpg'
    },
    'S': {
      'judul': 'Selatan',
      'deskripsi': 'Selatan adalah arah ke bawah. Biasanya cuacanya panas.',
      'gambar': 'assets/arah_mata_angin/selatan.jpg'
    },
    'BD': {
      'judul': 'Barat Daya',
      'deskripsi': 'Barat Selatan adalah arah di antara selatan dan barat.',
      'gambar': 'assets/arah_mata_angin/barat_daya.jpg'
    },
    'B': {
      'judul': 'Barat',
      'deskripsi': 'Barat adalah tempat matahari tenggelam.',
      'gambar': 'assets/arah_mata_angin/barat.jpg'
    },
    'BL': {
      'judul': 'Barat Laut',
      'deskripsi': 'Utara Barat adalah arah di antara utara dan barat.',
      'gambar': 'assets/arah_mata_angin/barat_laut.jpg'
    },
  };

  final List<Color> warnaLabel = [
    Colors.pinkAccent,
    Colors.lightBlueAccent,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
    Colors.tealAccent,
    Colors.redAccent,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showArahInfo(String kode) {
    final data = arahPenjelasan[kode]!;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          data['judul']!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MochiyPopOne',
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(data['gambar']!, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text(
              data['deskripsi']!,
              style: const TextStyle(fontFamily: 'MochiyPopOne'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tutup',
              style: TextStyle(fontFamily: 'MochiyPopOne'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = 300;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Peta Mata Angin',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // Awan hiasan
            Positioned(
              top: 40,
              left: 30,
              child: Image.asset('assets/awan.png', width: 60),
            ),
            Positioned(
              top: 60,
              right: 40,
              child: Image.asset('assets/awan.png', width: 50),
            ),
            Positioned(
              bottom: 80,
              right: 30,
              child: Image.asset('assets/awan.png', width: 65),
            ),

            // Centered kompas dan label
            Center(
              child: SizedBox(
                width: size,
                height: size,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Kompas berputar
                    RotationTransition(
                      turns: _controller,
                      child: Image.asset(
                        'assets/kompas.png',
                        height: size,
                      ),
                    ),

                    // Label arah mata angin
                    ...arahPenjelasan.keys.map((kode) {
                      final index = arahPenjelasan.keys.toList().indexOf(kode);
                      final angle = (2 * pi / 8) * index;
                      final offset = Offset(
                        cos(angle) * (size / 2 - 30),
                        sin(angle) * (size / 2 - 30),
                      );
                      return Positioned(
                        left: (size / 2) + offset.dx - 20,
                        top: (size / 2) + offset.dy - 20,
                        child: GestureDetector(
                          onTap: () => showArahInfo(kode),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: warnaLabel[index % warnaLabel.length]
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              kode,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MochiyPopOne',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
