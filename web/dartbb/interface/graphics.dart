part of '../interface.dart';

void Graphics(int width, int height, Function mainloop) {
  Core.dartbbCtx = Core(width: width, height: height, mainLoop: mainloop);
}

void RunGame() {
  Core.dartbbCtx.run();
}

void Cls() {
  Core.dartbbCtx.graphics.cls();
}

void ClsColor(int r, int g, int b, [double a = 1.0]) {
  Core.dartbbCtx.graphics.clsColor(r, g, b, a);
}

void SetColor(int r, int g, int b, [double a = 1.0]) {
  Core.dartbbCtx.graphics.setColor(r, g, b, a);
}

int GraphicsWidth() {
  return Core.dartbbCtx.graphics.graphicsWidth;
}

int GraphicsHeight() {
  return Core.dartbbCtx.graphics.graphicsHeight;
}
