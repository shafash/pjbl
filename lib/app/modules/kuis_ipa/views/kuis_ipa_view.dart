import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScienceQuizController extends GetxController {
  final questions = <Map<String, dynamic>>[
    {
      'question': 'Apa yang dibutuhkan tumbuhan untuk melakukan fotosintesis?',
      'options': [
        'Air, Cahaya Matahari, dan Karbon Dioksida',
        'Oksigen dan Air',
        'Tanah dan Angin',
        'Sinar UV dan Air'
      ],
      'answerIndex': 0,
    },
    {
      'question': 'Binatang apa yang bisa terbang?',
      'options': ['Ikan', 'Burung', 'Kucing', 'Kelinci'],
      'answerIndex': 1,
    },
    {
      'question': 'Manusia bernapas menggunakan?',
      'options': ['Mulut', 'Hidung', 'Telinga', 'Mata'],
      'answerIndex': 1,
    },
    {
      'question': 'Bagian tumbuhan yang menyerap air adalah?',
      'options': ['Daun', 'Akar', 'Batang', 'Bunga'],
      'answerIndex': 1,
    },
    {
      'question': 'Apa yang digunakan lebah untuk membuat madu?',
      'options': ['Nektar bunga', 'Air hujan', 'Daun', 'Getah pohon'],
      'answerIndex': 0,
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

class ScienceQuizView extends StatelessWidget {
  ScienceQuizView({Key? key}) : super(key: key);

  final ScienceQuizController c = Get.put(ScienceQuizController());

  final pastelColors = [
    Color(0xFFFFCDD2), // pastel red
    Color(0xFFFFF9C4), // pastel yellow
    Color(0xFFC8E6C9), // pastel green
    Color(0xFFBBDEFB), // pastel blue
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF80CBC4), // pastel teal
        title: const Text('Kuis IPA - Ceria dan Interaktif'),
        centerTitle: true,
      ),
      backgroundColor: isDark ? Color(0xFF004D40) : Color(0xFFE0F2F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white70 : Colors.teal.shade900,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.teal.shade700.withOpacity(0.3)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Text(
                    questionText,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.teal.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ...List.generate(options.length, (index) {
                  final option = options[index];
                  final isSelected = c.selectedAnswerIndex.value == index;
                  final isCorrect = answerIndex == index;

                  Color getBackgroundColor() {
                    if (c.selectedAnswerIndex.value == -1) {
                      // belum pilih
                      return pastelColors[index % pastelColors.length];
                    } else if (isSelected) {
                      // pilihan user
                      return isCorrect
                          ? Colors.green.shade400
                          : Colors.red.shade300;
                    } else if (isCorrect) {
                      // jawaban benar tapi tidak dipilih
                      return Colors.green.shade200;
                    } else {
                      return Colors.grey.shade200;
                    }
                  }

                  Color getTextColor() {
                    if (c.selectedAnswerIndex.value == -1) {
                      return Colors.teal.shade900;
                    } else if (isSelected) {
                      return Colors.white;
                    } else if (isCorrect) {
                      return Colors.teal.shade900;
                    } else {
                      return Colors.grey.shade600;
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        c.selectAnswer(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getBackgroundColor(),
                        foregroundColor: getTextColor(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: c.selectedAnswerIndex.value == -1
                      ? null
                      : () {
                          c.nextQuestion();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00897B), // pastel teal dark
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                  ),
                  child: Text(
                    c.currentQuestionIndex.value < c.questions.length - 1
                        ? 'Soal Berikutnya'
                        : 'Selesai',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Skor: ${c.score.value}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.teal.shade900,
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
