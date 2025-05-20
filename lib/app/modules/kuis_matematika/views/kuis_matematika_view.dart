import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathQuizController extends GetxController {
  final questions = <Map<String, dynamic>>[
    {
      'question': 'Berapa 2 + 3?',
      'options': ['4', '5', '6', '3'],
      'answerIndex': 1,
    },
    {
      'question': 'Hitung 7 - 4',
      'options': ['1', '2', '3', '4'],
      'answerIndex': 2,
    },
    {
      'question': '3 x 3 sama dengan?',
      'options': ['6', '9', '8', '7'],
      'answerIndex': 1,
    },
    {
      'question': '10 dibagi 2 adalah?',
      'options': ['4', '5', '6', '7'],
      'answerIndex': 1,
    },
    {
      'question': '5 + 5 - 3 = ?',
      'options': ['6', '7', '8', '9'],
      'answerIndex': 1,
    },
  ];

  var currentQuestionIndex = 0.obs;
  var selectedAnswerIndex = (-1).obs;
  var score = 0.obs;

  void selectAnswer(int index) {
    if (selectedAnswerIndex.value == -1) {
      selectedAnswerIndex.value = index;
      if (index == questions[currentQuestionIndex.value]['answerIndex']) {
        score.value++;
      }
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswerIndex.value = -1;
    } else {
      Get.defaultDialog(
        title: 'Selesai!',
        middleText: 'Skormu: ${score.value} dari ${questions.length}',
        onConfirm: () {
          Get.back();
          resetQuiz();
        },
        textConfirm: 'Ulangi',
      );
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    selectedAnswerIndex.value = -1;
    score.value = 0;
  }
}

class MathQuizView extends StatelessWidget {
  MathQuizView({Key? key}) : super(key: key);

  final MathQuizController c = Get.put(MathQuizController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final softRed = Colors.red.shade700;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.red.shade900 : Colors.red.shade700,
        title: const Text('Kuis Matematika'),
        centerTitle: true,
      ),
      backgroundColor: isDark ? Color(0xFF8B0000) : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final Map<String, dynamic> q =
                c.questions[c.currentQuestionIndex.value];
            final String questionText = q['question'] as String;
            final List<String> options =
                (q['options'] as List<dynamic>).cast<String>();
            final int answerIndex = q['answerIndex'] as int;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Soal ${c.currentQuestionIndex.value + 1} dari ${c.questions.length}',
                  style: TextStyle(
                    fontSize: 20,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.red.shade700.withOpacity(0.2)
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    questionText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : softRed,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(options.length, (index) {
                  final option = options[index];
                  final isSelected = c.selectedAnswerIndex.value == index;
                  final isCorrect = answerIndex == index;

                  Color optionColor() {
                    if (c.selectedAnswerIndex.value == -1) {
                      // Belum memilih jawaban
                      return isDark ? Colors.white : Colors.black87;
                    } else if (isSelected) {
                      // Jawaban dipilih
                      if (isCorrect) {
                        return Colors.green.shade700;
                      } else {
                        return Colors.red.shade700;
                      }
                    } else if (isCorrect) {
                      // Jawaban benar tapi tidak dipilih
                      return Colors.green.shade700.withOpacity(0.7);
                    } else {
                      return isDark ? Colors.white : Colors.black54;
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        c.selectAnswer(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? optionColor()
                            : (isDark
                                ? Colors.red.shade900.withOpacity(0.5)
                                : Colors.red.shade200),
                        foregroundColor: isSelected
                            ? Colors.white
                            : (isDark ? Colors.white : Colors.black87),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: c.selectedAnswerIndex.value == -1
                      ? null
                      : () {
                          c.nextQuestion();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDark ? Colors.red.shade900 : Colors.red.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    c.currentQuestionIndex.value < c.questions.length - 1
                        ? 'Soal Berikutnya'
                        : 'Selesai',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Skor: ${c.score.value}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.red.shade700,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
