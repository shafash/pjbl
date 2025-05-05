import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Nama user, bisa di-update nanti dari auth
  var userName = 'Shafa'.obs;

  // List tombol kecil di bawah search bar
  final smallButtons = [
    {'icon': 'assets/icons/book.png', 'tooltip': 'Catatan'},
    {'icon': 'assets/icons/clipboard.png', 'tooltip': 'Tugas'},
    {'icon': 'assets/icons/document.png', 'tooltip': 'Laporan'},
    {'icon': 'assets/icons/database.png', 'tooltip': 'Materi'},
  ];

  // List subjek yang sering dikunjungi, maksimal 6
  final subjects =
      <Map<String, dynamic>>[
        {'name': 'math', 'icon': 'assets/icons/math.png', 'route': '/math'},
        {
          'name': 'membaca',
          'icon': 'assets/icons/membaca.png',
          'route': '/membaca',
        },
        {
          'name': 'English',
          'icon': 'assets/icons/english.png',
          'route': '/english',
        },
        {
          'name': 'world bingo',
          'icon': 'assets/icons/world_bingo.png',
          'route': '/world-bingo',
        },
        {
          'name': 'science',
          'icon': 'assets/icons/science.png',
          'route': '/science',
        },
        {
          'name': 'coding',
          'icon': 'assets/icons/coding.png',
          'route': '/coding',
        },
      ].obs;
}
