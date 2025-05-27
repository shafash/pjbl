import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final _player = AudioPlayer();

  static Future<void> play(String assetPath) async {
    try {
      await _player.play(AssetSource(assetPath));
    } catch (e) {
      print('Failed to play audio: $e');
    }
  }
}
