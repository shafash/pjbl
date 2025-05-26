import 'package:get/get.dart';

class KuisSeniController extends GetxController {
  final soalList = <Map<String, dynamic>>[].obs;
  final currentIndex = 0.obs;
  final selectedAnswer = RxnString();
  final score = 0.obs;
  final isFinished = false.obs;
  final answered = false.obs; // tambah ini untuk cek sudah jawab atau belum

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

  void answerQuestion(String answer) {
    if (answered.value) return; // kalau sudah jawab, jangan ganti lagi
    selectedAnswer.value = answer;
    answered.value = true;

    // cek jawaban benar/tidak
    if (answer == soalList[currentIndex.value]['answer']) {
      score.value++;
    }
  }

  void nextQuestion() {
    if (currentIndex.value < soalList.length - 1) {
      currentIndex.value++;
      selectedAnswer.value = null;
      answered.value = false;
    } else {
      isFinished.value = true;
    }
  }

  void resetKuis() {
    currentIndex.value = 0;
    selectedAnswer.value = null;
    score.value = 0;
    isFinished.value = false;
    answered.value = false;
  }
}
