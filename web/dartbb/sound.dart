library dartbb.sound;

import 'dart:html';

class Sound {
  late var _element = AudioElement();

  Sound(AudioElement audio, bool loop, bool autoplay) {
    _element = audio;
    _element.loop = loop;
    _element.autoplay = autoplay;
  }

  bool get paused => _element.paused;

  void play() {
    _element.play();
  }

  void pause() {
    _element.pause();
  }

  void stop() {
    _element.pause();
    _element.currentTime = 0;
  }

  void restart() {
    stop();
    play();
  }
}
