part of '../interface.dart';

void Graphics(int width, int height, Function mainloop) {
  Core.dartbbCtx = Core(width: width, height: height, mainLoop: mainloop);
}

void Begin() {
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

Font LoadFont(String path) {
  return Core.dartbbCtx.graphics.loadFont(path);
}

void SetFont(Font font,
    [int size = 16, bool bold = false, bool italic = false, int weight = 0]) {
  Core.dartbbCtx.graphics.setFont(font, size, bold, italic, weight);
}

int GraphicsWidth() {
  return Core.dartbbCtx.graphics.graphicsWidth;
}

int GraphicsHeight() {
  return Core.dartbbCtx.graphics.graphicsHeight;
}

void SetUiCanvasFocused(bool focused) {
  Core.dartbbCtx.graphics.setUiCanvasFocused(focused);
}
