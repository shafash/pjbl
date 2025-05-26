import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/find_letter_game_controller.dart';

class FindMissingLetterView extends GetView<FindMissingLetterController> {
  const FindMissingLetterView({super.key});

  static const Map<String, String> emojiClues = {
    'APPLE': '🍎',
    'BANANA': '🍌',
    'CHERRY': '🍒',
    'DOG': '🐶',
    'ELEPHANT': '🐘',
    'FISH': '🐟',
    'GRAPE': '🍇',
    'HOUSE': '🏠',
    'ICE': '🧊',
    'JUMP': '🤸',
  };

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4F1),
      appBar: AppBar(
        title: Text(
          'Find the Missing Letter',
          style: GoogleFonts.mochiyPopOne(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB3C7D6),
        elevation: 0,
      ),
      body: Obx(() {
        if (c.isFinished.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🎉 Congratulations! 🎉',
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your score: ${c.score.value} / ${c.totalQuestions}',
                  style: GoogleFonts.mochiyPopOne(fontSize: 22),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: c.resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB3C7D6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    'Play Again',
                    style: GoogleFonts.mochiyPopOne(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          );
        }

        final currentWord = c.currentWord;
        final missingIndex = c.missingIndex.value;
        final displayWord = List.generate(currentWord.length, (index) {
          if (index == missingIndex) {
            return '_';
          }
          return currentWord[index];
        }).join(' ');

        final currentWordStr = currentWord.join('');
        final emoji = emojiClues[currentWordStr] ?? '❓';

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Question ${c.questionNumber.value} of ${c.totalQuestions}',
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 10),
              Text(emoji, style: const TextStyle(fontSize: 60)),
              const SizedBox(height: 10),
              Text(
                displayWord,
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: c.options.map((option) {
                  Color bgColor = const Color(0xFFE0DFE3);
                  Color textColor = Colors.black87;

                  final isSelected = c.selectedAnswer.value == option;
                  final isCorrect = option == currentWord[missingIndex];

                  if (c.selectedAnswer.value != null) {
                    if (isSelected && isCorrect) {
                      bgColor = Colors.green.shade400;
                      textColor = Colors.white;
                    } else if (isSelected && !isCorrect) {
                      bgColor = Colors.red.shade400;
                      textColor = Colors.white;
                    } else if (isCorrect) {
                      bgColor = Colors.green.shade300;
                      textColor = Colors.white;
                    }
                  }

                  return GestureDetector(
                    onTap: c.selectedAnswer.value == null
                        ? () => c.selectedAnswer.value = option
                        : null,
                    child: Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(2, 2)),
                        ],
                      ),
                      child: Text(
                        option,
                        style: GoogleFonts.mochiyPopOne(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (c.selectedAnswer.value == null) {
                      Get.snackbar(
                          'Peringatan', 'Pilih jawaban terlebih dahulu');
                      return;
                    }

                    c.checkAnswer(c.selectedAnswer.value!);

                    Future.delayed(const Duration(seconds: 1), () {
                      c.nextQuestion();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB3C7D6),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.mochiyPopOne(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
