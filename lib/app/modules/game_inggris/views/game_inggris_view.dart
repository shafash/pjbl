import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/game_inggris_controller.dart';

class GameInggrisView extends GetView<GameInggrisController> {
  const GameInggrisView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GameInggrisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GameInggrisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
