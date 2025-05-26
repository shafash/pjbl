import 'package:get/get.dart';
import 'dart:math';

class FindMissingLetterController extends GetxController {
  final List<String> wordList = [
    "APPLE",
    "BANANA",
    "CHERRY",
    "DOG",
    "ELEPHANT",
    "FISH",
    "GRAPE",
    "HOUSE",
    "ICE",
    "JUMP",
  ];

  late List<String> currentWord; // e.g. ['A','P','P','L','E']
  var missingIndex = 0.obs;
  var options = <String>[].obs;
  var selectedAnswer = RxnString();
  var questionNumber = 1.obs;
  final totalQuestions = 10;
  var score = 0.obs;
  var isFinished = false.obs;

  final _random = Random();

  @override
  void onInit() {
    super.onInit();
    _startGame();
  }

  void _startGame() {
    questionNumber.value = 1;
    score.value = 0;
    isFinished.value = false;
    _generateQuestion();
  }

  void _generateQuestion() {
    selectedAnswer.value = null;

    // Ambil kata acak
    final word = wordList[_random.nextInt(wordList.length)];
    currentWord = word.split('');

    // Tentukan huruf yang hilang
    missingIndex.value = _random.nextInt(currentWord.length);
    final correctLetter = currentWord[missingIndex.value];

    // Buat pilihan huruf unik (3 acak + 1 benar)
    Set<String> choices = {correctLetter};
    while (choices.length < 4) {
      final letter = String.fromCharCode(_random.nextInt(26) + 65);
      choices.add(letter);
    }

    options.value = choices.toList()..shuffle();

    // Naikkan nomor soal (dilakukan setelah soal ditampilkan)
    // Jadi ketika soal pertama, tampilannya tetap "Question 1"
  }

  void nextQuestion() {
    if (questionNumber.value >= totalQuestions) {
      isFinished.value = true;
    } else {
      questionNumber.value++;
      _generateQuestion();
    }
  }

  bool checkAnswer(String answer) {
    final isCorrect = answer == currentWord[missingIndex.value];
    if (isCorrect) score.value++;
    return isCorrect;
  }

  void resetGame() {
    _startGame();
  }
}
