import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class KuisInggrisController extends GetxController {
  final currentIndex = 0.obs;
  final answered = false.obs;
  final correct = false.obs;

  final totalCorrect = 0.obs;
  final totalWrong = 0.obs;

  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  final List<Map<String, dynamic>> soalList = [
    {
      'question': 'What color is the sky on a clear day?',
      'options': ['Red', 'Green', 'Blue', 'Yellow'],
      'answer': 'Blue'
    },
    {
      'question': 'How do you say "kucing" in English?',
      'options': ['Dog', 'Bird', 'Cat', 'Fish'],
      'answer': 'Cat'
    },
    {
      'question': 'What number comes after five?',
      'options': ['Six', 'Four', 'Seven', 'Ten'],
      'answer': 'Six'
    },
    {
      'question': 'What do you wear on your feet?',
      'options': ['Hat', 'Shirt', 'Shoes', 'Gloves'],
      'answer': 'Shoes'
    },
    {
      'question': 'How do you say "selamat pagi" in English?',
      'options': ['Good night', 'Good morning', 'Hello', 'Goodbye'],
      'answer': 'Good morning'
    },
    {
      'question': 'What animal says "woof woof"?',
      'options': ['Cat', 'Dog', 'Bird', 'Duck'],
      'answer': 'Dog'
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
