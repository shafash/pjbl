import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class KuisBahasaIndonesiaController extends GetxController {
  final currentIndex = 0.obs;
  final answered = false.obs;
  final correct = false.obs;
  final correctAnswers = 0.obs;
  final selectedAnswer = RxnString();
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  final List<Map<String, dynamic>> soalList = [
    {
      'question': 'Sinonim dari "indah" adalah?',
      'options': ['Cantik', 'Buruk', 'Kotor', 'Gelap'],
      'answer': 'Cantik'
    },
    {
      'question': 'Lawan kata "besar" adalah?',
      'options': ['Tinggi', 'Panjang', 'Kecil', 'Lebar'],
      'answer': 'Kecil'
    },
    {
      'question': 'Kata tanya untuk tempat adalah?',
      'options': ['Apa', 'Di mana', 'Kapan', 'Mengapa'],
      'answer': 'Di mana'
    },
    {
      'question': 'Kalimat yang mengandung perintah disebut?',
      'options': ['Tanya', 'Seru', 'Berita', 'Perintah'],
      'answer': 'Perintah'
    },
    {
      'question': 'Bahasa Indonesia berasal dari?',
      'options': ['Melayu', 'Arab', 'Jawa', 'Sunda'],
      'answer': 'Melayu'
    },
    {
      'question': 'Kalimat: "Ayah pergi ke pasar." adalah kalimat?',
      'options': ['Perintah', 'Berita', 'Tanya', 'Seru'],
      'answer': 'Berita'
    },
  ];

  void answerQuestion(String selected) {
    if (answered.value) return;
    final correctAnswer = soalList[currentIndex.value]['answer']!;
    selectedAnswer.value = selected; // <== ini tambahan
    answered.value = true;
    correct.value = selected == correctAnswer;
    if (correct.value) {
      correctAnswers.value++;
      confettiController.play();
    }
  }

  void nextQuestion() {
    if (currentIndex.value < soalList.length - 1) {
      currentIndex.value++;
      answered.value = false;
      correct.value = false;
      selectedAnswer.value = null; // reset jawaban terpilih
    }
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }
}
