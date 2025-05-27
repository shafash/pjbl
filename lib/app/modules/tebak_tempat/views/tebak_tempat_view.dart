import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tebak_tempat_controller.dart';

class TebakTempatView extends StatelessWidget {
  TebakTempatView({Key? key}) : super(key: key);

  final TebakTempatController controller = Get.put(TebakTempatController());

  final Color pastelBackground = const Color(0xFFFFF8E1);
  final Color pastelAccent = const Color(0xFFFFF3B0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pastelBackground,
      appBar: AppBar(
        backgroundColor: pastelAccent,
        elevation: 0,
        title: Obx(() => Text(
              controller.sudahSelesai.value
                  ? 'Hasil'
                  : 'Soal ${controller.indexSoal.value + 1}/${controller.soal.length}',
              style: const TextStyle(
                  fontFamily: 'MochiyPopOne', color: Colors.black87),
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.sudahSelesai.value) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Skor Kamu: ${controller.skor.value}/${controller.soal.length}',
                    style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pastelAccent,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: controller.ulangi,
                    child: const Text('Ulangi',
                        style: TextStyle(fontFamily: 'MochiyPopOne')),
                  ),
                ],
              ),
            );
          }

          final soalSekarang = controller.soal[controller.indexSoal.value];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    soalSekarang['gambar']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: pastelAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  soalSekarang['clue']!,
                  style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 14,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tebak nama tempat wisata ini!',
                style: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 20,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.answerController,
                onChanged: (val) => controller.jawabanUser.value = val,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Ketik jawaban kamu di sini',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: Colors.black87),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pastelAccent,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: controller.submitJawaban,
                child: const Text('Submit',
                    style: TextStyle(fontFamily: 'MochiyPopOne', fontSize: 18)),
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }
}
