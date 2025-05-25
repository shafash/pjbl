import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KuisDashboardView extends StatelessWidget {
  const KuisDashboardView({super.key});

  final List<Map<String, dynamic>> kuisMapelList = const [
    {
      'title': 'Bahasa Indonesia',
      'emoji': '📝',
      'jumlahKuis': 5,
      'color': Color(0xFFFFC1CC),
      'route': '/kuis-bahasa-indonesia',
    },
    {
      'title': 'Matematika',
      'emoji': '➗',
      'jumlahKuis': 5,
      'color': Color(0xFFB4F8C8),
      'route': '/kuis-matematika',
    },
    {
      'title': 'IPA',
      'emoji': '🔬',
      'jumlahKuis': 5,
      'color': Color(0xFFFFE066),
      'route': '/kuis-ipa',
    },
    {
      'title': 'IPS',
      'emoji': '🌍',
      'jumlahKuis': 6,
      'color': Color(0xFFFFD6A5),
      'route': '/kuis-ips',
    },
    {
      'title': 'PKn',
      'emoji': '⚖️',
      'jumlahKuis': 6,
      'color': Color(0xFF9BF6FF),
      'route': '/kuis-pkn',
    },
    {
      'title': 'Seni Budaya',
      'emoji': '🎨',
      'jumlahKuis': 7,
      'color': Color(0xFFA0C4FF),
      'route': '/kuis-seni',
    },
    {
      'title': 'Bahasa Inggris',
      'emoji': '📚',
      'jumlahKuis': 8,
      'color': Color(0xFFFFB5A7),
      'route': '/kuis-bahasa-inggris',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuis Mapel',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.teal.shade300,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isSmallDevice = width < 400;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: kuisMapelList.map((mapel) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(mapel['route']),
                      child: Container(
                        width: isSmallDevice ? width / 2 - 24 : 160,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: mapel['color'],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              mapel['emoji'],
                              style: const TextStyle(fontSize: 48),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              mapel['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'MochiyPopOne',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${mapel['jumlahKuis']} Kuis',
                              style: const TextStyle(
                                fontFamily: 'MochiyPopOne',
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
