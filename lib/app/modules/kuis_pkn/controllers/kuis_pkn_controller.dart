import 'package:get/get.dart';
import 'package:confetti/confetti.dart';

class KuisPknController extends GetxController {
  final currentIndex = 0.obs;
  final answered = false.obs;
  final correct = false.obs;
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  final soalList = [
    {
      'question': 'Pancasila terdiri dari … sila.',
      'options': ['3', '4', '5', '6'],
      'answer': '5'
    },
    {
      'question': 'Sila pertama Pancasila adalah …',
      'options': [
        'Kemanusiaan yang adil dan beradab',
        'Ketuhanan Yang Maha Esa',
        'Persatuan Indonesia',
        'Keadilan sosial bagi seluruh rakyat Indonesia'
      ],
      'answer': 'Ketuhanan Yang Maha Esa'
    },
    {
      'question': 'Lambang sila ke-3 adalah …',
      'options': ['Bintang', 'Rantai', 'Pohon Beringin', 'Padi dan Kapas'],
      'answer': 'Pohon Beringin'
    },
    {
      'question': 'Warga negara harus … hukum yang berlaku.',
      'options': ['Menghindari', 'Melanggar', 'Mentaati', 'Menolak'],
      'answer': 'Mentaati'
    },
    {
      'question': 'Contoh sikap gotong royong adalah …',
      'options': [
        'Bekerja sama membersihkan lingkungan',
        'Menyontek saat ujian',
        'Bertengkar dengan teman',
        'Menolak tugas kelompok'
      ],
      'answer': 'Bekerja sama membersihkan lingkungan'
    },
  ];

  void answerQuestion(String selected) {
    if (answered.value) return;
    final correctAnswer = soalList[currentIndex.value]['answer']!;
    answered.value = true;
    correct.value = selected == correctAnswer;
    if (correct.value) confettiController.play();
  }

  void nextQuestion() {
    if (currentIndex.value < soalList.length - 1) {
      currentIndex.value++;
      answered.value = false;
      correct.value = false;
    }
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }
}
