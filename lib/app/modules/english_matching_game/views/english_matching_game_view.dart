import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/english_matching_game_controller.dart';

class EnglishMatchingGameView extends StatelessWidget {
  const EnglishMatchingGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnglishMatchingGameController>(
      init: EnglishMatchingGameController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Matching Game',
              style: TextStyle(fontFamily: 'MochiyPopOne'),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFE0BBE4),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: controller.resetGame,
              )
            ],
          ),
          backgroundColor: const Color(0xFFFFF0F5),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: controller.cards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                final card = controller.cards[index];
                return GestureDetector(
                  onTap: () => controller.flipCard(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: card.isFlipped || card.isMatched
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(card.image),
                          )
                        : const Center(
                            child: Icon(Icons.help_outline,
                                size: 32, color: Colors.deepPurpleAccent),
                          ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
