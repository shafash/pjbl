import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

class MatchWordPictureController extends GetxController {
  final List<Map<String, String>> data = [
    {'word': 'Apple', 'emoji': '🍎'},
    {'word': 'Dog', 'emoji': '🐶'},
    {'word': 'Car', 'emoji': '🚗'},
    {'word': 'Cat', 'emoji': '🐱'},
    {'word': 'Banana', 'emoji': '🍌'},
    {'word': 'Fish', 'emoji': '🐟'},
    {'word': 'Book', 'emoji': '📚'},
    {'word': 'Sun', 'emoji': '☀️'},
  ];

  var currentIndex = 0.obs;
  var options = <String>[].obs;
  var selected = RxnString();
  var score = 0.obs;
  var isFinished = false.obs;

  var timeLeft = 15.obs;
  Timer? _timer;

  final _random = Random();

  @override
  void onInit() {
    super.onInit();
    _loadQuestion();
  }

  void _startTimer() {
    timeLeft.value = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value == 0) {
        timer.cancel();
        _onTimeUp();
      } else {
        timeLeft.value--;
      }
    });
  }

  void _onTimeUp() {
    selected.value = null;
    nextQuestion();
  }

  void _loadQuestion() {
    selected.value = null;
    isFinished.value = false;

    final correct = data[currentIndex.value]['word']!;
    options.clear();
    options.add(correct);

    while (options.length < 6) {
      final option = data[_random.nextInt(data.length)]['word']!;
      if (!options.contains(option)) options.add(option);
    }

    options.shuffle();
    _startTimer();
  }

  String? getHint() {
    if (selected.value != null &&
        selected.value != data[currentIndex.value]['word']) {
      // return first letter as hint
      return data[currentIndex.value]['word']![0];
    }
    return null;
  }

  bool checkAnswer(String answer) {
    final correct = data[currentIndex.value]['word']!;
    if (answer == correct) {
      score.value++;
      return true;
    }
    return false;
  }

  void nextQuestion() {
    _timer?.cancel();
    if (currentIndex.value < data.length - 1) {
      currentIndex.value++;
      _loadQuestion();
    } else {
      isFinished.value = true;
    }
  }

  void reset() {
    currentIndex.value = 0;
    score.value = 0;
    isFinished.value = false;
    _loadQuestion();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
