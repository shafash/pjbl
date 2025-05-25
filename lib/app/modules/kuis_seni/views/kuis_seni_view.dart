import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/kuis_seni_controller.dart';

class KuisSbkView extends GetView<KuisSeniController> {
  const KuisSbkView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Seni Budaya'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (c.isFinished.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Skor Kamu: ${c.score.value}/${c.soalList.length}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    c.resetKuis();
                    Get.back();
                  },
                  child: const Text('Kembali'),
                ),
              ],
            ),
          );
        }

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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                q['question'],
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ...options.map(
                (option) => Obx(() {
                  final selected = c.selectedAnswer.value == option;
                  final isCorrect = option == correctAnswer;

                  Color color = Colors.grey[200]!;
                  if (selected) {
                    color = isCorrect ? Colors.green : Colors.red;
                  }

                  return GestureDetector(
                    onTap: () => c.selectedAnswer.value = option,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(option),
                    ),
                  );
                }),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (c.selectedAnswer.value != null) {
                      c.nextQuestion();
                    } else {
                      Get.snackbar(
                          'Peringatan', 'Pilih jawaban terlebih dahulu');
                    }
                  },
                  child: const Text('Selanjutnya'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
