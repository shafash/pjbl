import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class MatchingCard {
  final String image;
  bool isFlipped;
  bool isMatched;

  MatchingCard({
    required this.image,
    this.isFlipped = false,
    this.isMatched = false,
  });
}

class EnglishMatchingGameController extends GetxController {
  List<MatchingCard> cards = [];
  bool isWaiting = false;

  final List<String> _images = [
    'assets/fruits/apple.png',
    'assets/fruits/banana.png',
    'assets/animals/cat.png',
    'assets/animals/dog.png',
    'assets/egg.png',
    'assets/fish.png',
    'assets/fruits/grapes.png',
    'assets/clothes/hat.png',
  ];

  var level = 1;
  final int maxLevel = 3;
  late Stopwatch _levelStopwatch;
  int levelTime = 0;

  RxBool isLevelComplete = false.obs;

  @override
  void onInit() {
    super.onInit();
    startLevel(level);
  }

  void startLevel(int newLevel) {
    level = newLevel;
    isWaiting = false;
    _levelStopwatch = Stopwatch()..start();

    final allImages = [..._images, ..._images];
    allImages.shuffle(Random());
    cards = allImages.map((img) => MatchingCard(image: img)).toList();

    isLevelComplete.value = false;
    update();
  }

  void resetGame() {
    startLevel(1);
  }

  void flipCard(int index) async {
    if (cards[index].isFlipped || cards[index].isMatched || isWaiting) return;

    cards[index].isFlipped = true;
    update();

    final flippedCards =
        cards.where((card) => card.isFlipped && !card.isMatched).toList();

    if (flippedCards.length == 2) {
      isWaiting = true;
      await Future.delayed(const Duration(seconds: 1));

      if (flippedCards[0].image == flippedCards[1].image) {
        flippedCards[0].isMatched = true;
        flippedCards[1].isMatched = true;
      } else {
        flippedCards[0].isFlipped = false;
        flippedCards[1].isFlipped = false;
      }

      isWaiting = false;
      update();

      if (cards.every((card) => card.isMatched)) {
        _levelStopwatch.stop();
        levelTime = _levelStopwatch.elapsed.inSeconds;
        isLevelComplete.value = true;
      }
    }
  }
}
