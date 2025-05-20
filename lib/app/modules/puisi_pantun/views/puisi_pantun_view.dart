import 'package:flutter/material.dart';

class PuisiPantunView extends StatelessWidget {
  const PuisiPantunView({super.key});

  final List<Map<String, String>> contohPuisi = const [
    {
      'judul': 'Burung Merpati',
      'isi':
          'Burung merpati terbang tinggi,\nMelayang di angkasa biru.\nIndahnya pagi penuh arti,\nMembawa harapan baru.'
    },
    {
      'judul': 'Pantun Ceria',
      'isi':
          'Pisang emas bawa berlayar,\nMasak di taman buah nan segar.\nKalau hendak belajar,\nJangan lupa tetap semangat.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Puisi & Pantun',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.purple.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.pink.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Text(
              'Apa itu Puisi & Pantun?',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Puisi adalah karya sastra yang menggunakan bahasa indah dan ritmis untuk menyampaikan perasaan atau cerita. Pantun adalah bentuk puisi pendek dengan pola sajak tertentu.',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.purple.shade900,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Contoh Puisi dan Pantun:',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
            const SizedBox(height: 12),
            ...contohPuisi.map((item) => Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(3, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['judul']!,
                        style: TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['isi']!,
                        style: const TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            Text(
              'Ayo coba buat puisi atau pantunmu sendiri!',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 6,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tulis puisi atau pantunmu di sini...',
                hintStyle: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontFamily: 'MochiyPopOne'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Puisi dan pantunmu sudah diterima!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Kirim',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
