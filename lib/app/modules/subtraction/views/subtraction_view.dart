import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubtractionView extends StatelessWidget {
  const SubtractionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengurangan',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.orange[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Pengurangan adalah operasi matematika untuk mengurangi satu angka dari angka lainnya.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'MochiyPopOne',
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.orangeAccent,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text(
                      'Contoh:',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'MochiyPopOne',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '5 - 2 = 3\n\nArtinya: Dari 5 apel, jika diambil 2, maka tersisa 3 apel.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'MochiyPopOne',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              'assets/images/subtraction_apples.png',
              height: 180,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
