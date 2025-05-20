import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeasurementView extends StatelessWidget {
  final List<Map<String, String>> measurements = [
    {
      'name': 'Panjang',
      'emoji': '📏',
      'description':
          'Digunakan untuk mengukur jarak atau ukuran benda.\n\nContoh satuan:\n• Kilometer (km)\n• Meter (m)\n• Sentimeter (cm)',
      'color': '0xFFA5D6A7',
    },
    {
      'name': 'Berat',
      'emoji': '⚖️',
      'description':
          'Digunakan untuk mengetahui seberapa berat suatu benda.\n\nContoh satuan:\n• Kilogram (kg)\n• Gram (g)',
      'color': '0xFFFFF59D',
    },
    {
      'name': 'Waktu',
      'emoji': '⏰',
      'description':
          'Digunakan untuk mengukur lama suatu kejadian.\n\nContoh satuan:\n• Jam\n• Menit\n• Detik',
      'color': '0xFF81D4FA',
    },
    {
      'name': 'Suhu',
      'emoji': '🌡️',
      'description':
          'Digunakan untuk mengetahui panas atau dinginnya suatu benda atau udara.\n\nContoh satuan:\n• Derajat Celcius (°C)',
      'color': '0xFFFFAB91',
    },
    {
      'name': 'Volume',
      'emoji': '🧃',
      'description':
          'Digunakan untuk mengukur banyaknya isi suatu wadah (air, susu, dll).\n\nContoh satuan:\n• Liter (L)\n• Mililiter (mL)',
      'color': '0xFFCE93D8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Measurement',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: measurements.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = measurements[index];
          return GestureDetector(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.white,
                  title: Row(
                    children: [
                      Text(item['emoji']!,
                          style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MochiyPopOne',
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                    item['description']!,
                    style: const TextStyle(fontFamily: 'MochiyPopOne'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                          fontFamily: 'MochiyPopOne',
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(int.parse(item['color']!)),
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
                    Text(item['emoji']!, style: const TextStyle(fontSize: 32)),
                    const SizedBox(height: 10),
                    Text(
                      item['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'MochiyPopOne',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
