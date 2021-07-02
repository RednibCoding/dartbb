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
