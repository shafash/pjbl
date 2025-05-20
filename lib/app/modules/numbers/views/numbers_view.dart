import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumbersView extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {
      'title': 'Bilangan Bulat',
      'info': 'Bilangan seperti -3, 0, 5, dan 10. Tidak ada koma atau pecahan.',
    },
    {
      'title': 'Ganjil & Genap',
      'info': 'Bilangan ganjil tidak bisa dibagi 2, genap bisa dibagi 2.',
    },
    {
      'title': 'Pecahan',
      'info': 'Pecahan adalah bagian dari keseluruhan, seperti 1/2, 3/4.',
    },
    {
      'title': 'Desimal',
      'info': 'Desimal memiliki koma, seperti 1.5, 2.75.',
    },
    {
      'title': 'Angka Romawi',
      'info': 'Simbol kuno seperti I, V, X, L yang digunakan untuk angka.',
    },
  ];

  void showTopicDialog(int index) {
    final topic = topics[index];
    Get.dialog(
      AlertDialog(
        title: Text(topic['title']!),
        content: Text(topic['info']!),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Tutup"),
          ),
          if (index < topics.length - 1)
            TextButton(
              onPressed: () {
                Get.back();
                showTopicDialog(index + 1);
              },
              child: const Text("Lanjut"),
            ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Bilangan',
            style: TextStyle(fontFamily: 'MochiyPopOne')),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.orange[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: topics.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final topic = topics[index];
            return GestureDetector(
              onTap: () => showTopicDialog(index),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.shade200,
                      blurRadius: 4,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      topic['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MochiyPopOne',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
