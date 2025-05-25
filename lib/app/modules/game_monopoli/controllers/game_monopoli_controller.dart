import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kelas_pintar/app/data/models/country_question_model.dart';

class GameMonopoliController extends GetxController {
  final currentIndex = 0.obs;
  final isRolling = false.obs;
  final showQuestion = false.obs;

  final dice1 = 1.obs;
  final dice2 = 1.obs;

  final ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  late final List<CountryQuestion> countries;
  final _random = Random();

  /// ✅ Ubah jadi observable:
  final currentCountry = CountryQuestion(
    name: '',
    question: Question(text: '', options: [], answer: ''),
  ).obs;

  final currentQuestion = Question(
    text: '',
    options: [],
    answer: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _loadCountries();
  }

  void _loadCountries() {
    countries = [
      CountryQuestion(
        name: 'Indonesia',
        question: Question(
          text: 'Apa ibu kota Indonesia?',
          options: ['Jakarta', 'Bali', 'Surabaya'],
          answer: 'Jakarta',
        ),
      ),
      CountryQuestion(
        name: 'Jepang',
        question: Question(
          text: 'Apa makanan khas Jepang?',
          options: ['Sushi', 'Pizza', 'Taco'],
          answer: 'Sushi',
        ),
      ),
      CountryQuestion(
        name: 'Amerika Serikat',
        question: Question(
          text: 'Patung Liberty ada di kota apa?',
          options: ['New York', 'Los Angeles', 'Chicago'],
          answer: 'New York',
        ),
      ),
      CountryQuestion(
        name: 'Mesir',
        question: Question(
          text: 'Apa bangunan terkenal di Mesir?',
          options: ['Piramida', 'Menara Eiffel', 'Tembok Besar'],
          answer: 'Piramida',
        ),
      ),
      CountryQuestion(
        name: 'Perancis',
        question: Question(
          text: 'Apa menara terkenal di Paris?',
          options: ['Menara Eiffel', 'Menara Pisa', 'Big Ben'],
          answer: 'Menara Eiffel',
        ),
      ),
      CountryQuestion(
        name: 'India',
        question: Question(
          text: 'Apa nama monumen terkenal di India?',
          options: ['Taj Mahal', 'Borobudur', 'Colosseum'],
          answer: 'Taj Mahal',
        ),
      ),
    ];

    /// ✅ Inisialisasi observable value:
    currentCountry.value = countries.first;
    currentQuestion.value = currentCountry.value.question;
  }

  void rollDice() async {
    isRolling.value = true;
    showQuestion.value = false;

    await Future.delayed(const Duration(milliseconds: 400));

    dice1.value = 1 + _random.nextInt(6);
    dice2.value = 1 + _random.nextInt(6);
    int total = dice1.value + dice2.value;

    for (int i = 0; i < total; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      currentIndex.value = (currentIndex.value + 1) % countries.length;
    }

    await Future.delayed(const Duration(milliseconds: 500));

    /// ✅ Set nilai baru ke observable:
    currentCountry.value = countries[currentIndex.value];
    currentQuestion.value = currentCountry.value.question;
    showQuestion.value = true;

    isRolling.value = false;
  }

  void checkAnswer(String selected) {
    if (selected == currentQuestion.value.answer) {
      confettiController.play();
      Get.snackbar(
        "Benar!",
        "Jawaban kamu benar! 🎉",
        backgroundColor: Colors.green.shade100,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "Oops!",
        "Jawaban kamu salah 😢",
        backgroundColor: Colors.red.shade100,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }

    showQuestion.value = false;
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }
}
