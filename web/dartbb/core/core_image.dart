part of 'core.dart';

extension CoreImage on Core {
  void drawImage(Image img, num x, num y) {
    if (_isUiCanvasFocused) {
      Core.dartbbCtx.uiLayer.context2D.drawImage(img.data, x, y);
    } else {
      Core.dartbbCtx.gameLayer.context2D.drawImage(img.data, x, y);
    }
  }

  Future<Image> loadImage(String path) async {
    var image = ImageElement(src: path);
    return await image.onLoad.first.then((value) => Image(image));
  }
}
