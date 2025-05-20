import 'package:flutter/material.dart';

class IpaBagianTubuhView extends StatelessWidget {
  final List<Map<String, String>> bodyParts = [
    {
      'name': 'Kepala',
      'description': 'Bagian atas tubuh tempat otak berada.',
      'image': 'assets/body_parts/head.png',
    },
    {
      'name': 'Tangan',
      'description': 'Digunakan untuk memegang dan meraba.',
      'image': 'assets/body_parts/hand.png',
    },
    {
      'name': 'Kaki',
      'description': 'Digunakan untuk berjalan dan berlari.',
      'image': 'assets/body_parts/leg.png',
    },
    {
      'name': 'Mata',
      'description': 'Digunakan untuk melihat.',
      'image': 'assets/body_parts/eye.png',
    },
    {
      'name': 'Hidung',
      'description': 'Digunakan untuk mencium bau.',
      'image': 'assets/body_parts/nose.png',
    },
    {
      'name': 'Mulut',
      'description': 'Digunakan untuk makan dan berbicara.',
      'image': 'assets/body_parts/mouth.png',
    },
    {
      'name': 'Telinga',
      'description': 'Digunakan untuk mendengar suara.',
      'image': 'assets/body_parts/ear.png',
    },
    {
      'name': 'Perut',
      'description': 'Tempat mencerna makanan di dalam tubuh.',
      'image': 'assets/body_parts/stomach.png',
    },
  ];

  void showDetail(
      BuildContext context, String name, String description, String image) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: 100),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'MochiyPopOne', fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Tutup',
                style: TextStyle(fontFamily: 'MochiyPopOne')),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  final List<Color> colors = [
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.lightGreen,
    Colors.lightBlueAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bagian Tubuh Manusia',
            style: TextStyle(fontFamily: 'MochiyPopOne')),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bodyParts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final part = bodyParts[index];
          return GestureDetector(
            onTap: () => showDetail(
              context,
              part['name']!,
              part['description']!,
              part['image']!,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(part['image']!, height: 60),
                  const SizedBox(height: 12),
                  Text(
                    part['name']!,
                    style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
