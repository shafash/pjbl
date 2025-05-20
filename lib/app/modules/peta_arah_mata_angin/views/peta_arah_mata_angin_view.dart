import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PetaArahMataAnginView extends StatelessWidget {
  const PetaArahMataAnginView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String?>> arah = [
      [null, 'Utara', null],
      ['Barat Laut', 'Utara Timur Laut', 'Timur Laut'],
      ['Barat', 'Tengah', 'Timur'],
      ['Barat Daya', 'Selatan Tenggara', 'Tenggara'],
      [null, 'Selatan', null],
    ];

    final Map<String, Color> warnaArah = {
      'Utara': Colors.blue.shade200,
      'Timur': Colors.red.shade200,
      'Selatan': Colors.green.shade200,
      'Barat': Colors.orange.shade200,
      'Timur Laut': Colors.pink.shade100,
      'Tenggara': Colors.purple.shade100,
      'Barat Daya': Colors.brown.shade200,
      'Barat Laut': Colors.teal.shade100,
      'Utara Timur Laut': Colors.cyan.shade100,
      'Selatan Tenggara': Colors.lime.shade100,
      'Tengah': Colors.grey.shade200,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peta Arah Mata Angin',
          style: GoogleFonts.mochiyPopOne(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: arah.map((baris) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: baris.map((arah) {
                  return arah == null
                      ? const SizedBox(width: 100, height: 100)
                      : Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: warnaArah[arah],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                arah,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mochiyPopOne(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
