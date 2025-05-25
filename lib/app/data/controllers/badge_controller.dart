import 'package:get/get.dart';

class BadgeController extends GetxController {
  RxInt totalPoin = 0.obs;

  String get badgeTitle {
    if (totalPoin.value >= 300) return '🦄 Master';
    if (totalPoin.value >= 200) return '🐤 Jagoan';
    if (totalPoin.value >= 100) return '🐥 Pintar';
    return '🐣 Pemula';
  }

  double get progress {
    int currentLevelMin = 0;
    int currentLevelMax = 100;

    if (totalPoin.value >= 300) {
      currentLevelMin = 300;
      currentLevelMax = 400;
    } else if (totalPoin.value >= 200) {
      currentLevelMin = 200;
      currentLevelMax = 300;
    } else if (totalPoin.value >= 100) {
      currentLevelMin = 100;
      currentLevelMax = 200;
    }

    return ((totalPoin.value - currentLevelMin) /
            (currentLevelMax - currentLevelMin))
        .clamp(0.0, 1.0);
  }

  void tambahPoin(int poin) {
    totalPoin.value += poin;
  }
}
