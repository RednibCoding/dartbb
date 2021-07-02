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

void SetImageMidhandle(Image image, bool val) {
  image.setMidHandle(val);
}

void HandleImage(Image image, num x, num y) {
  image.setHandle(x, y);
}

void ScaleImage(Image image, num x, num y) {
  image.setScale(x, y);
}

void RotateImage(Image image, num rotation) {
  image.setRotation(rotation);
}

void AddImageRotation(Image image, num rotation) {
  image.setRotation(rotation + image.rotation);
}

num ImageRotation(Image image) {
  return image.rotation;
}
