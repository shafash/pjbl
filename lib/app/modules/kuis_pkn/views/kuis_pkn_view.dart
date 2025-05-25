import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../controllers/kuis_pkn_controller.dart';

class KuisPknView extends StatelessWidget {
  const KuisPknView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(KuisPknController());

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
              confettiController: c.confettiController,
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
            final Map<String, dynamic> q = c.soalList[c.currentIndex.value];
            final options = (q['options'] as List).cast<String>();
            final correctAnswer = q['answer'] as String;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal ${c.currentIndex.value + 1}/${c.soalList.length}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    q['question'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ...options.map((opt) {
                    Color bgColor = Colors.grey.shade200;

                    if (c.answered.value) {
                      if (opt == correctAnswer) {
                        bgColor = Colors.green;
                      } else {
                        bgColor = Colors.red.shade200;
                      }
                    }

                    return GestureDetector(
                      onTap: () => c.answerQuestion(opt),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: c.answered.value
                              ? (opt == correctAnswer
                                  ? Colors.green
                                  : Colors.red.shade200)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          opt,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  if (c.answered.value)
                    Center(
                      child: ElevatedButton(
                        onPressed: c.nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
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
