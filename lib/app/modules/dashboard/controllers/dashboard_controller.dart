import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  var userName = 'Nama Pengguna'.obs;
  var searchQuery = ''.obs;

  final box = GetStorage();

  // Tombol kecil di bawah search bar
  final List<Map<String, String>> smallButtons = [
    {'icon': 'assets/icons/game.png', 'label': 'Game', 'route': '/game-hub'},
    {'icon': 'assets/icons/materi.png', 'label': 'Materi', 'route': '/materi'},
    {'icon': 'assets/icons/quiz.png', 'label': 'Kuis', 'route': '/kuis'},
    {'icon': 'assets/icons/tugas.png', 'label': 'Tugas', 'route': '/tugas'},
  ];

  // Untuk hover effect, kalau dipakai di desktop/web
  final List<RxBool> hoverStates = List.generate(4, (_) => false.obs);

  void setHover(int index, bool value) {
    hoverStates[index].value = value;
  }

  // Semua subjek lengkap
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

  // Subjek yang sering dikunjungi, update saat init dan saat record visit
  var frequentlyVisitedSubjects = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMostVisitedSubjects();

    // Misal userName bisa diset dari storage atau auth service
    userName.value = box.read('userName') ?? 'Nama Pengguna';
  }

  void loadMostVisitedSubjects() {
    final visitCounts = <String, int>{};

    for (var subject in allSubjects) {
      final route = subject['route']!;
      final count = box.read(route) ?? 0;
      visitCounts[route] = count;
    }

    // Urutkan berdasarkan jumlah kunjungan terbesar
    final sortedSubjects = allSubjects.toList()
      ..sort((a, b) {
        final countA = visitCounts[a['route']!] ?? 0;
        final countB = visitCounts[b['route']!] ?? 0;
        return countB.compareTo(countA);
      });

    frequentlyVisitedSubjects.assignAll(sortedSubjects.take(6));
  }

  void recordVisit(String route) {
    final currentCount = box.read(route) ?? 0;
    box.write(route, currentCount + 1);
    loadMostVisitedSubjects();
  }

  // Fungsi navigasi ke halaman subject sesuai route-nya
  void goToSubject(String route) {
    Get.toNamed(route);
  }
}
