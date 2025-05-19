import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class AdditionView extends StatelessWidget {
  final List<Map<String, dynamic>> soalPenjumlahan = [
    {"angka1": 2, "angka2": 3},
    {"angka1": 4, "angka2": 5},
    {"angka1": 6, "angka2": 2},
    {"angka1": 1, "angka2": 7},
    {"angka1": 3, "angka2": 6},
    {"angka1": 5, "angka2": 4},
  ];

  final List<Color> warnaKartu = [
    Colors.orange.shade200,
    Colors.green.shade200,
    Colors.purple.shade200,
    Colors.blue.shade200,
    Colors.pink.shade200,
    Colors.teal.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: Text(
          'Belajar Penjumlahan',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: soalPenjumlahan.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.95,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final soal = soalPenjumlahan[index];
            final jawaban = soal["angka1"] + soal["angka2"];
            final warna = warnaKartu[index % warnaKartu.length];

            return GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.orange.shade100,
                    title: Text(
                      "Yuk Hitung!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      "${soal["angka1"]} + ${soal["angka2"]} = $jawaban",
                      style: TextStyle(fontSize: 24),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text("Oke"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: warna,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/math_add.png", // bisa diganti gambar lucu
                      height: 80,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${soal["angka1"]} + ${soal["angka2"]} = ?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MochiyPopOne',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Klik untuk lihat jawaban!",
                      style: TextStyle(fontSize: 14),
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
