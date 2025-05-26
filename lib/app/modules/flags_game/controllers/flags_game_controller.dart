import 'package:get/get.dart';
import 'dart:math';

class FlagsGameController extends GetxController {
  var score = 0.obs;
  var currentIndex = 0.obs;
  var isFinished = false.obs;

  List<Map<String, String>> flags = [
    {'emoji': '🇮🇩', 'country': 'Indonesia'},
    {'emoji': '🇲🇾', 'country': 'Malaysia'},
    {'emoji': '🇯🇵', 'country': 'Japan'},
    {'emoji': '🇸🇬', 'country': 'Singapore'},
    {'emoji': '🇧🇳', 'country': 'Brunei Darussalam'},
  ];

  List<String> get allCountries =>
      flags.map((flag) => flag['country']!).toList();

  List<String> getShuffledOptions(String correct) {
    List<String> options = [correct];
    var rng = Random();

    while (options.length < 4) {
      String random = allCountries[rng.nextInt(allCountries.length)];
      if (!options.contains(random)) {
        options.add(random);
      }
    }

    options.shuffle();
    return options;
  }

  void nextFlag() {
    if (currentIndex.value + 1 < flags.length) {
      currentIndex.value++;
    } else {
      isFinished.value = true;
    }
  }

  void resetGame() {
    flags.shuffle();
    score.value = 0;
    currentIndex.value = 0;
    isFinished.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    flags.shuffle();
  }
}
