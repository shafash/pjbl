import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'dart:async';
import 'package:kelas_pintar/app/data/models/math_question.dart';

class MathGameController extends GetxController {
  final score = 0.obs;
  final questionIndex = 0.obs;
  final currentQuestion = Rx<MathQuestion>(MathQuestion.generate());
  final timeLeft = 10.obs;

  late ConfettiController confettiController;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(duration: Duration(seconds: 1));
    startTimer();
  }

  void startTimer() {
    timeLeft.value = 10;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      timeLeft.value--;
      if (timeLeft.value == 0) {
        timer?.cancel();
        Get.snackbar(
            "⏰ Waktu Habis!", "Jawabannya: ${currentQuestion.value.answer}");
        Future.delayed(Duration(milliseconds: 500), nextQuestion);
      }
    });
  }

  void checkAnswer(int selected) {
    timer?.cancel();
    if (selected == currentQuestion.value.answer) {
      score.value += 10;
      confettiController.play();
      Get.snackbar("🎉 Benar!", "Keren banget! 😄");
    } else {
      Get.snackbar("😅 Salah", "Jawabannya: ${currentQuestion.value.answer}");
    }
    Future.delayed(Duration(milliseconds: 800), nextQuestion);
  }

  void nextQuestion() {
    questionIndex.value++;
    currentQuestion.value = MathQuestion.generate();
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
    confettiController.dispose();
    super.onClose();
  }
}
