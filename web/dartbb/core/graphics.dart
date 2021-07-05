library dartbb.graphics;

import 'dart:html';
import 'dart:math';
import '../font.dart';
import '../image.dart';
import '../color.dart';

class Graphics {
  late CanvasElement _canvas;
  late Color _clsColor;
  late Color _color;
  bool _autoMidhandle = false;
  late bool _autoResize;

  Graphics(int width, int height) {
    _clsColor = Color(0, 0, 0);
    _color = Color(255, 255, 255);
    _canvas = _createCanvasElement('canvas', width, height);
    _autoResize = false;

    // tabIndex is needed in order for keyboard events to work.
    // Without a tabIndex, the canvas element cannot be focused
    // and an element witout focus cannot receive any events
    _canvas.tabIndex = 9999;
    _canvas.style.outline = 'none';
  }

  int get graphicsWidth => _canvas.width ?? 0;
  int get graphicsHeight => _canvas.height ?? 0;
  CanvasElement get canvas => _canvas;
  bool get autoResize => _autoResize;
  bool get autoMidhandle => _autoMidhandle;

  void setAutoResize(bool val) {
    _autoResize = val;
  }

  void cls() {
    _canvas.context2D
        .setFillColorRgb(_clsColor.r, _clsColor.g, _clsColor.b, _clsColor.a);
    _canvas.context2D.setTransform(1, 0, 0, 1, 0, 0);
    _canvas.context2D
        .fillRect(0, 0, _canvas.width as num, _canvas.height as num);
  }

  void clsColor(int r, int g, int b, [double a = 1.0]) {
    _clsColor.r = r;
    _clsColor.g = g;
    _clsColor.b = b;
    _clsColor.a = a;
  }

  void setColor(int r, int g, int b, [double a = 1.0]) {
    _color.r = r;
    _color.g = g;
    _color.b = b;
    _color.a = a;
  }

  void setAutoMidhandle(bool val) {
    _autoMidhandle = val;
  }

  void setTFormFilter(bool val) {
    _canvas.context2D.imageSmoothingEnabled = val;
  }

  Font loadFont(String path) {
    var name = (path.split('/').last).split('.').first;
    return Font(path, name);
  }

  void setFont(Font font,
      [int size = 16, bool bold = false, bool italic = false, int weight = 0]) {
    var data = '';
    if (bold) {
      if (weight > 0) {
        data += weight.toString();
      } else {
        data += 'bold ';
      }
    }
    if (italic) {
      data += 'oblique ';
    }
    var fontData = '$data${size}px ${font.name}';
    _canvas.context2D.font = fontData;
  }

  void line(num startX, num startY, num endX, num endY, num thickness) {
    _canvas.context2D.setStrokeColorRgb(_color.r, _color.g, _color.b, _color.a);
    var oldLineWidth = _canvas.context2D.lineWidth;
    _canvas.context2D.lineWidth = thickness;
    _canvas.context2D.beginPath();
    _canvas.context2D.moveTo(startX, startY);
    _canvas.context2D.lineTo(endX, endY);
    _canvas.context2D.stroke();
    _canvas.context2D.lineWidth = oldLineWidth;
  }

  void rect(num x, num y, num width, num height, bool fill, num thickness) {
    var oldLineWidth = _canvas.context2D.lineWidth;
    _canvas.context2D.lineWidth = thickness;
    if (fill) {
      _canvas.context2D.setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
      _canvas.context2D.fillRect(x, y, width, height);
    } else {
      _canvas.context2D
          .setStrokeColorRgb(_color.r, _color.g, _color.b, _color.a);
      _canvas.context2D.strokeRect(x, y, width, height);
    }
    _canvas.context2D.lineWidth = oldLineWidth;
  }

  void circle(num centerX, num centerY, num radius, bool fill, num thickness) {
    var oldLineWidth = _canvas.context2D.lineWidth;
    _canvas.context2D.lineWidth = thickness;
    if (fill) {
      _canvas.context2D.setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
      _canvas.context2D.beginPath();
      _canvas.context2D.arc(centerX, centerY, radius, 0, 2 * pi);
      _canvas.context2D.fill();
    } else {
      _canvas.context2D
          .setStrokeColorRgb(_color.r, _color.g, _color.b, _color.a);
      _canvas.context2D.beginPath();
      _canvas.context2D.arc(centerX, centerY, radius, 0, 2 * pi);
      _canvas.context2D.stroke();
    }
    _canvas.context2D.lineWidth = oldLineWidth;
  }

