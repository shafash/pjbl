import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final RxDouble volume = 1.0.obs;
  final RxBool isMuted = false.obs;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.setVolume(volume.value);
  }

  void playLoopingAudio() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('audio/your_audio.mp3'));
  }

  void setVolume(double value) {
    volume.value = value;
    if (!isMuted.value) {
      _audioPlayer.setVolume(value);
    }
  }

  void increaseVolume() {
    if (!isMuted.value && volume.value < 1.0) {
      setVolume((volume.value + 0.1).clamp(0.0, 1.0));
    }
  }

  void decreaseVolume() {
    if (!isMuted.value && volume.value > 0.0) {
      setVolume((volume.value - 0.1).clamp(0.0, 1.0));
    }
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
    _audioPlayer.setVolume(isMuted.value ? 0.0 : volume.value);
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
