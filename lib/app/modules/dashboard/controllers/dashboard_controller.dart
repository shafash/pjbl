import 'package:get/get.dart';

class DashboardController extends GetxController {
  var userName = 'Nama Pengguna'.obs;
  var searchQuery = ''.obs;

  var smallButtons = [
    {'icon': 'assets/icons/game.png', 'label': 'Game', 'route': null},
    {'icon': 'assets/icons/materi.png', 'label': 'Materi', 'route': '/materi'},
    {'icon': 'assets/icons/quiz.png', 'label': 'Kuis', 'route': null},
    {'icon': 'assets/icons/tugas.png', 'label': 'Tugas', 'route': null},
  ];

  var hoverStates = List.generate(4, (_) => false.obs);

  void setHover(int index, bool value) {
    hoverStates[index].value = value;
  }

  var subjects = [
    {
      'icon': 'assets/math.png',
      'name': 'Matematika',
      'route': '/math-submateri'
    },
    {'icon': 'assets/ipa.png', 'name': 'IPA', 'route': '/ipa'},
    {
      'icon': 'assets/bahasa_indonesia.png',
      'name': 'Bahasa Indonesia',
      'route': '/indonesia',
    },
    {
      'icon': 'assets/english.png',
      'name': 'Bahasa Inggris',
      'route': '/english-submateri',
    },
    {
      'icon': 'assets/world_bingo.png',
      'name': 'World Bingo',
      'route': '/worldbingo',
    },
    {'icon': 'assets/seni.png', 'name': 'Seni', 'route': '/seni'},
  ];
}
