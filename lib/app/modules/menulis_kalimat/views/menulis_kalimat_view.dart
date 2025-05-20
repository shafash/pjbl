import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenulisKalimatView extends StatefulWidget {
  const MenulisKalimatView({super.key});

  @override
  State<MenulisKalimatView> createState() => _MenulisKalimatViewState();
}

class _MenulisKalimatViewState extends State<MenulisKalimatView> {
  final TextEditingController _controller = TextEditingController();
  final String contohKalimat = 'Aku suka bermain di taman setiap sore.';
  String feedback = '';

  void checkKalimat() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        feedback = 'Tolong tulis kalimatnya ya!';
      });
    } else if (input.toLowerCase() == contohKalimat.toLowerCase()) {
      setState(() {
        feedback = 'Bagus sekali! Kamu menulis dengan benar 😊';
      });
    } else {
      setState(() {
        feedback = 'Coba periksa kembali, ada yang belum tepat.';
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menulis Kalimat',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.lightBlue.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.green.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Contoh kalimat:',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Text(
                contohKalimat,
                style: const TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Tulis kalimat di bawah ini sesuai contoh:',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
                color: Colors.blueGrey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Tulis kalimatmu di sini...',
                hintStyle: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  color: Colors.grey.shade600,
                ),
              ),
              style: const TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: checkKalimat,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Periksa Jawaban',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (feedback.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: feedback.contains('Bagus')
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  feedback,
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: feedback.contains('Bagus')
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
