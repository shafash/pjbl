import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  late final AudioPlayer _player;

  AudioService._internal() {
    _player = AudioPlayer();
    _player.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> play() async {
    try {
      await _player.play(AssetSource('audio/just-relax-111157.mp3'));
    } catch (e) {
      print('AudioService Error: $e');
    }
  }

  Future<void> stop() async {
    await _player.stop();
  }
}
