import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../tugas/controllers/tugas_controller.dart';

class TugasDetailView extends StatelessWidget {
  final TugasController tugasController = Get.find<TugasController>();
  final ImagePicker _picker = ImagePicker();

  TugasDetailView({super.key});

  Future<void> _pilihFotoDanKumpulkan(BuildContext context, int index) async {
    final XFile? foto = await _picker.pickImage(source: ImageSource.gallery);
    if (foto != null) {
      tugasController.kumpulkanTugas(index);
      Get.snackbar(
        'Berhasil',
        'Tugas berhasil dikumpulkan dengan foto!',
        backgroundColor: Colors.green.shade100,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final int index = Get.arguments ?? 0;
    final tugas = tugasController.tugasList[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(tugas.judul),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tugas.emoji,
                  style: const TextStyle(fontSize: 80),
                ),
                const SizedBox(height: 20),
                Text(
                  tugas.judul,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MochiyPopOne',
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  tugas.deskripsi,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'MochiyPopOne',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: Icon(
                    tugas.terkumpul.value
                        ? Icons.check_circle
                        : Icons.upload_file,
                    color: Colors.white,
                  ),
                  label: Text(
                    tugas.terkumpul.value
                        ? 'Tugas Sudah Dikumpulkan'
                        : 'Kumpulkan Tugas',
                    style: const TextStyle(fontFamily: 'MochiyPopOne'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tugas.terkumpul.value
                        ? Colors.green
                        : Colors.pinkAccent.shade100,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (!tugas.terkumpul.value) {
                      _pilihFotoDanKumpulkan(context, index);
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
