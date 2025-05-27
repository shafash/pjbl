import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  var userName = 'Nama Pengguna'.obs;
  var searchQuery = ''.obs;

  final box = GetStorage();

  final List<Map<String, String>> smallButtons = [
    {'icon': 'assets/icons/game.png', 'label': 'Game', 'route': '/game-hub'},
    {'icon': 'assets/icons/materi.png', 'label': 'Materi', 'route': '/materi'},
    {'icon': 'assets/icons/quiz.png', 'label': 'Kuis', 'route': '/kuis'},
    {'icon': 'assets/icons/tugas.png', 'label': 'Tugas', 'route': '/tugas'},
  ];

  final List<RxBool> hoverStates = List.generate(4, (_) => false.obs);

  void setHover(int index, bool value) {
    hoverStates[index].value = value;
  }

  final List<Map<String, String>> allSubjects = [
    {
      'icon': 'assets/math.png',
      'name': 'Matematika',
      'route': '/math-submateri',
    },
    {
      'icon': 'assets/english.png',
      'name': 'Bahasa Inggris',
      'route': '/english-submateri',
    },
    {
      'icon': 'assets/ipa.png',
      'name': 'IPA',
      'route': Routes.IPA_SUBMATERI,
    },
    {
      'icon': 'assets/ips.png',
      'name': 'IPS',
      'route': Routes.SUB_MATERI_IPS,
    },
    {
      'icon': 'assets/bahasa_indonesia.png',
      'name': 'Bahasa Indonesia',
      'route': Routes.SUBMATERI_INDONESIA,
    },
    {
      'icon': 'assets/seni.png',
      'name': 'Seni',
      'route': Routes.SUBMATERI_SENI,
    },
  ];

  var frequentlyVisitedSubjects = <Map<String, String>>[].obs;

  // Ini list yang akan menampilkan hasil filter search
  var filteredSubjects = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    userName.value = box.read('userName') ?? 'Nama Pengguna';

    loadMostVisitedSubjects();

    // Setiap searchQuery berubah, jalankan filterSubjects()
    ever(searchQuery, (_) => filterSubjects());
  }

  void loadMostVisitedSubjects() {
    final visitCounts = <String, int>{};

    for (var subject in allSubjects) {
      final route = subject['route']!;
      final count = box.read(route) ?? 0;
      visitCounts[route] = count;
    }

    final sortedSubjects = allSubjects.toList()
      ..sort((a, b) {
        final countA = visitCounts[a['route']!] ?? 0;
        final countB = visitCounts[b['route']!] ?? 0;
        return countB.compareTo(countA);
      });

    frequentlyVisitedSubjects.assignAll(sortedSubjects.take(6));

    // Setelah load data, langsung filter berdasarkan searchQuery sekarang
    filterSubjects();
  }

  void filterSubjects() {
    final query = searchQuery.value.toLowerCase().trim();

    if (query.isEmpty) {
      filteredSubjects.assignAll(frequentlyVisitedSubjects);
    } else {
      filteredSubjects.assignAll(frequentlyVisitedSubjects.where((subject) {
        final name = subject['name']!.toLowerCase();
        return name.contains(query);
      }).toList());
    }
  }

  void recordVisit(String route) {
    final currentCount = box.read(route) ?? 0;
    box.write(route, currentCount + 1);
    loadMostVisitedSubjects();
  }

  void goToSubject(String route) {
    Get.toNamed(route);
  }
}
