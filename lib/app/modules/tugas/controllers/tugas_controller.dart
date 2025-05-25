import 'package:get/get.dart';

class Tugas {
  final String judul;
  final String deskripsi;
  final String emoji;
  RxBool terkumpul;
  RxnString fotoPath; // RxnString untuk nullable RxString

  Tugas({
    required this.judul,
    required this.deskripsi,
    required this.emoji,
    bool terkumpul = false,
    String? fotoPath,
  })  : terkumpul = terkumpul.obs,
        fotoPath = RxnString(fotoPath);
}

class TugasController extends GetxController {
  var tugasList = <Tugas>[].obs;

  @override
  void onInit() {
    super.onInit();
    tugasList.addAll([
      Tugas(
        judul: 'Menggambar Pemandangan',
        deskripsi: 'Gambarlah pemandangan alam favoritmu.',
        emoji: '🖼️',
      ),
      Tugas(
        judul: 'Menulis Cerita Pendek',
        deskripsi: 'Tulislah cerita pendek tentang liburanmu.',
        emoji: '✍️',
      ),
      Tugas(
        judul: 'Membuat Kerajinan Tangan',
        deskripsi: 'Buatlah kerajinan tangan dari bahan bekas.',
        emoji: '🧶',
      ),
    ]);
  }

  void kumpulkanTugas(int index, {String? fotoPath}) {
    final tugas = tugasList[index];
    tugas.terkumpul.value = true;
    tugas.fotoPath.value = fotoPath;
    // gak perlu update tugasList[index] karena properti sudah observable
  }

  List<String> getFotoTugas() {
    return tugasList
        .where((tugas) => tugas.terkumpul.value && tugas.fotoPath.value != null)
        .map((tugas) => tugas.fotoPath.value!)
        .toList();
  }
}
