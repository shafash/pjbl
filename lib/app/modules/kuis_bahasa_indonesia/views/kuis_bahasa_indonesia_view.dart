import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../controllers/kuis_bahasa_indonesia_controller.dart';

class KuisBahasaIndonesiaView extends StatelessWidget {
  const KuisBahasaIndonesiaView({Key? key}) : super(key: key);

  void _showResultDialog(BuildContext context, int benar, int total) {
    final salah = total - benar;
    final nilai = ((benar / total) * 100).toStringAsFixed(0);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          '🎉 Selamat!',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nilai kamu: $nilai', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text('Benar: $benar', style: const TextStyle(color: Colors.green)),
            Text('Salah: $salah', style: const TextStyle(color: Colors.red)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<KuisBahasaIndonesiaController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuis Bahasa Indonesia',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
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
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.pink,
                Colors.purple
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
                    final isSelected = c.selectedAnswer.value == opt;
                    final isCorrect = c.answered.value && opt == correctAnswer;
                    final isWrong =
                        c.answered.value && opt != correctAnswer && isSelected;

                    Color bgColor =
                        isDark ? Colors.grey.shade800 : Colors.white;
                    if (c.answered.value) {
                      if (isCorrect) {
                        bgColor = Colors.green;
                      } else if (isWrong) {
                        bgColor = Colors.red.shade300;
                      } else {
                        bgColor = isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade200;
                      }
                    }

                    return GestureDetector(
                      onTap: () => c.answerQuestion(opt),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? Colors.blueAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          opt,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  if (c.answered.value)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final isLast =
                              c.currentIndex.value == c.soalList.length - 1;
                          if (isLast) {
                            c.confettiController.play();
                            _showResultDialog(
                              context,
                              c.correctAnswers.value,
                              c.soalList.length,
                            );
                          } else {
                            c.nextQuestion();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
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
}
