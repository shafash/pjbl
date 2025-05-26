import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  double _volume = 0.5;

  Future<AudioService> init() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(_volume);
    await _player.play(AssetSource('audio/just-relx-11157.mp3'));
    _isPlaying = true;
    return this;
  }

  bool get isPlaying => _isPlaying;
  double get volume => _volume;

  void play() {
    _player.resume();
    _isPlaying = true;
  }

  void pause() {
    _player.pause();
    _isPlaying = false;
  }

  void setVolume(double volume) {
    _volume = volume;
    _player.setVolume(volume);
  }
}
