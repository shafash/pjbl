import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KriyaView extends StatelessWidget {
  const KriyaView({super.key});

  final List<Map<String, String>> kriyaItems = const [
    {
      'title': 'Membuat Origami',
      'desc':
          'Lipat kertas warna-warni menjadi berbagai bentuk menarik seperti burung atau kapal.',
      'emoji': '🦢📄',
    },
    {
      'title': 'Kerajinan dari Kertas',
      'desc': 'Buat hiasan seperti bunga atau bingkai foto dari kertas bekas.',
      'emoji': '🌸🖼️',
    },
    {
      'title': 'Kerajinan dari Botol Bekas',
      'desc':
          'Manfaatkan botol plastik untuk membuat pot bunga atau mainan lucu.',
      'emoji': '🍼🌱',
    },
    {
      'title': 'Membuat Topeng',
      'desc':
          'Kreasikan topeng dari kardus atau kertas karton dengan warna cerah.',
      'emoji': '🎭✨',
    },
    {
      'title': 'Kerajinan dari Kain Perca',
      'desc':
          'Gabungkan potongan kain warna-warni untuk membuat tas atau gantungan kunci.',
      'emoji': '👜🧵',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kerajinan Tangan (Kriya)'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.orange.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.separated(
          itemCount: kriyaItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = kriyaItems[index];
            return GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: item['title']!,
                  titleStyle: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 22,
                  ),
                  middleText: item['desc']!,
                  middleTextStyle: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                  backgroundColor: Colors.white,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      item['emoji']!,
                      style: const TextStyle(fontSize: 48),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
