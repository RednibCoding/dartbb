library dartbb.mouse;

import 'dart:html';

import 'core.dart';

class Mouse {
  late Core ctx;
  num x = 0;
  num y = 0;
  num xSpeed = 0;
  num ySpeed = 0;
  num zSpeed = 0;
  bool isHidden = false;
  List<bool> keys = [];

  Mouse(Core ctx) {
    this.ctx = ctx;
    this.ctx.graphics.canvas.onMouseMove.listen(_saveMousePos);
    this.ctx.graphics.canvas.onMouseDown.listen(_saveMouseDown);
    this.ctx.graphics.canvas.onMouseUp.listen(_saveMouseUp);
    this.ctx.graphics.canvas.onTouchMove.listen(_saveTouchPos);
    this.ctx.graphics.canvas.onTouchStart.listen(_saveTouchDown);
    this.ctx.graphics.canvas.onTouchEnd.listen(_saveTouchUp);
    keys = List.filled(128, false);
  }

  void _saveMousePos(MouseEvent e) {
    var r = ctx.graphics.canvas.getBoundingClientRect();
    xSpeed = x;
    ySpeed = y;
    x = e.client.x - r.left;
    y = e.client.y - r.top;
    xSpeed = x - xSpeed;
    ySpeed = y - ySpeed;
  }

  void _saveMouseDown(MouseEvent e) {
    keys[e.button] = true;
  }

  void _saveMouseUp(MouseEvent e) {
    keys[e.button] = false;
  }

  void _saveTouchPos(TouchEvent e) {
    var r = ctx.graphics.canvas.getBoundingClientRect();
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

  num speedX() {
    var speed = ctx.mouse.xSpeed;
    ctx.mouse.xSpeed = 0;
    return speed;
  }

  num speedY() {
    var speed = ctx.mouse.ySpeed;
    ctx.mouse.ySpeed = 0;
    return speed;
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
    ctx.graphics.canvas.style.cursor = 'none';
  }

  void show() {
    isHidden = false;
    ctx.graphics.canvas.style.cursor = 'default';
  }
}
