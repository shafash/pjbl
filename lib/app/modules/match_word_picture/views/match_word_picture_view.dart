import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/match_word_picture_controller.dart';

class MatchWordPictureView extends GetView<MatchWordPictureController> {
  const MatchWordPictureView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FF), // pastel lavender
      appBar: AppBar(
        title: Text('Match Word with Picture',
            style: GoogleFonts.mochiyPopOne(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color(0xFFC7CEEA), // pastel purple
        elevation: 0,
      ),
      body: Obx(() {
        if (c.isFinished.value) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('🎉 Well done! 🎉',
                  style: GoogleFonts.mochiyPopOne(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text('Your score: ${c.score.value} / ${c.data.length}',
                  style: GoogleFonts.mochiyPopOne(fontSize: 22)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: c.reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC7CEEA),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Play Again',
                    style: GoogleFonts.mochiyPopOne(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              )
            ]),
          );
        }

        final currentData = c.data[c.currentIndex.value];
        final selected = c.selected.value;
        final hint = c.getHint();

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Timer Bar
              Obx(() => LinearProgressIndicator(
                    value: c.timeLeft.value / 15,
                    color: const Color(0xFFC7CEEA),
                    backgroundColor: Colors.grey[300],
                    minHeight: 8,
                  )),
              const SizedBox(height: 8),
              Obx(() => Text('Time left: ${c.timeLeft.value}s',
                  style: GoogleFonts.mochiyPopOne(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700]))),

              const SizedBox(height: 10),
              Text('Question ${c.currentIndex.value + 1} / ${c.data.length}',
                  style: GoogleFonts.mochiyPopOne(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700])),
              const SizedBox(height: 30),

              // Emoji Picture
              Container(
                height: 150,
                alignment: Alignment.center,
                child: Text(currentData['emoji']!,
                    style: const TextStyle(fontSize: 120)),
              ),

              const SizedBox(height: 40),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: c.options.map((option) {
                  Color bg = const Color(0xFFF1E6FF);
                  Color fg = Colors.black87;

                  if (selected != null) {
                    if (option == selected) {
                      if (option == currentData['word']) {
                        bg = Colors.green.shade300;
                        fg = Colors.white;
                      } else {
                        bg = Colors.red.shade300;
                        fg = Colors.white;
                      }
                    } else if (option == currentData['word']) {
                      bg = Colors.green.shade300;
                      fg = Colors.white;
                    }
                  }

                  return GestureDetector(
                    onTap: selected == null
                        ? () => c.selected.value = option
                        : null,
                    child: Container(
                      width: 130,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              offset: Offset(2, 2))
                        ],
                      ),
                      child: Text(option,
                          style: GoogleFonts.mochiyPopOne(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: fg)),
                    ),
                  );
                }).toList(),
              ),

              if (hint != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Hint: The first letter is "$hint"',
                    style: GoogleFonts.mochiyPopOne(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple),
                  ),
                ),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (c.selected.value == null) {
                      Get.snackbar('Warning', 'Please select an answer first');
                      return;
                    }
                    c.checkAnswer(c.selected.value!);
                    Future.delayed(const Duration(seconds: 1), () {
                      if (c.currentIndex.value == c.data.length - 1) {
                        c.isFinished.value = true;
                      } else {
                        c.nextQuestion();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC7CEEA),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Submit',
                      style: GoogleFonts.mochiyPopOne(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
