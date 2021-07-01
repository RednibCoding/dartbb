part of '../interface.dart';

Font LoadFont(String path) {
  return Core.dartbbCtx.graphics.loadFont(path);
}

void SetFont(Font font,
    [int size = 16, bool bold = false, bool italic = false, int weight = 0]) {
  Core.dartbbCtx.graphics.setFont(font, size, bold, italic, weight);
}
