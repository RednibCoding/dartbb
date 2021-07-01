library dartbb.graphics;

import 'dart:html';
import '../font.dart';
import '../image.dart';
import '../color.dart';

class Graphics {
  late CanvasElement _gameLayer;
  late CanvasElement _uiLayer;
  late Color _clsColor;
  late Color _color;
  // is used on draw operations to determine target canvas (game canvas / ui canvas)
  // ignore: prefer_final_fields
  bool _isUiCanvasFocused = false;

  Graphics(int width, int height) {
    _clsColor = Color(0, 0, 0);
    _color = Color(255, 255, 255);
    _gameLayer = _createCanvasElement('canvas', width, height);
    _uiLayer = _createCanvasElement('ui', width, height);
  }

  int get graphicsWidth => _gameLayer.width ?? 0;
  int get graphicsHeight => _gameLayer.height ?? 0;
  CanvasElement get gameLayer => _gameLayer;
  CanvasElement get uiLayer => _uiLayer;

  void setUiCanvasFocused(bool focused) {
    _isUiCanvasFocused = focused;
  }

  void cls() {
    _gameLayer.context2D
        .setFillColorRgb(_clsColor.r, _clsColor.g, _clsColor.b, _clsColor.a);
    _gameLayer.context2D.setTransform(1, 0, 0, 1, 0, 0);
    _gameLayer.context2D
        .fillRect(0, 0, _gameLayer.width as num, _gameLayer.height as num);
    _uiLayer.context2D.setFillColorRgb(0, 0, 0, 0);
    _uiLayer.context2D.setTransform(1, 0, 0, 1, 0, 0);
    _uiLayer.context2D
        .clearRect(0, 0, _uiLayer.width as num, _uiLayer.height as num);
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
    if (_isUiCanvasFocused) {
      _uiLayer.context2D.font = fontData;
    } else {
      _gameLayer.context2D.font = fontData;
    }
  }

  Future<Image> loadImage(String path) async {
    var image = ImageElement(src: path);
    return await image.onLoad.first.then((value) => Image(image));
  }

  void drawImage(Image img, num x, num y) {
    if (_isUiCanvasFocused) {
      _uiLayer.context2D.drawImage(img.element, x, y);
    } else {
      _gameLayer.context2D.drawImage(img.element, x, y);
    }
  }

  void drawText(String text, num x, num y) {
    if (_isUiCanvasFocused) {
      _uiLayer.context2D
          .setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
      _uiLayer.context2D.fillText(text, x, y);
    } else {
      _gameLayer.context2D
          .setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
      _gameLayer.context2D.fillText(text, x, y);
    }
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
