part of '../interface.dart';

Future<Image> LoadImage(String path) async {
  return await Core.dartbbCtx.graphics.loadImage(path);
}

Future<Image> LoadAnimImage(String path, num cellWidth, num cellHeight,
    num startCell, num cellCount) async {
  return await Core.dartbbCtx.graphics
      .loadAnimImage(path, cellWidth, cellHeight, startCell, cellCount);
}

Image CopyImage(Image image) {
  return image.copy();
}

Image CloneImage(Image image) {
  return image.clone();
}

void DrawImage(Image image, num x, num y, [num frame = 1]) {
  Core.dartbbCtx.graphics.drawImage(image, x, y, frame);
}

void DrawAnimImage(
    Image image, num x, num y, num frameFrom, num frameTo, num delay) {
  Core.dartbbCtx.graphics.drawAnimImage(image, x, y, frameFrom, frameTo, delay);
}

void FlipImageX(Image image) {
  image.flipX();
}

void FlipImageY(Image image) {
  image.flipY();
}

void SetImageAlpha(Image image, num alpha) {
  image.setAlpha(alpha);
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
  image.autoScaleY(
    step,
    min,
    max,
    bounce,
  );
}

void AutoAlphaImage(Image image, num step, num min, num max,
    [bool bounce = false]) {
  image.autoAlpha(step, min, max, bounce);
}

num ImageRotation(Image image) {
  return image.rotation;
}

bool ImageRectsOverlap(Image image1, num image1x, num image1y, Image image2,
    num image2x, num image2y) {
  return Core.dartbbCtx.graphics.rectsOverlap(
      image1x,
      image1y,
      image1.frame.width,
      image1.frame.height,
      image2x,
      image2y,
      image2.frame.width,
      image2.frame.height);
}
