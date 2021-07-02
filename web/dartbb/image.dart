library dartbb.image;

import 'dart:html';

class Image {
  late var _element = ImageElement();
  late num _scaleX;
  late num _scaleY;
  late num _rotation;
  late num _hndlX;
  late num _hndlY;
  late bool _midHandle;

  Image(ImageElement img) {
    _scaleX = 1.0;
    _scaleY = 1.0;
    _hndlX = 0;
    _hndlY = 0;
    _rotation = 0;
    _midHandle = false;
    _element = img;
  }

  num get scaleX => _scaleX;
  num get scaleY => _scaleY;
  num get hndlX => _hndlX;
  num get hndlY => _hndlY;
  num get rotation => _rotation;
  bool get midHandle => _midHandle;
  ImageElement get element => _element;

  void setMidHandle(bool val) {
    _midHandle = val;
  }

  void setHandle(num x, num y) {
    _hndlX = x;
    _hndlY = y;
  }

  void setRotation(num rot) {
    _rotation = rot;
    if (_rotation >= 360) {
      _rotation = _rotation - 360;
    } else if (_rotation < 0) {
      _rotation = 360 + _rotation;
    }
  }

  void setScale(num x, num y) {
    _scaleX = x;
    _scaleY = y;
  }
}
