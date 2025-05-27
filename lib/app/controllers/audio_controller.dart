import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  final AudioPlayer _player = AudioPlayer();
  var isMuted = false.obs;
  var volume = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    _initAudio();
  }

  void _initAudio() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(volume.value);
    await _player.play(AssetSource('audio/just-relax-111157.mp3'));
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
    _player.setVolume(isMuted.value ? 0 : volume.value);
  }

  void setVolume(double value) {
    volume.value = value;
    if (!isMuted.value) {
      _player.setVolume(value);
    }
  }

  @override
  void onClose() {
    _player.dispose();
    super.onClose();
  }
}
