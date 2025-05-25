import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      'gambar': 'https://i.imgur.com/IHxyJnm.jpg'
    },
    'UT': {
      'judul': 'Utara Timur',
      'deskripsi': 'Utara Timur adalah arah di antara utara dan timur.',
      'gambar': 'https://i.imgur.com/wPHQGAc.jpg'
    },
    'T': {
      'judul': 'Timur',
      'deskripsi': 'Timur adalah tempat matahari terbit.',
      'gambar': 'https://i.imgur.com/8G7nqg3.jpg'
    },
    'ST': {
      'judul': 'Selatan Timur',
      'deskripsi': 'Selatan Timur adalah arah di antara selatan dan timur.',
      'gambar': 'https://i.imgur.com/YHdA5Kj.jpg'
    },
    'S': {
      'judul': 'Selatan',
      'deskripsi': 'Selatan adalah arah ke bawah. Biasanya cuacanya panas.',
      'gambar': 'https://i.imgur.com/j7UJ1ar.jpg'
    },
    'BS': {
      'judul': 'Barat Selatan',
      'deskripsi': 'Barat Selatan adalah arah di antara selatan dan barat.',
      'gambar': 'https://i.imgur.com/6DAmcIC.jpg'
    },
    'B': {
      'judul': 'Barat',
      'deskripsi': 'Barat adalah tempat matahari tenggelam.',
      'gambar': 'https://i.imgur.com/27KnzZY.jpg'
    },
    'UB': {
      'judul': 'Utara Barat',
      'deskripsi': 'Utara Barat adalah arah di antara utara dan barat.',
      'gambar': 'https://i.imgur.com/ynEr0oZ.jpg'
    },
  };

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
        title: Text(data['judul']!,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(data['gambar']!, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text(data['deskripsi']!),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
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
        title: const Text('Peta Mata Angin'),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Image.asset(
                'assets/kompas.png',
                height: size,
              ),
            ),
            ...arahPenjelasan.keys.map((kode) {
              final index = arahPenjelasan.keys.toList().indexOf(kode);
              final angle = (2 * pi / 8) * index;
              final offset = Offset(
                cos(angle) * (size / 2 - 30),
                sin(angle) * (size / 2 - 30),
              );
              return Positioned(
                left: size / 2 + offset.dx,
                top: size / 2 + offset.dy,
                child: GestureDetector(
                  onTap: () => showArahInfo(kode),
                  child: Text(
                    kode,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
