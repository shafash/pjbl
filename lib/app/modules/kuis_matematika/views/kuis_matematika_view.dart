import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class KuisMatematikaController extends GetxController {
  final currentIndex = 0.obs;
  final correct = false.obs;
  final answered = false.obs;
  final confettiController = ConfettiController(duration: Duration(seconds: 2));

  final soalList = [
    {
      'question': 'Berapakah hasil dari 5 + 3?',
      'options': ['6', '7', '8', '9'],
      'answer': '8'
    },
    {
      'question': 'Berapakah hasil dari 4 x 2?',
      'options': ['6', '8', '10', '12'],
      'answer': '8'
    },
    {
      'question': 'Berapakah hasil dari 10 - 4?',
      'options': ['6', '5', '7', '8'],
      'answer': '6'
    },
    {
      'question': 'Berapakah hasil dari 9 + 1?',
      'options': ['11', '10', '9', '12'],
      'answer': '10'
    },
    {
      'question': 'Berapakah hasil dari 6 : 2?',
      'options': ['2', '3', '4', '5'],
      'answer': '3'
    },
    {
      'question': 'Berapakah hasil dari 7 + 2?',
      'options': ['8', '9', '10', '11'],
      'answer': '9'
    },
  ];

  void answerQuestion(String selectedOption) {
    if (answered.value) return;
    final correctAnswer = soalList[currentIndex.value]['answer']!;
    answered.value = true;
    correct.value = selectedOption == correctAnswer;
    if (correct.value) {
      confettiController.play();
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

class KuisMatematikaView extends StatelessWidget {
  const KuisMatematikaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KuisMatematikaController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Matematika'),
        backgroundColor: Colors.red.shade400,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller.confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 20,
              minBlastForce: 5,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.2,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
            ),
          ),
          Obx(() {
            final currentQuestion =
                controller.soalList[controller.currentIndex.value];
            final questionText = currentQuestion['question'] as String;
            final options = currentQuestion['options'] as List<String>;
            final correctAnswer = currentQuestion['answer'] as String;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal ${controller.currentIndex.value + 1}/${controller.soalList.length}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    questionText,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ...options.map((option) {
                    final isCorrect =
                        controller.correct.value && option == correctAnswer;
                    return GestureDetector(
                      onTap: () => controller.answerQuestion(option),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: controller.answered.value
                              ? (isCorrect
                                  ? Colors.green
                                  : option == correctAnswer
                                      ? Colors.green
                                      : Colors.red.shade200)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:
                            Text(option, style: const TextStyle(fontSize: 16)),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  if (controller.answered.value)
                    Center(
                      child: ElevatedButton(
                        onPressed: controller.nextQuestion,
                        child: const Text('Lanjut'),
                      ),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
