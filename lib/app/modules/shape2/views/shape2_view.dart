import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shape2View extends StatelessWidget {
  final List<Map<String, String>> shapes = [
    {
      'name': 'Circle',
      'emoji': '⚪',
      'description': 'Lingkaran itu bulat dan tidak punya sudut.',
      'area': 'Luas = π × r²',
      'perimeter': 'Keliling = 2 × π × r',
      'color': '0xFFB2EBF2'
    },
    {
      'name': 'Square',
      'emoji': '🟥',
      'description': 'Persegi punya 4 sisi sama panjang dan 4 sudut.',
      'area': 'Luas = s × s',
      'perimeter': 'Keliling = 4 × s',
      'color': '0xFFFFCDD2'
    },
    {
      'name': 'Triangle',
      'emoji': '🔺',
      'description': 'Segitiga punya 3 sisi dan 3 sudut.',
      'area': 'Luas = ½ × alas × tinggi',
      'perimeter': 'Keliling = a + b + c',
      'color': '0xFFC8E6C9'
    },
    {
      'name': 'Rectangle',
      'emoji': '▭',
      'description': 'Persegi panjang punya sisi berlawanan yang sama panjang.',
      'area': 'Luas = p × l',
      'perimeter': 'Keliling = 2 × (p + l)',
      'color': '0xFFD1C4E9'
    },
    {
      'name': 'Oval',
      'emoji': '🟠',
      'description': 'Oval seperti lingkaran yang ditarik.',
      'area': 'Luas ≈ π × a × b',
      'perimeter': 'Keliling ≈ 2 × π × √((a² + b²)/2)',
      'color': '0xFFFFF9C4'
    },
    {
      'name': 'Star',
      'emoji': '⭐',
      'description': 'Bintang bersinar di langit dengan banyak sudut.',
      'area': 'Tidak tetap (tergantung bentuk)',
      'perimeter': 'Tidak tetap',
      'color': '0xFFFFF59D'
    },
    {
      'name': 'Heart',
      'emoji': '❤️',
      'description': 'Hati menunjukkan cinta dan kasih sayang.',
      'area': 'Tidak tetap (dekoratif)',
      'perimeter': 'Tidak tetap',
      'color': '0xFFF8BBD0'
    },
    {
      'name': 'Diamond',
      'emoji': '🔷',
      'description': 'Berlian punya bentuk seperti persegi yang miring.',
      'area': 'Luas = ½ × d1 × d2',
      'perimeter': 'Keliling = 4 × sisi',
      'color': '0xFFB3E5FC'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Math - Fun Shapes!',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: shapes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final shape = shapes[index];
          return GestureDetector(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.white,
                  title: Row(
                    children: [
                      Text(
                        shape['emoji']!,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        shape['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.redAccent,
                          fontFamily: 'MochiyPopOne',
                        ),
                      ),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shape['description']!,
                        style: const TextStyle(fontFamily: 'MochiyPopOne'),
                      ),
                      const SizedBox(height: 8),
                      Text('📐 ${shape['area']}',
                          style: const TextStyle(fontFamily: 'MochiyPopOne')),
                      Text('📏 ${shape['perimeter']}',
                          style: const TextStyle(fontFamily: 'MochiyPopOne')),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Tutup',
                          style: TextStyle(
                              color: Colors.red, fontFamily: 'MochiyPopOne')),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(int.parse(shape['color']!)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2)),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      shape['emoji']!,
                      style: const TextStyle(fontSize: 48),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shape['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'MochiyPopOne',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