  Future<Image> loadImage(String path) async {
    var image = ImageElement(src: path);
    return await image.onLoad.first.then((value) => Image(image));
  }

  Future<Image> loadAnimImage(String path, num cellWidth, num cellHeight,
      num startCell, num cellCount) async {
    var image = ImageElement(src: path);
    return await image.onLoad.first.then(
        (value) => Image(image, cellWidth, cellHeight, startCell, cellCount));
  }

  void drawImage(Image image, num x, num y, num frame) {
    var origX = x;
    var origY = y;
    x /= image.scaleX;
    y /= image.scaleY;
    if (frame > image.frame.amount) {
      frame = image.frame.start;
    }

    var tilePosX = image.getTilePosX(frame.toInt() - 1);
    var tilePosY = image.getTilePosY(frame.toInt() - 1);
    var dx = x - image.hndlX;
    var dy = y - image.hndlY;
    if (_autoMidhandle || image.midHandle) {
      dx -= image.frame.width / 2;
      dy -= image.frame.height / 2;
    }
    _canvas.context2D.save();
    _canvas.context2D.globalAlpha = image.alpha;
    _canvas.context2D.translate(origX, origY);
    _canvas.context2D.rotate(image.rotation * pi / 180);
    _canvas.context2D.translate(-origX, -origY);
    _canvas.context2D.scale(image.scaleX, image.scaleY);
    _canvas.context2D.drawImageScaledFromSource(
        image.element,
        tilePosX,
        tilePosY,
        image.frame.width,
        image.frame.height,
        dx,
        dy,
        image.frame.width,
        image.frame.height);
    _canvas.context2D.scale(1.0, 1.0);
    _canvas.context2D.restore();
  }

  void drawAnimImage(
      Image image, num x, num y, num frameFrom, num frameTo, num delay) {
    if (image.frame.current < frameFrom) {
      image.frame.current = frameFrom;
    }
    image.elapsedAnimationDelay++;
    if (image.elapsedAnimationDelay >= delay) {
      image.elapsedAnimationDelay = 0.0;
      image.frame.current++;
      if (image.frame.current > frameTo) {
        image.frame.current = frameFrom;
      }
    }
    drawImage(image, x, y, image.frame.current);
  }

  num imageWidth(Image image) {
    return image.frame.width * image.scaleX.abs();
  }

  num imageHeight(Image image) {
    return image.frame.height * image.scaleY.abs();
  }

  num naturalImageWidth(Image image) {
    return image.element.width!;
  }

  num naturalImageHeight(Image image) {
    return image.element.height!;
  }

  void drawText(String text, num x, num y) {
    _canvas.context2D.setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
    _canvas.context2D.fillText(text, x, y);
  }

  num textWidth(String text) {
    return _canvas.context2D.measureText(text).width!;
  }

  num textHeight(String text) {
    var metrics = _canvas.context2D.measureText(text);
    // gets the bounding box height that is constant regardless of the string being rendered
    // ignore: unused_local_variable
    var fontHeight =
        metrics.fontBoundingBoxAscent! + metrics.fontBoundingBoxDescent!;
    // is specific to the string being rendered
    var actualHeight =
        metrics.actualBoundingBoxAscent! + metrics.actualBoundingBoxDescent!;
    return actualHeight;
  }

  bool rectsOverlap(
      num x1, num y1, num w1, num h1, num x2, num y2, num w2, num h2) {
    if ((x1 + w1 >= x2 && x1 <= x2 + w2) &&
        ((y1 + h1 >= y2 && y1 <= y2 + h2))) {
      return true;
    }
    return false;
  }

  CanvasElement _createCanvasElement(String id, int width, int height,
      [bool hidden = false]) {
    // #output is the default div produced by "stagehand web-simple"
    var output = querySelector('#output');
    var canvas = CanvasElement(width: width, height: height);
    canvas.setAttribute('id', id);
    canvas.setAttribute('style', 'position:absolute; top:0; left:0');
    if (hidden) canvas.setAttribute('style', 'display:none');
    output?.children.add(canvas);
    return canvas;
  }
}
