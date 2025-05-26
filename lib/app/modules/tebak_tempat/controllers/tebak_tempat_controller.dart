import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TebakTempatController extends GetxController {
  final List<Map<String, String>> soal = [
    {
      'nama': 'borobudur',
      'gambar': 'assets/borobudur.jpg',
      'clue':
          'Candi Buddha terbesar di dunia yang terletak di Magelang, Jawa Tengah.',
    },
    {
      'nama': 'prambanan',
      'gambar': 'assets/prambanan.jpg',
      'clue': 'Kompleks candi Hindu terkenal yang berdiri megah di Yogyakarta.',
    },
    {
      'nama': 'lawangsewu',
      'gambar': 'assets/lawangsewu.jpg',
      'clue':
          'Gedung bersejarah di Semarang yang memiliki banyak pintu dan jendela.',
    },
    {
      'nama': 'monas',
      'gambar': 'assets/monas.jpg',
      'clue': 'Monumen Nasional yang menjadi ikon kota Jakarta.',
    },
    {
      'nama': 'toba',
      'gambar': 'assets/toba.jpg',
      'clue':
          'Danau vulkanik besar dengan Pulau Samosir di tengahnya, terletak di Sumatra Utara.',
    },
    {
      'nama': 'ulun danu',
      'gambar': 'assets/ulundanu.jpg',
      'clue':
          'Pura yang terletak di tepi Danau Beratan, Bali, dikelilingi air dan pegunungan.',
    },
  ];

  var indexSoal = 0.obs;
  var skor = 0.obs;
  var jawabanUser = ''.obs;
  var sudahSelesai = false.obs;

  TextEditingController answerController = TextEditingController();

  void submitJawaban() {
    final jawaban = jawabanUser.value.trim().toLowerCase();
    final jawabanBenar = soal[indexSoal.value]['nama']!.toLowerCase();

    if (jawaban.isEmpty) {
      Get.snackbar('Perhatian', 'Jawaban tidak boleh kosong',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (jawaban == jawabanBenar) {
      skor.value++;
      Get.snackbar('Benar!', 'Jawaban kamu benar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade200);
    } else {
      Get.snackbar(
          'Salah', 'Jawaban yang benar: ${soal[indexSoal.value]['nama']}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade200);
    }

    jawabanUser.value = '';
    answerController.clear();

    if (indexSoal.value < soal.length - 1) {
      indexSoal.value++;
    } else {
      sudahSelesai.value = true;
    }
  }

  void ulangi() {
    skor.value = 0;
    indexSoal.value = 0;
    jawabanUser.value = '';
    sudahSelesai.value = false;
    answerController.clear();
  }
}
