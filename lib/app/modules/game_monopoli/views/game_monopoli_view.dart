import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_monopoli_controller.dart';
import 'package:kelas_pintar/app/widgets/animated_dice.dart';
import 'package:kelas_pintar/app/widgets/question_popup.dart';

class GameMonopoliView extends GetView<GameMonopoliController> {
  const GameMonopoliView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Game Monopoli - Negara'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// ✅ Akses .value karena currentCountry adalah Rx
            Obx(() => Text(
                  'Kamu berada di: ${controller.currentCountry.value.name}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 20),

            /// Dice animation / tombol lempar dadu
            Obx(() => controller.isRolling.value
                ? AnimatedDice(
                    dice1: controller.dice1.value,
                    dice2: controller.dice2.value,
                    onRollComplete: () {},
                  )
                : ElevatedButton(
                    onPressed: controller.rollDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text('Lempar Dadu 🎲'),
                  )),
            const SizedBox(height: 20),

            /// ✅ Kirim .value karena currentQuestion adalah Rx
            Obx(() => controller.showQuestion.value
                ? QuestionPopup(
                    question: controller.currentQuestion.value,
                    onAnswerSelected: controller.checkAnswer,
                    confettiController: controller.confettiController,
                  )
                : const SizedBox.shrink()),
            const SizedBox(height: 20),

            /// Grid negara
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: controller.countries.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final country = controller.countries[index];
                    final isCurrent = controller.currentIndex.value == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isCurrent ? Colors.amber : Colors.white,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isCurrent
                            ? [
                                const BoxShadow(
                                    color: Colors.yellow, blurRadius: 10)
                              ]
                            : [],
                      ),
                      child: Center(
                        child: Text(
                          country.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isCurrent ? Colors.red : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
