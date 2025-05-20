import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EkspresiSeniView extends StatelessWidget {
  const EkspresiSeniView({super.key});

  final List<Map<String, String>> ekspresiItems = const [
    {
      'title': 'Menari',
      'desc':
          'Gerakkan tubuh dengan musik untuk mengekspresikan perasaan dan cerita.',
      'emoji': '💃🕺',
    },
    {
      'title': 'Bernyanyi',
      'desc': 'Gunakan suara untuk mengungkapkan emosi dan berbagi cerita.',
      'emoji': '🎤🎶',
    },
    {
      'title': 'Drama dan Teater',
      'desc':
          'Berakting dan bermain peran untuk menyampaikan pesan dan cerita.',
      'emoji': '🎭🎬',
    },
    {
      'title': 'Musik Alat Tradisional',
      'desc': 'Mainkan alat musik tradisional untuk mengembangkan kreativitas.',
      'emoji': '🎵🥁',
    },
    {
      'title': 'Ekspresi dengan Gerakan',
      'desc':
          'Gunakan tangan dan wajah untuk mengekspresikan ide dan perasaan.',
      'emoji': '🤲🙂',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ekspresi Seni'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.separated(
          itemCount: ekspresiItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = ekspresiItems[index];
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
                  color: Colors.white.withOpacity(0.9),
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
