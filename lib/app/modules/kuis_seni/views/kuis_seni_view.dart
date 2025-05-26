import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kuis_seni_controller.dart';

class KuisSbkView extends GetView<KuisSeniController> {
  const KuisSbkView({super.key});

  void showFinishDialog(BuildContext context, int score, int total) {
    Get.defaultDialog(
      title: 'Kuis Selesai!',
      titleStyle: const TextStyle(
        fontFamily: 'MochiyPopOne',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlueAccent,
      ),
      content: Text(
        'Skor Kamu: $score / $total',
        style: const TextStyle(fontSize: 20),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.back();
          controller.resetKuis();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: const Text('Selesai'),
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuis Seni Budaya',
          style: TextStyle(fontFamily: 'MochiyPopOne'),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Obx(() {
        // Tampilkan dialog otomatis saat selesai
        if (c.isFinished.value) {
          // Tampilkan dialog sekali saja
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showFinishDialog(context, c.score.value, c.soalList.length);
          });

          // Bisa kasih placeholder kosong supaya gak error
          return const SizedBox.shrink();
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
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MochiyPopOne'),
              ),
              const SizedBox(height: 16),
              Text(
                q['question'],
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ...options.map((option) {
                Color bgColor = Colors.grey.shade200;
                if (c.answered.value) {
                  if (option == correctAnswer) {
                    bgColor = Colors.green;
                  } else if (c.selectedAnswer.value == option) {
                    bgColor = Colors.red.shade200;
                  }
                }

                return GestureDetector(
                  onTap: () {
                    if (!c.answered.value) {
                      c.answerQuestion(option);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }).toList(),
              const Spacer(),
              if (c.answered.value)
                Center(
                  child: ElevatedButton(
                    onPressed: c.nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
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
