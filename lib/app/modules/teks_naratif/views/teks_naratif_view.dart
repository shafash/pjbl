import 'package:flutter/material.dart';

class TeksNaratifView extends StatelessWidget {
  const TeksNaratifView({super.key});

  final String sampleNarrative = '''
Pada suatu hari, ada seorang anak bernama Budi yang sangat suka berpetualang. 
Ia pergi ke hutan dekat rumahnya dan menemukan banyak hewan lucu. 
Budi sangat senang dan ingin bercerita tentang petualangannya kepada teman-temannya.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teks Naratif',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.purple.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.orange.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Text(
              'Apa itu Teks Naratif?',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Teks naratif adalah cerita yang memiliki tokoh, alur, dan latar. '
              'Biasanya menceritakan sebuah peristiwa atau pengalaman.',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.purple.shade900,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Contoh Teks Naratif:',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                    offset: const Offset(3, 4),
                  ),
                ],
              ),
              child: Text(
                sampleNarrative,
                style: const TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Ayo, coba jawab!',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Siapakah tokoh utama dalam cerita tersebut?',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.purple.shade900,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _showAnswerDialog(context, 'Jawaban benar: Budi');
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
                  'Budi',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _showAnswerDialog(context, 'Coba pikir lagi ya!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Budi dan teman-temannya',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _showAnswerDialog(
                    context, 'Coba perhatikan lagi ceritanya ya!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Teman-teman Budi',
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

  void _showAnswerDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Jawaban',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        content: Text(
          message,
          style: const TextStyle(fontFamily: 'MochiyPopOne', fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tutup',
              style: TextStyle(fontFamily: 'MochiyPopOne'),
            ),
          ),
        ],
      ),
    );
  }
}
