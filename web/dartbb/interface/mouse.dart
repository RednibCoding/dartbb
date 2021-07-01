part of '../interface.dart';

num MouseX() {
  return Core.dartbbCtx.mouse.x;
}

num MouseY() {
  return Core.dartbbCtx.mouse.y;
}

bool MouseDown(int key) {
  return Core.dartbbCtx.mouse.down(key);
}

bool MouseHit(int key) {
  return Core.dartbbCtx.mouse.hit(key);
}

void FlushMouse() {
  Core.dartbbCtx.mouse.flush();
}
