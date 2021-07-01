library dartbb.core;

import 'dart:html';
import '../color.dart';
import '../image.dart';
import '../time.dart';

part 'core_graphics.dart';
part 'core_image.dart';
part 'core_text.dart';
part 'core_misc.dart';

class Core {
  static late final Core dartbbCtx;
  static num UPDATE_INTERVAL = 10;
  num _lastTimeStamp = 0;
  final _time = Time();
  int _elapsedTime = 0;
  int _fps = 0;
  int _fpsCounter = 0;
  late CanvasElement _gameLayer;
  late CanvasElement _uiLayer;
  late Function _mainLoop;
  late Color _clsColor;
  late Color _color;
  // is used on draw operations to determine target canvas (game canvas / ui canvas)
  // ignore: prefer_final_fields
  bool _isUiCanvasFocused = false;

  Core({
    required int width,
    required int height,
    required Function mainLoop,
  }) {
    _mainLoop = mainLoop;
    _clsColor = Color(0, 0, 0);
    _color = Color(255, 255, 255);
    _gameLayer = _createCanvasElement('canvas', width, height);
    _uiLayer = _createCanvasElement('ui', width, height);
    _run();
  }

  CanvasElement _createCanvasElement(String id, int width, int height,
      [bool hidden = false]) {
    // #output is the default div produced by dart web
    var output = querySelector('#output');
    var canvas = CanvasElement(width: width, height: height);
    canvas.setAttribute('id', id);
    canvas.setAttribute('style', 'position:absolute; top:0; left:0');
    if (hidden) canvas.setAttribute('style', 'display:none');
    output?.children.add(canvas);
    return canvas;
  }

  void _run() async {
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
    _run();
  }

  void _preRender() {
    _gameLayer.context2D.save();
    _uiLayer.context2D.save();
  }

  void _postRender() {
    _gameLayer.context2D.restore();
    _uiLayer.context2D.restore();
  }
}
