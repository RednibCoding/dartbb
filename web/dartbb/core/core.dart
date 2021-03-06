library dartbb.core;

import 'dart:html';
import '../time.dart';
import 'audio.dart';
import 'graphics.dart';
import 'keyboard.dart';
import 'mouse.dart';

class Core {
  static late final Core dartbbCtx;
  static num UPDATE_INTERVAL = 10;
  num _lastTimeStamp = 0;
  final _time = Time();
  int _elapsedTime = 0;
  int _fps = 0;
  int _fpsCounter = 0;
  bool _isFirstCycle = true;
  late Function _mainLoop;
  late Graphics graphics;
  late Mouse mouse;
  late Keyboard keyboard;
  late Audio audio;

  int get fps => _fps;
  int get millisecs => _time.milliSecs();
  int get deltaTime => _elapsedTime;
  bool get isFirstCycle => _isFirstCycle;

  Core({
    required int width,
    required int height,
    required Function mainLoop,
  }) {
    _mainLoop = mainLoop;
    graphics = Graphics(width, height);
    mouse = Mouse(this);
    keyboard = Keyboard(this);
    audio = Audio();
  }

  void run() async {
    _isFirstCycle = false;
    if (graphics.autoResize) {
      if (graphics.canvas.width != window.innerWidth) {
        graphics.canvas.width = window.innerWidth;
      }
      if (graphics.canvas.height != window.innerHeight) {
        graphics.canvas.height = window.innerHeight;
      }
    }
    _render(await window.animationFrame);
    _fpsCounter++;
    var ms = _time.milliSecs();
    if (ms - _elapsedTime > 1000) {
      _fps = _fpsCounter;
      _fpsCounter = 0;
      _elapsedTime = ms;
    }
  }

  void _render(num delta) {
    final diff = delta - _lastTimeStamp;
    if (diff > UPDATE_INTERVAL) {
      _lastTimeStamp = delta;
      _preRender();
      _mainLoop();
      _postRender();
    }
    run();
  }

  void _preRender() {
    graphics.canvas.context2D.save();
  }

  void _postRender() {
    graphics.canvas.context2D.restore();
  }
}
