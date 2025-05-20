import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KuisIpsController extends GetxController {
  final soalIps = <Map<String, dynamic>>[
    {
      'question': 'Apa nama ibukota Indonesia?',
      'options': ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
      'answer_index': 0,
    },
    {
      'question': 'Apa pekerjaan seorang guru?',
      'options': ['Mengajar', 'Berkebun', 'Memasak', 'Menyanyi'],
      'answer_index': 0,
    },
    {
      'question': 'Kita harus menjaga ... agar tetap bersih.',
      'options': ['Rumah', 'Kamar mandi', 'Lingkungan', 'Sepatu'],
      'answer_index': 2,
    },
    {
      'question': 'Apa alat transportasi yang ada di jalan?',
      'options': ['Pesawat', 'Kapal', 'Mobil', 'Kereta api bawah tanah'],
      'answer_index': 2,
    },
    {
      'question': 'Hari apa yang kita rayakan untuk kemerdekaan Indonesia?',
      'options': ['1 Januari', '17 Agustus', '25 Desember', '10 November'],
      'answer_index': 1,
    },
    {
      'question': 'Apa warna bendera Indonesia?',
      'options': [
        'Merah dan Putih',
        'Hijau dan Putih',
        'Merah dan Kuning',
        'Biru dan Putih'
      ],
      'answer_index': 0,
    },
  ];

  var currentIndex = 0.obs;
  var score = 0.obs;
  var selectedOption = (-1).obs;

  void pilihJawaban(int index) {
    selectedOption.value = index;
  }

  void nextQuestion() {
    if (selectedOption.value == soalIps[currentIndex.value]['answer_index']) {
      score.value++;
    }
    selectedOption.value = -1;
    if (currentIndex.value < soalIps.length - 1) {
      currentIndex.value++;
    } else {
      Get.defaultDialog(
        title: 'Selesai!',
        middleText: 'Skormu: ${score.value} dari ${soalIps.length}',
        textConfirm: 'Ulangi',
        onConfirm: () {
          score.value = 0;
          currentIndex.value = 0;
          selectedOption.value = -1;
          Get.back();
        },
        textCancel: 'Keluar',
        onCancel: () => Get.back(),
      );
    }
  }
}

class KuisIpsView extends StatelessWidget {
  KuisIpsView({Key? key}) : super(key: key);

  final KuisIpsController controller = Get.put(KuisIpsController());

  final Color backgroundColor = Color(0xFFFFF8E1); // Pastel kuning muda
  final Color primaryColor = Color(0xFF81D4FA); // Pastel biru muda
  final Color accentColor = Color(0xFFFFCC80); // Pastel oranye

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Kuis IPS'),
        centerTitle: true,
      ),
      body: Obx(() {
        final q = controller.soalIps[controller.currentIndex.value];
        final selected = controller.selectedOption.value;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Soal ${controller.currentIndex.value + 1} dari ${controller.soalIps.length}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  q['question'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: (q['options'] as List).length,
                  itemBuilder: (context, index) {
                    final option = (q['options'] as List)[index] as String;
                    final isSelected = selected == index;
                    return Card(
                      color: isSelected
                          ? primaryColor.withOpacity(0.7)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color:
                              isSelected ? primaryColor : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          option,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                        onTap: () {
                          controller.pilihJawaban(index);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: selected == -1 ? null : controller.nextQuestion,
                  child: Text(
                    controller.currentIndex.value ==
                            controller.soalIps.length - 1
                        ? 'Selesai'
                        : 'Lanjut',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
