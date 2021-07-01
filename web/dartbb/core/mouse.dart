import 'dart:html';

import 'core.dart';

class Mouse {
  num x = 0;
  num y = 0;
  num xSpeed = 0;
  num ySpeed = 0;
  num zSpeed = 0;
  bool isHidden = false;
  List<bool> keys = [];
  late Core ctx;

  Mouse(Core ctx) {
    this.ctx = ctx;
    this.ctx.graphics.uiLayer.onMouseMove.listen(_saveMousePos);
    this.ctx.graphics.uiLayer.onMouseDown.listen(_saveMouseDown);
    this.ctx.graphics.uiLayer.onMouseUp.listen(_saveMouseUp);
    this.ctx.graphics.uiLayer.onTouchMove.listen(_saveTouchPos);
    this.ctx.graphics.uiLayer.onTouchStart.listen(_saveTouchDown);
    this.ctx.graphics.uiLayer.onTouchEnd.listen(_saveTouchUp);
    keys = List.filled(99, false);
  }

  void _saveMousePos(MouseEvent e) {
    var r = ctx.graphics.gameLayer.getBoundingClientRect();
    x = e.client.x - r.left;
    y = e.client.y - r.top;
  }

  void _saveMouseDown(MouseEvent e) {
    keys[e.button] = true;
  }

  void _saveMouseUp(MouseEvent e) {
    keys[e.button] = false;
  }

  void _saveTouchPos(TouchEvent e) {
    var r = ctx.graphics.gameLayer.getBoundingClientRect();
    var touches = e.changedTouches;
    if (touches != null && touches.isNotEmpty) {
      touches.forEach((t) {
        x = t.page.x - r.left;
        y = t.page.y - r.top;
      });
    }
  }

  void _saveTouchDown(TouchEvent e) {
    // todo
  }

  void _saveTouchUp(Event e) {
    // todo
  }

  void speedX() {
    // todo
  }

  void speedY() {
    // todo
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

  void hide() {
    isHidden = true;
    ctx.graphics.uiLayer.style.cursor = 'none';
  }

  void show() {
    isHidden = false;
    ctx.graphics.uiLayer.style.cursor = 'default';
  }
}
