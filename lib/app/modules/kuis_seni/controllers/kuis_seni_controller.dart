import 'package:get/get.dart';

class KuisSeniController extends GetxController {
  final soalList = <Map<String, dynamic>>[].obs;
  final currentIndex = 0.obs;
  final selectedAnswer = RxnString();
  final score = 0.obs;
  final isFinished = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSoal();
  }

  void loadSoal() {
    soalList.assignAll([
      {
        'question': 'Apa yang dimaksud dengan seni rupa dua dimensi?',
        'options': ['Lukisan', 'Patung', 'Tari', 'Drama'],
        'answer': 'Lukisan',
      },
      {
        'question': 'Contoh seni pertunjukan adalah?',
        'options': ['Lukisan', 'Musik', 'Fotografi', 'Grafis'],
        'answer': 'Musik',
      },
      {
        'question': 'Siapa pelukis terkenal asal Indonesia?',
        'options': [
          'Affandi',
          'Wage Rudolf Supratman',
          'Ki Hajar Dewantara',
          'Soekarno'
        ],
        'answer': 'Affandi',
      },
    ]);
  }

  void nextQuestion() {
    if (selectedAnswer.value == soalList[currentIndex.value]['answer']) {
      score.value++;
    }

    if (currentIndex.value < soalList.length - 1) {
      currentIndex.value++;
      selectedAnswer.value = null;
    } else {
      isFinished.value = true;
    }
  }

  void resetKuis() {
    currentIndex.value = 0;
    selectedAnswer.value = null;
    score.value = 0;
    isFinished.value = false;
  }
}
