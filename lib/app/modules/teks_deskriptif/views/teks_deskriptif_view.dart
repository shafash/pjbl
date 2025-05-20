import 'package:flutter/material.dart';

class TeksDeskriptifView extends StatelessWidget {
  const TeksDeskriptifView({super.key});

  final String contohDeskripsi = '''
Pantai itu sangat indah. Airnya jernih berwarna biru muda dan pasirnya halus berwarna putih. 
Di tepi pantai tumbuh pohon kelapa yang tinggi, dan angin sepoi-sepoi membuat suasana sangat nyaman.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teks Deskriptif',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.teal.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.yellow.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Text(
              'Apa itu Teks Deskriptif?',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Teks deskriptif adalah teks yang menggambarkan sesuatu dengan detail agar pembaca bisa membayangkan dengan jelas.',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.teal.shade900,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Contoh Teks Deskriptif:',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
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
                contohDeskripsi,
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
              'Ayo, coba gambarkan!',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Coba tulis deskripsi tentang tempat favoritmu.',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.teal.shade900,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tulis deskripsimu di sini...',
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
                // Bisa ditambahkan aksi simpan atau cek tulisan
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Terima kasih sudah mencoba!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade400,
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
            )
          ],
        ),
      ),
    );
  }
}
