part of '../interface.dart';

Future<Image> LoadImage(String path) async {
  return await Core.dartbbCtx.loadImage(path);
}

void DrawImage(Image image, num x, num y) {
  Core.dartbbCtx.drawImage(image, x, y);
}
