part of '../interface.dart';

Future<Sound> LoadSound(String path,
    [bool loop = false, bool autoplay = false]) async {
  return await Core.dartbbCtx.audio.loadSound(path, loop, autoplay);
}

bool IsSoundPlaying(Sound sound) {
  return Core.dartbbCtx.audio.isPlaying(sound);
}

void PlaySound(Sound sound) {
  Core.dartbbCtx.audio.playSound(sound);
}

void StopSound(Sound sound) {
  Core.dartbbCtx.audio.stopSound(sound);
}

void PauseSound(Sound sound) {
  Core.dartbbCtx.audio.pauseSound(sound);
}

void RestartSound(Sound sound) {
  Core.dartbbCtx.audio.restartSound(sound);
}
