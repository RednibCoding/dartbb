part of '../interface.dart';

Future<Image> LoadImage(String path) async {
  return await Core.dartbbCtx.graphics.loadImage(path);
}

Image CopyImage(Image image) {
  return image.copy();
}

Image CloneImage(Image image) {
  return image.clone();
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

num NaturalImageWidth(Image image) {
  return Core.dartbbCtx.graphics.naturalImageWidth(image);
}

num NaturalImageHeight(Image image) {
  return Core.dartbbCtx.graphics.naturalImageHeight(image);
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

void RotateImage(Image image, num angle) {
  image.setRotation(angle);
}

void AutoRotateImage(Image image, num rotation,
    [num min = 0, num max = 360, bool bounce = false]) {
  image.autoRotate(rotation, min, max, bounce);
}

void AutoHandleImageX(Image image, num step, num min, num max,
    [bool bounce = false]) {
  image.autoHandleX(step, min, max, bounce);
}

void AutoHandleImageY(Image image, num step, num min, num max,
    [bool bounce = false]) {
  image.autoHandleY(step, min, max, bounce);
}

void AutoScaleImageX(Image image, num step, num min, num max,
    [bool bounce = false]) {
  image.autoScaleX(step, min, max, bounce);
}

void AutoScaleImageY(Image image, num step, num min, num max,
    [bool bounce = false]) {
  image.autoScaleY(step, min, max, bounce);
}

// void AutoScaleImage(
//     Image image, num stepX, num minX, num maxX, num stepY, num minY, num maxY,
//     [bool bounce = false]) {
//   image.autoScale(stepX, minX, maxX, stepY, minY, maxY, bounce);
// }

num ImageRotation(Image image) {
  return image.rotation;
}
