library dartbb.font;

import 'dart:html';

class Font {
  String _path = '';
  String _name = '';

  String get name => _name;
  String get path => _path;

  Font(String path, String name) {
    _path = path;
    _name = name;
    var css = document.createElement('style');
    css.setAttribute('type', 'text/css');
    css.innerHtml = "@font-face{ font-family: '$_name'; src: url($_path); }";
    document.body?.children.add(css);
  }
}
