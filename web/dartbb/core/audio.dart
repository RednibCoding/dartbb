library dartbb.audio;

import 'dart:html';

import '../sound.dart';

class Audio {
  Future<Sound> loadSound(String path, bool loop, bool autoplay) async {
    var audio = AudioElement(path);
    return await audio.onCanPlayThrough.first
        .then((value) => Sound(audio, loop, autoplay));
  }

  bool isPlaying(Sound sound) => !sound.paused;

  void playSound(Sound sound) {
    sound.play();
  }

  void stopSound(Sound sound) {
    sound.stop();
  }

  void pauseSound(Sound sound) {
    sound.pause();
  }

  void restartSound(Sound sound) {
    sound.restart();
  }
}
