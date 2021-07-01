part of 'core.dart';

extension CoreGraphics on Core {
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
}
