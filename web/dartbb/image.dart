library dartbb.image;

import 'dart:html';

class Image {
  late var _element = ImageElement();
  late double _scaleX;
  late double _scaleY;

  Image(ImageElement img) {
    _scaleX = 1.0;
    _scaleY = 1.0;
    _element = img;
  }

  double get scaleX => _scaleX;
  double get scaleY => _scaleY;
  ImageElement get element => _element;
}
