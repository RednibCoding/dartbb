part of '../interface.dart';

bool KeyDown(int key) {
  return Core.dartbbCtx.keyboard.down(key);
}

bool KeyHit(int key) {
  return Core.dartbbCtx.keyboard.hit(key);
}

void FlushKeys() {
  Core.dartbbCtx.keyboard.flush();
}
