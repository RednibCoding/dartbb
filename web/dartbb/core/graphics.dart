library dartbb.graphics;

import 'dart:html';
import '../font.dart';
import '../image.dart';
import '../color.dart';
import 'core.dart';

class Graphics {
  late CanvasElement _canvas;
  late Color _clsColor;
  late Color _color;
  bool _autoMidhandle = false;

  Graphics(int width, int height) {
    _clsColor = Color(0, 0, 0);
    _color = Color(255, 255, 255);
    _canvas = _createCanvasElement('canvas', width, height);
    // tabIndex is needed in order for keyboard events to work.
    // Without a tabIndex, the canvas element cannot be focused
    // and an element witout focus cannot receive any events
    _canvas.tabIndex = 9999;
    _canvas.style.outline = 'none';
  }

  int get graphicsWidth => _canvas.width ?? 0;
  int get graphicsHeight => _canvas.height ?? 0;
  CanvasElement get canvas => _canvas;
  bool get autoMidhandle => _autoMidhandle;

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

  Future<Image> loadImage(String path) async {
    var image = ImageElement(src: path);
    return await image.onLoad.first.then((value) => Image(image));
  }

  void drawImage(Image img, num x, num y) {
    var dx = x - img.hndlX;
    var dy = y - img.hndlY;
    if (_autoMidhandle || img.midHandle) {
      dx -= img.element.width! / 2;
      dy -= img.element.height! / 2;
    }
    _canvas.context2D.save();
    _canvas.context2D.drawImage(img.element, dx, dy);
    _canvas.context2D.restore();
  }

  num imageWidth(Image image) {
    return image.element.width!;
  }

  num imageHeight(Image image) {
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
