part of '../interface.dart';

void Graphics(int width, int height, Function mainloop) {
  Core.dartbbCtx = Core(width: width, height: height, mainLoop: mainloop);
}

void RunGame() {
  Core.dartbbCtx.run();
}

void SetAutoResize(bool val) {
  Core.dartbbCtx.graphics.setAutoResize(val);
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

void TFormFilter(bool val) {
  Core.dartbbCtx.graphics.setTFormFilter(val);
}

void SetAutoMidhandle(bool val) {
  Core.dartbbCtx.graphics.setAutoMidhandle(val);
}

bool IsAutoMidhandle() {
  return Core.dartbbCtx.graphics.autoMidhandle;
}

int GraphicsWidth() {
  return Core.dartbbCtx.graphics.graphicsWidth;
}

int GraphicsHeight() {
  return Core.dartbbCtx.graphics.graphicsHeight;
}

void DrawLine(num startX, num startY, num endX, num endY, [num thickness = 1]) {
  Core.dartbbCtx.graphics.line(startX, startY, endX, endY, thickness);
}

void DrawRect(num x, num y, num width, num height,
    [bool fill = true, num thickness = 1]) {
  Core.dartbbCtx.graphics.rect(x, y, width, height, fill, thickness);
}

void DrawCircle(num centerX, num centerY, num radius,
    [bool fill = true, num thickness = 1]) {
  Core.dartbbCtx.graphics.circle(centerX, centerY, radius, fill, thickness);
}

bool RectsOverlap(
    num x1, num y1, num w1, num h1, num x2, num y2, num w2, num h2) {
  return Core.dartbbCtx.graphics.rectsOverlap(x1, y1, w1, h1, x2, y2, w2, h2);
}
