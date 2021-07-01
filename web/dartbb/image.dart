library dartbb.image;

import 'dart:html';

class Image {
  late var _data = ImageElement();
  late double _scaleX;
  late double _scaleY;

  Image(ImageElement img) {
    _scaleX = 1.0;
    _scaleY = 1.0;
    _data = img;
  }

  double get scaleX => _scaleX;
  double get scaleY => _scaleY;
  ImageElement get data => _data;
}
