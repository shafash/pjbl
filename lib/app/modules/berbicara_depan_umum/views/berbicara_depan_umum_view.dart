import 'package:flutter/material.dart';

class BerbicaraDepanUmumView extends StatelessWidget {
  const BerbicaraDepanUmumView({super.key});

  final List<Map<String, String>> tipsList = const [
    {'icon': '😊', 'tip': 'Bernafas dalam-dalam sebelum mulai berbicara.'},
    {'icon': '🗣️', 'tip': 'Bicara dengan suara yang jelas dan pelan.'},
    {'icon': '👀', 'tip': 'Lihat ke arah teman-teman, jangan takut.'},
    {'icon': '📖', 'tip': 'Siapkan materi dan latihan sebelumnya.'},
    {'icon': '💪', 'tip': 'Percaya diri, kamu pasti bisa!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Berbicara di Depan Umum',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.orange.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade50, Colors.yellow.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: tipsList.length,
          itemBuilder: (context, index) {
            final tip = tipsList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ListTile(
                leading: Text(
                  tip['icon']!,
                  style: const TextStyle(fontSize: 30),
                ),
                title: Text(
                  tip['tip']!,
                  style: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: Colors.black87,
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
