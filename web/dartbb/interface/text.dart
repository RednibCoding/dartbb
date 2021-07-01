part of '../interface.dart';

void DrawText(String text, num x, num y) {
  Core.dartbbCtx.graphics.drawText(text, x, y);
}

num TextWidth(String text) {
  return Core.dartbbCtx.graphics.textWidth(text);
}

num TextHeight(String text) {
  return Core.dartbbCtx.graphics.textHeight(text);
}
