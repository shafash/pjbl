import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../controllers/kuis_ipa_controller.dart';

class KuisIpaView extends StatelessWidget {
  const KuisIpaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<KuisIpaController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuis IPA',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
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
                Colors.green,
                Colors.blue,
                Colors.orange,
                Colors.purple,
              ],
            ),
          ),
          Obx(() {
            final q = c.soalList[c.currentIndex.value];
            final questionText = q['question'] as String;
            final options = (q['options'] as List<dynamic>).cast<String>();
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
                    questionText,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ...options.map((opt) {
                    final isCorrect = c.answered.value && opt == correctAnswer;
                    final isSelected = c.answered.value &&
                        opt != correctAnswer &&
                        c.correct.value == false &&
                        opt == opt &&
                        opt != correctAnswer;
                    final isWrongSelected = c.answered.value &&
                        opt != correctAnswer &&
                        c.correct.value == false &&
                        opt == opt &&
                        opt == opt;

                    return GestureDetector(
                      onTap: () {
                        if (!c.answered.value) {
                          c.answerQuestion(opt);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: c.answered.value
                              ? (opt == correctAnswer
                                  ? Colors.green
                                  : (c.correct.value == false &&
                                          opt ==
                                              c.soalList[c.currentIndex.value]
                                                  ['selectedAnswer'])
                                      ? Colors.red.shade200
                                      : Colors.grey.shade200)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(opt, style: const TextStyle(fontSize: 16)),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  if (c.answered.value)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (c.currentIndex.value == c.soalList.length - 1) {
                            _showResultDialog(context, c.totalCorrect.value,
                                c.totalWrong.value);
                          } else {
                            c.nextQuestion();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          c.currentIndex.value == c.soalList.length - 1
                              ? 'Selesai'
                              : 'Lanjut',
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

  void _showResultDialog(BuildContext context, int correct, int wrong) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Hasil Kuis'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Jawaban Benar: $correct'),
            Text('Jawaban Salah: $wrong'),
            const SizedBox(height: 16),
            const Text('🎉 Selamat! Kamu telah menyelesaikan kuis IPA.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Get.back();
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
