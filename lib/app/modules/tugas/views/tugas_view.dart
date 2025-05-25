import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tugas_controller.dart';

class TugasView extends StatelessWidget {
  final TugasController controller = Get.put(TugasController());

  TugasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F3), // Soft pink background
      appBar: AppBar(
        title: const Text(
          'Tugas Anak SD',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade100,
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.tugasList.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              final tugas = controller.tugasList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Text(
                      tugas.emoji,
                      style: const TextStyle(fontSize: 40), // Maksimalin emoji!
                    ),
                    title: Text(
                      tugas.judul,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MochiyPopOne',
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        tugas.deskripsi,
                        style: const TextStyle(
                          fontFamily: 'MochiyPopOne',
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: tugas.terkumpul.value
                            ? Colors.green
                            : Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tugas.terkumpul.value ? 'Terkumpul' : 'Kumpulkan',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'MochiyPopOne',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed('/tugas-detail', arguments: index);
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
