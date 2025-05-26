import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/kuis_bahasa_inggris_controller.dart';

class KuisInggrisView extends StatelessWidget {
  const KuisInggrisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<KuisInggrisController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'English Quiz',
          style: GoogleFonts.mochiyPopOne(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
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
                Colors.pink,
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
                    'Question ${c.currentIndex.value + 1}/${c.soalList.length}',
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
                    final isWrong = c.answered.value &&
                        opt != correctAnswer &&
                        opt == opt &&
                        opt != correctAnswer;

                    return GestureDetector(
                      onTap: () => c.answerQuestion(opt),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: c.answered.value
                              ? (isCorrect
                                  ? Colors.green
                                  : isWrong
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
                            showResultDialog(
                              context,
                              c.totalCorrect.value,
                              c.totalWrong.value,
                            );
                          } else {
                            c.nextQuestion();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          c.currentIndex.value == c.soalList.length - 1
                              ? 'Selesai'
                              : 'Next',
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

  void showResultDialog(BuildContext context, int correct, int wrong) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hasil Kuis'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Jawaban Benar: $correct'),
            Text('Jawaban Salah: $wrong'),
            const SizedBox(height: 16),
            const Text('🎉 Selamat! Kamu telah menyelesaikan kuis.'),
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
