import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MembacaCeritaView extends StatelessWidget {
  const MembacaCeritaView({super.key});

  final List<Map<String, String>> ceritaList = const [
    {
      'title': 'Kucing dan Tikus',
      'content': 'Suatu hari, seekor kucing dan tikus bertemu di kebun...'
          '\nMereka belajar untuk saling membantu dan menjadi teman baik.',
    },
    {
      'title': 'Si Kancil dan Buaya',
      'content': 'Si Kancil ingin menyeberangi sungai, tapi banyak buaya.'
          '\nDengan cerdiknya, Si Kancil berhasil menyeberang tanpa bahaya.',
    },
    {
      'title': 'Pelangi Setelah Hujan',
      'content': 'Setelah hujan berhenti, muncul pelangi yang sangat indah.'
          '\nAnak-anak senang melihat warna-warni pelangi di langit.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Membaca Cerita',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.orange.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.separated(
          itemCount: ceritaList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final cerita = ceritaList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cerita['title']!,
                      style: const TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      cerita['content']!,
                      style: const TextStyle(
                        fontFamily: 'MochiyPopOne',
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.defaultDialog(
                            title: cerita['title']!,
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cerita['content']!,
                                style: const TextStyle(
                                  fontFamily: 'MochiyPopOne',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            confirm: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Tutup'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.menu_book_outlined),
                        label: const Text('Baca Lengkap'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    )
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
