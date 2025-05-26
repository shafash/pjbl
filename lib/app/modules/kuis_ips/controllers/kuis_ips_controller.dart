import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class KuisIpsController extends GetxController {
  final currentIndex = 0.obs;
  final answered = false.obs;
  final correct = false.obs;
  final selectedAnswer = ''.obs; // <-- Tambahkan ini
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  final List<Map<String, dynamic>> soalList = [
    {
      'question': 'Ibukota negara Indonesia adalah?',
      'options': ['Bandung', 'Surabaya', 'Jakarta', 'Yogyakarta'],
      'answer': 'Jakarta'
    },
    {
      'question': 'Indonesia terdiri dari berapa provinsi (per 2024)?',
      'options': ['33', '34', '37', '38'],
      'answer': '38'
    },
    {
      'question': 'Rumah adat Tongkonan berasal dari?',
      'options': ['Jawa', 'Toraja', 'Bali', 'Papua'],
      'answer': 'Toraja'
    },
    {
      'question': 'Pahlawan nasional yang terkenal dari Aceh adalah?',
      'options': ['Diponegoro', 'Sukarno', 'Cut Nyak Dien', 'Pattimura'],
      'answer': 'Cut Nyak Dien'
    },
    {
      'question': 'Lagu “Indonesia Raya” diciptakan oleh?',
      'options': ['W.R. Supratman', 'Soekarno', 'Hatta', 'Ismail Marzuki'],
      'answer': 'W.R. Supratman'
    },
    {
      'question': 'Peta digunakan untuk?',
      'options': [
        'Mendengarkan musik',
        'Membaca cerita',
        'Mengetahui letak suatu tempat',
        'Menggambar rumah'
      ],
      'answer': 'Mengetahui letak suatu tempat'
    },
  ];

  void answerQuestion(String selected) {
    if (answered.value) return;
    final correctAnswer = soalList[currentIndex.value]['answer']!;
    selectedAnswer.value = selected; // Set jawaban yang dipilih
    answered.value = true;
    correct.value = selected == correctAnswer;
    if (correct.value) confettiController.play();
  }

  void nextQuestion() {
    if (currentIndex.value < soalList.length - 1) {
      currentIndex.value++;
      answered.value = false;
      correct.value = false;
      selectedAnswer.value = '';
    }
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }
}
