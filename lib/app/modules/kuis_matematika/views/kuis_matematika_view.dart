import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

import '../controllers/kuis_matematika_controller.dart';

class KuisMatematikaView extends StatelessWidget {
  const KuisMatematikaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KuisMatematikaController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuis Matematika',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
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
            final options =
                (currentQuestion['options'] as List<dynamic>).cast<String>();
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
                    final bool isCorrect =
                        controller.answered.value && option == correctAnswer;
                    final bool isWrong = controller.answered.value &&
                        option != correctAnswer &&
                        option == controller.selectedAnswer.value;

                    // Tentukan warna background sesuai status
                    final Color backgroundColor = controller.answered.value
                        ? (isCorrect
                            ? Colors.green.shade600
                            : isWrong
                                ? Colors.red.shade400
                                : Colors.grey.shade200)
                        : Colors.grey.shade200;

                    // Tentukan warna teks supaya kontras
                    final Color textColor = controller.answered.value
                        ? (isCorrect || isWrong ? Colors.white : Colors.black)
                        : Colors.black;

                    return GestureDetector(
                      onTap: () => controller.answerQuestion(option),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  if (controller.answered.value)
                    Center(
                      child: ElevatedButton(
                        onPressed: controller.nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
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
