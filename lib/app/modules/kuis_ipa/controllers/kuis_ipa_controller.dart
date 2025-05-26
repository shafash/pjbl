import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class KuisIpaController extends GetxController {
  final currentIndex = 0.obs;
  final answered = false.obs;
  final correct = false.obs;
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  final totalCorrect = 0.obs;
  final totalWrong = 0.obs;

  final List<Map<String, dynamic>> soalList = [
    {
      'question': 'Air mengalir dari tempat yang?',
      'options': [
        'Tinggi ke rendah',
        'Rendah ke tinggi',
        'Datar',
        'Luas ke sempit'
      ],
      'answer': 'Tinggi ke rendah'
    },
    {
      'question': 'Matahari terbit dari arah?',
      'options': ['Barat', 'Utara', 'Timur', 'Selatan'],
      'answer': 'Timur'
    },
    {
      'question': 'Bagian tumbuhan yang berfungsi menyerap air adalah?',
      'options': ['Akar', 'Batang', 'Daun', 'Bunga'],
      'answer': 'Akar'
    },
    {
      'question': 'Benda langit yang memancarkan cahaya sendiri adalah?',
      'options': ['Bulan', 'Matahari', 'Bumi', 'Planet'],
      'answer': 'Matahari'
    },
    {
      'question': 'Makhluk hidup yang dapat membuat makanannya sendiri adalah?',
      'options': ['Manusia', 'Hewan', 'Tumbuhan', 'Jamur'],
      'answer': 'Tumbuhan'
    },
    {
      'question':
          'Bagian mata yang berfungsi mengatur banyaknya cahaya adalah?',
      'options': ['Kornea', 'Retina', 'Pupil', 'Lensa'],
      'answer': 'Pupil'
    },
  ];

  void answerQuestion(String selected) {
    if (answered.value) return;
    final correctAnswer = soalList[currentIndex.value]['answer']!;
    answered.value = true;
    correct.value = selected == correctAnswer;

    if (correct.value) {
      totalCorrect.value++;
      confettiController.play();
    } else {
      totalWrong.value++;
    }
  }

  void nextQuestion() {
    if (currentIndex.value < soalList.length - 1) {
      currentIndex.value++;
      answered.value = false;
      correct.value = false;
    }
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }
}
