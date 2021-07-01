part of 'core.dart';

extension CoreText on Core {
  void drawText(String text, num x, num y) {
    if (_isUiCanvasFocused) {
      //Core.dartbbCtx.uiLayer.context2D.font = "Arial";
      Core.dartbbCtx.uiLayer.context2D
          .setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
      Core.dartbbCtx.uiLayer.context2D.fillText(text, x, y);
    } else {
      Core.dartbbCtx.gameLayer.context2D
          .setFillColorRgb(_color.r, _color.g, _color.b, _color.a);
      Core.dartbbCtx.gameLayer.context2D.fillText(text, x, y);
    }
  }
}
