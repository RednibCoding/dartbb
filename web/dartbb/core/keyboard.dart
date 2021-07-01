library dartbb.keyboard;

import 'dart:html';

import 'core.dart';

class Keyboard {
  late Core ctx;
  List<bool> keys = [];

  Keyboard(Core ctx) {
    this.ctx = ctx;
    this.ctx.graphics.uiLayer.onKeyDown.listen(_saveKeyDown);
    this.ctx.graphics.uiLayer.onKeyUp.listen(_saveKeyUp);
    keys = List.filled(255, false);
  }

  void _saveKeyDown(KeyboardEvent e) {
    keys[e.keyCode] = true;
  }

  void _saveKeyUp(KeyboardEvent e) {
    keys[e.keyCode] = false;
  }

  bool down(int key) {
    return keys[key];
  }

  bool hit(int key) {
    var result = keys[key];
    keys[key] = false;
    return result;
  }

  void flush() {
    keys.forEach((k) {
      k = false;
    });
  }
}
