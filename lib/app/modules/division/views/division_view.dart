import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DivisionView extends StatelessWidget {
  const DivisionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembagian',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              icon: Icons.call_split,
              title: 'Apa itu Pembagian?',
              content:
                  'Pembagian adalah cara membagi sesuatu menjadi bagian yang sama besar.\n\nContoh: 12 ÷ 4 = 3',
              color: Colors.purpleAccent,
            ),
            const SizedBox(height: 16),
            _buildCard(
              icon: Icons.pie_chart,
              title: 'Contoh Soal',
              content:
                  'Jika kamu punya 20 permen dan ingin dibagi ke 4 teman, berapa permen yang didapat masing-masing?\n\nJawaban: 20 ÷ 4 = 5',
              color: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 16),
            _buildCard(
              icon: Icons.lightbulb,
              title: 'Tips Mudah',
              content:
                  'Gunakan tabel perkalian terbalik untuk membantu pembagian.\nContoh: 4 x 5 = 20, jadi 20 ÷ 4 = 5',
              color: Colors.purple,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: const TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 30, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'MochiyPopOne',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'MochiyPopOne',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
