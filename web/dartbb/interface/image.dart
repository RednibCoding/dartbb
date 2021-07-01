part of '../interface.dart';

Future<Image> LoadImage(String path) async {
  return await Core.dartbbCtx.graphics.loadImage(path);
}

void DrawImage(Image image, num x, num y) {
  Core.dartbbCtx.graphics.drawImage(image, x, y);
}

num ImageWidth(Image image) {
  return Core.dartbbCtx.graphics.imageWidth(image);
}

num ImageHeight(Image image) {
  return Core.dartbbCtx.graphics.imageHeight(image);
}
