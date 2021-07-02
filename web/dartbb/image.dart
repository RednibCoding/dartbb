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
  late bool _autoScaleXDirectionReversed;
  late bool _autoScaleYDirectionReversed;
  late bool _autoHandleXDirectionReversed;
  late bool _autoHandleYDirectionReversed;
  late bool _autoRotateDirectionReversed;

  Image(ImageElement img) {
    _scaleX = 1.0;
    _scaleY = 1.0;
    _hndlX = 0;
    _hndlY = 0;
    _rotation = 0;
    _midHandle = false;
    _element = img;
    _autoScaleXDirectionReversed = false;
    _autoScaleYDirectionReversed = false;
    _autoHandleXDirectionReversed = false;
    _autoHandleYDirectionReversed = false;
    _autoRotateDirectionReversed = false;
  }

  num get scaleX => _scaleX;
  num get scaleY => _scaleY;
  num get hndlX => _hndlX;
  num get hndlY => _hndlY;
  num get rotation => _rotation;
  bool get midHandle => _midHandle;
  ImageElement get element => _element;

  Image copy() {
    var copy = Image(_element);
    return copy;
  }

  Image clone() {
    var clone = Image(_element);
    clone.setScale(_scaleX, _scaleY);
    clone.setHandle(_hndlX, hndlY);
    clone.setRotation(_rotation);
    clone.setMidHandle(_midHandle);
    return clone;
  }

  void setMidHandle(bool val) {
    _midHandle = val;
  }

  void setHandle(num x, num y) {
    _hndlX = x;
    _hndlY = y;
  }

  void autoHandleX(num step, num min, num max, bool bounce) {
    var s = step.abs();
    if (bounce) {
      if (_hndlX > max) {
        _autoHandleXDirectionReversed = true;
      }
      if (_hndlX < min) {
        _autoHandleXDirectionReversed = false;
      }
      if (_autoHandleXDirectionReversed) {
        s /= -1;
      }
      _hndlX += s;
    } else {
      if (_hndlX > max) {
        _hndlX = min;
      } else if (_hndlX < min) {
        _hndlX = max;
      } else {
        _hndlX += s;
      }
    }
  }

  void autoHandleY(num step, num min, num max, bool bounce) {
    var s = step.abs();
    if (bounce) {
      if (_hndlY > max) {
        _autoHandleYDirectionReversed = true;
      }
      if (_hndlY < min) {
        _autoHandleYDirectionReversed = false;
      }
      if (_autoHandleYDirectionReversed) {
        s /= -1;
      }
      _hndlY += s;
    } else {
      if (_hndlY > max) {
        _hndlY = min;
      } else if (_hndlY < min) {
        _hndlY = max;
      } else {
        _hndlY += s;
      }
    }
  }

  void setRotation(num angle) {
    _rotation = angle;
    // if (_rotation >= 360) {
    //   _rotation = _rotation - 360;
    // } else if (_rotation < 0) {
    //   _rotation = 360 + _rotation;
    // }
  }

  void autoRotate(num angle, num minAngle, num maxAngle, bool bounce) {
    var ang = angle;
    if (bounce) {
      ang = ang.abs();
      if (_rotation > maxAngle) {
        _autoRotateDirectionReversed = true;
      } else if (_rotation < minAngle) {
        _autoRotateDirectionReversed = false;
      }
    } else {
      if (_rotation > maxAngle) {
        setRotation(minAngle);
      } else if (_rotation < minAngle) {
        setRotation(maxAngle);
      }
    }

    if (_autoRotateDirectionReversed) {
      ang /= -1;
      var tmp = minAngle;
      minAngle = maxAngle;
      maxAngle = tmp;
    } else {}

    setRotation(_rotation + ang);
  }

  void setScale(num x, num y) {
    _scaleX = x;
    _scaleY = y;
  }

  void autoScaleX(num step, num min, num max, bool bounce) {
    var s = step.abs();
    if (bounce) {
      if (_scaleX > max) {
        _autoScaleXDirectionReversed = true;
      }
      if (_scaleX < min) {
        _autoScaleXDirectionReversed = false;
      }
      if (_autoScaleXDirectionReversed) {
        s /= -1;
      }
      _scaleX += s;
    } else {
      if (_scaleX > max) {
        _scaleX = min;
      } else if (_scaleX < min) {
        _scaleX = max;
      } else {
        _scaleX += s;
      }
    }
  }

  void autoScaleY(num step, num min, num max, bool bounce) {
    var s = step.abs();
    if (bounce) {
      if (_scaleY > max) {
        _autoScaleYDirectionReversed = true;
      }
      if (_scaleY < min) {
        _autoScaleYDirectionReversed = false;
      }
      if (_autoScaleYDirectionReversed) {
        s /= -1;
      }
      _scaleY += s;
    } else {
      if (_scaleY > max) {
        _scaleY = min;
      } else if (_scaleY < min) {
        _scaleY = max;
      } else {
        _scaleY += s;
      }
    }
  }
  // void autoScale(num stepX, num minX, num maxX, num stepY, num minY, num maxY,
  //     bool bounce) {
  //   var sx = stepX.abs();
  //   var sy = stepY.abs();

  //   if (bounce) {
  //     if (_scaleX > maxX) {
  //       _autoScaleXDirectionReversed = true;
  //     }
  //     if (_scaleY > maxY) {
  //       _autoScaleYDirectionReversed = true;
  //     }
  //     if (_scaleX < minX) {
  //       _autoScaleXDirectionReversed = false;
  //     }
  //     if (_scaleY < minY) {
  //       _autoScaleYDirectionReversed = false;
  //     }
  //     if (_autoScaleXDirectionReversed) {
  //       sx /= -1;
  //     }
  //     if (_autoScaleYDirectionReversed) {
  //       sy /= -1;
  //     }
  //     _scaleX += sx;
  //     _scaleY += sy;
  //   } else {
  //     if (_scaleX > maxX) {
  //       _scaleX = minX;
  //     } else if (_scaleX < minX) {
  //       _scaleX = maxX;
  //     }
  //     if (_scaleY > maxY) {
  //       _scaleY = minY;
  //     } else if (_scaleY < minY) {
  //       _scaleY = maxY;
  //     } else {
  //       _scaleX += sx;
  //       _scaleY += sy;
  //     }
  //   }
  // }
}
