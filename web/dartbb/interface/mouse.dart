part of '../interface.dart';

num MouseX() {
  return Core.dartbbCtx.mouse.x;
}

num MouseY() {
  return Core.dartbbCtx.mouse.y;
}

num MouseZ() {
  return Core.dartbbCtx.mouse.z;
}

num MouseXSpeed() {
  return Core.dartbbCtx.mouse.speedX();
}

num MouseYSpeed() {
  return Core.dartbbCtx.mouse.speedY();
}

num MouseZSpeed() {
  return Core.dartbbCtx.mouse.speedZ();
}

bool MouseDown(int key) {
  return Core.dartbbCtx.mouse.down(key);
}

bool MouseHit(int key) {
  return Core.dartbbCtx.mouse.hit(key);
}

void HideMouse() {
  Core.dartbbCtx.mouse.hide();
}

void ShowMouse() {
  Core.dartbbCtx.mouse.show();
}

bool IsMouseHidden() {
  return Core.dartbbCtx.mouse.isHidden;
}

void FlushMouse() {
  Core.dartbbCtx.mouse.flush();
}
