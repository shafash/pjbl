import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KuisBahasaIndonesiaView extends StatefulWidget {
  const KuisBahasaIndonesiaView({super.key});

  @override
  State<KuisBahasaIndonesiaView> createState() =>
      _KuisBahasaIndonesiaViewState();
}

class _KuisBahasaIndonesiaViewState extends State<KuisBahasaIndonesiaView> {
  int currentSoal = 0;
  int score = 0;
  bool sudahDijawab = false;
  String? jawabanDipilih;

  final List<Map<String, dynamic>> soalList = [
    {
      'pertanyaan': 'Apa sinonim dari kata "besar"?',
      'opsi': ['Kecil', 'Raksasa', 'Pendek', 'Biasa'],
      'jawaban': 'Raksasa',
    },
    {
      'pertanyaan': 'Apa lawan kata "panas"?',
      'opsi': ['Hangat', 'Terik', 'Dingin', 'Sejuk'],
      'jawaban': 'Dingin',
    },
    {
      'pertanyaan': 'Kata tanya "siapa" digunakan untuk?',
      'opsi': ['Benda', 'Tempat', 'Orang', 'Waktu'],
      'jawaban': 'Orang',
    },
    {
      'pertanyaan': 'Contoh kata benda adalah?',
      'opsi': ['Lari', 'Merah', 'Meja', 'Cantik'],
      'jawaban': 'Meja',
    },
    {
      'pertanyaan': 'Kalimat tanya diakhiri dengan?',
      'opsi': ['Tanda seru', 'Tanda tanya', 'Titik', 'Koma'],
      'jawaban': 'Tanda tanya',
    },
  ];

  void cekJawaban(String jawaban) {
    if (sudahDijawab) return;

    setState(() {
      jawabanDipilih = jawaban;
      sudahDijawab = true;
      if (jawaban == soalList[currentSoal]['jawaban']) {
        score++;
      }
    });
  }

  void soalBerikutnya() {
    if (currentSoal < soalList.length - 1) {
      setState(() {
        currentSoal++;
        sudahDijawab = false;
        jawabanDipilih = null;
      });
    } else {
      // tampilkan skor
      Get.defaultDialog(
        title: 'Skor Akhir',
        middleText:
            'Kamu menjawab $score dari ${soalList.length} soal dengan benar!',
        textConfirm: 'Ulangi',
        textCancel: 'Keluar',
        onConfirm: () {
          setState(() {
            currentSoal = 0;
            score = 0;
            sudahDijawab = false;
            jawabanDipilih = null;
          });
          Get.back();
        },
        onCancel: () => Get.back(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final soal = soalList[currentSoal];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuis Bahasa Indonesia',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soal ${currentSoal + 1}/${soalList.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              soal['pertanyaan'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ...List.generate(soal['opsi'].length, (i) {
              final opsi = soal['opsi'][i];
              final isBenar = opsi == soal['jawaban'];
              final isDipilih = opsi == jawabanDipilih;

              Color warna = Colors.grey.shade200;
              if (sudahDijawab && isDipilih && isBenar) {
                warna = Colors.greenAccent;
              } else if (sudahDijawab && isDipilih && !isBenar) {
                warna = Colors.redAccent.shade100;
              }

              return GestureDetector(
                onTap: () => cekJawaban(opsi),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: warna,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(
                    opsi,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            if (sudahDijawab)
              Center(
                child: ElevatedButton(
                  onPressed: soalBerikutnya,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text(currentSoal == soalList.length - 1
                      ? 'Lihat Skor'
                      : 'Soal Berikutnya'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
