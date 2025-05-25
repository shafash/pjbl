import 'package:get/get.dart';
import '../../tugas/controllers/tugas_controller.dart';
import 'package:flutter/material.dart';

class ProfilController extends GetxController {
  var userName = 'Anak Hebat'.obs;
  final TugasController tugasController = Get.find<TugasController>();

  var badgeLevel = 1.obs;
  var badgePoint = 50.obs;
  final int maxBadgeLevel = 3;

  void addPoints(int points) {
    badgePoint.value += points;
    if (badgePoint.value >= 100 * badgeLevel.value &&
        badgeLevel.value < maxBadgeLevel) {
      badgeLevel.value += 1;
      badgePoint.value = 0;
    }
  }

  List<Widget> buildBadges() {
    List<Widget> badges = [];
    for (int i = 1; i <= maxBadgeLevel; i++) {
      badges.add(Column(
        children: [
          Icon(
            Icons.star,
            size: 40,
            color: i <= badgeLevel.value ? Colors.amber : Colors.grey[300],
          ),
          Text('Level $i', style: const TextStyle(fontFamily: 'MochiyPopOne')),
          if (i == badgeLevel.value)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: LinearProgressIndicator(
                value: badgePoint.value / 100,
                color: Colors.amber,
                backgroundColor: Colors.grey[300],
                minHeight: 6,
              ),
            )
        ],
      ));
    }
    return badges;
  }
}
