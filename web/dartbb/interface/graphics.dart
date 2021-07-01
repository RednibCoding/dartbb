part of '../interface.dart';

void Graphics(int width, int height, Function mainloop) {
  Core.dartbbCtx = Core(width: width, height: height, mainLoop: mainloop);
}

void Cls() {
  Core.dartbbCtx.cls();
}

void ClsColor(int r, int g, int b, [double a = 1.0]) {
  Core.dartbbCtx.clsColor(r, g, b, a);
}

void SetColor(int r, int g, int b, [double a = 1.0]) {
  Core.dartbbCtx.setColor(r, g, b, a);
}

int GraphicsWidth() {
  return Core.dartbbCtx.graphicsWidth;
}

int GraphicsHeight() {
  return Core.dartbbCtx.graphicsHeight;
}

void SetUiCanvasFocused(bool focused) {
  Core.dartbbCtx.setUiCanvasFocused(focused);
}
