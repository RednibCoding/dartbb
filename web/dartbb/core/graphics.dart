library dartbb.graphics;

import 'dart:html';
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
        .fillRect(0, 0, _uiLayer.width as num, _uiLayer.height as num);
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

  Future<Image> loadImage(String path) async {
    var image = ImageElement(src: path);
    return await image.onLoad.first.then((value) => Image(image));
  }

  void drawImage(Image img, num x, num y) {
    if (_isUiCanvasFocused) {
      _uiLayer.context2D.drawImage(img.data, x, y);
    } else {
      _gameLayer.context2D.drawImage(img.data, x, y);
    }
  }

  void drawText(String text, num x, num y) {
    if (_isUiCanvasFocused) {
      //Core.dartbbCtx.uiLayer.context2D.font = "Arial";
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
    // #output is the default div produced by dart web
    var output = querySelector('#output');
    var canvas = CanvasElement(width: width, height: height);
    canvas.setAttribute('id', id);
    canvas.setAttribute('style', 'position:absolute; top:0; left:0');
    if (hidden) canvas.setAttribute('style', 'display:none');
    output?.children.add(canvas);
    return canvas;
  }
}
