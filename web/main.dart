import 'dart:html';

import 'dartbb/dartbb.dart';
import 'dartbb/font.dart';
import 'dartbb/image.dart';

void main() async {
  // Initialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);

  // Loading stuff
  image = await LoadImage('media/darticon.png');
  font = LoadFont('media/mandatoryplaything.ttf');

  SetFont(font);

  // Begin the render loop and therefore the given "mainLoop" (this must be called after all resources have been loaded)
  RunGame();
}

late Image image;
late Font font;

void mainLoop() {
  Cls();

  // UiBegin/UiEnd can be called at any point as long as it is called after the Graphics command
  DrawText('FPS: ${FpsString()}', 10, 20);
  DrawText('MS: ${MillisecsString()}', 100, 100);
  DrawText('Press space :)', 100, 20);

  DrawText('FPS: ${FpsString()}', 20, 40);
  DrawText('MS: ${MillisecsString()}', 110, 120);

  if (MouseHit(0)) {
    if (IsMouseHidden()) {
      ShowMouse();
    } else {
      HideMouse();
    }
  }

  // See https://keycode.info for keycodes
  if (KeyDown(KeyCode.SPACE)) {
    var text = 'SPACE PRESSED';
    DrawText(text, GraphicsWidth() / 2 - TextWidth(text) / 2,
        GraphicsHeight() / 2 - TextHeight(text) / 2);
    DrawText(
        'Image size: ${ImageWidth(image).toString()} | ${ImageHeight(image).toString()}',
        MouseX(),
        MouseY() + 100);
  }

  if (IsMouseHidden()) {
    DrawText(
        'mxs: ${MouseXSpeed().toString()} | mys: ${MouseYSpeed().toString()}',
        MouseX() + 50,
        MouseY() + 80);
  } else {
    DrawText('mx: ${MouseX().toString()} | my: ${MouseY().toString()}',
        MouseX() - 50, MouseY() - 20);
  }
  DrawImage(image, MouseX(), MouseY());
}
