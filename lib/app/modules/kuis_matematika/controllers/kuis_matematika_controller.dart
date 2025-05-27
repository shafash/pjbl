import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class KuisMatematikaController extends GetxController {
  final currentIndex = 0.obs;
  final answered = false.obs;
  final correct = false.obs;
  final selectedAnswer = ''.obs;
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  final soalList = [
    {
      'question': 'Berapakah 5 + 3?',
      'options': ['6', '7', '8', '9'],
      'answer': '8'
    },
    {
      'question': 'Berapakah hasil 10 - 4?',
      'options': ['5', '6', '7', '8'],
      'answer': '6'
    },
    {
      'question': 'Berapakah 4 × 2?',
      'options': ['6', '8', '10', '12'],
      'answer': '8'
    },
    {
      'question': 'Berapakah 12 ÷ 3?',
      'options': ['2', '3', '4', '5'],
      'answer': '4'
    },
    {
      'question': 'Berapakah 7 + 2?',
      'options': ['8', '9', '10', '11'],
      'answer': '9'
    },
    {
      'question': 'Berapakah 6 × 3?',
      'options': ['18', '16', '20', '22'],
      'answer': '18'
    },
  ];

  void answerQuestion(String selected) {
    if (answered.value) return;
    final correctAnswer = soalList[currentIndex.value]['answer']!;
    selectedAnswer.value = selected; // Simpan jawaban yang dipilih
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
