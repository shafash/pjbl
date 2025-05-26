import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../controllers/kuis_pkn_controller.dart';

class KuisPknView extends StatelessWidget {
  const KuisPknView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KuisPknController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis PPKn'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller.confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.25,
              colors: const [
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.pink,
                Colors.purple,
              ],
            ),
          ),
          Obx(() {
            final currentQuestion =
                controller.soalList[controller.currentIndex.value];
            final questionText = currentQuestion['question'] as String;
            final options = (currentQuestion['options'] as List).cast<String>();
            final correctAnswer = currentQuestion['answer'] as String;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal ${controller.currentIndex.value + 1}/${controller.soalList.length}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    questionText,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ...options.map((option) {
                    Color bgColor = Colors.grey.shade200;

                    if (controller.answered.value) {
                      if (option == correctAnswer) {
                        bgColor = Colors.green.shade400;
                      } else if (option != correctAnswer &&
                          option == option &&
                          !controller.correct.value) {
                        // Incorrect selected option
                        bgColor = Colors.red.shade200;
                      } else {
                        bgColor = Colors.grey.shade200;
                      }
                    }

                    return GestureDetector(
                      onTap: () => controller.answerQuestion(option),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.answered.value
                                ? (option == correctAnswer
                                    ? Colors.green.shade700
                                    : Colors.red.shade300)
                                : Colors.grey.shade400,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 16),
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
                          backgroundColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                        ),
                        child: const Text(
                          'Lanjut',
                          style: TextStyle(fontSize: 18),
                        ),
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
