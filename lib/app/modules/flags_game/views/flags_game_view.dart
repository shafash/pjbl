import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/flags_game_controller.dart';

class FlagsGameView extends GetView<FlagsGameController> {
  const FlagsGameView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tebak Bendera',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB3C7D6),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: const Color(0xFFF8F4F1),
      body: Obx(() {
        if (c.isFinished.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🎉 Yeay!',
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Skor: ${c.score.value} / ${c.flags.length}',
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: c.resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black87,
                  ),
                  child: Text(
                    'Main Lagi',
                    style: GoogleFonts.mochiyPopOne(fontSize: 18),
                  ),
                )
              ],
            ),
          );
        }

        final current = c.flags[c.currentIndex.value];
        final emoji = current['emoji']!;
        final correctCountry = current['country']!;
        final options = c.getShuffledOptions(correctCountry);

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Seret bendera ke nama negaranya!',
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 18,
                  color: Colors.black87, // font warna kontras
                ),
              ),
              const SizedBox(height: 30),

              // DRAGGABLE EMOJI FLAG
              Draggable<String>(
                data: correctCountry,
                feedback: Material(
                  color: Colors.transparent,
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 80),
                  ),
                ),
                childWhenDragging: Opacity(
                  opacity: 0.3,
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 80),
                  ),
                ),
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 80),
                ),
              ),

              const SizedBox(height: 40),

              // DROP TARGETS
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: options.map((country) {
                  return DragTarget<String>(
                    onAccept: (data) {
                      if (data == country && country == correctCountry) {
                        c.score.value++;
                      }
                      c.nextFlag();
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        width: 150,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            )
                          ],
                        ),
                        child: Text(
                          country,
                          style: GoogleFonts.mochiyPopOne(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        );
      }),
    );
  }
}
