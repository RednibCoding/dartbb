import 'dart:html';

import 'dartbb/dartbb.dart';
import 'dartbb/font.dart';
import 'dartbb/image.dart';

void main() async {
  // Initialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);
  SetAutoMidhandle(true);
  // Loading stuff
  image = await LoadImage('media/darticon.png');
  ScaleImage(image, 1.5, 1.5);
  font = LoadFont('media/mandatoryplaything.ttf');

  SetFont(font);

  // Begin the render loop and therefore the given "mainLoop" (this must be called after all resources have been loaded)
  RunGame();
}

late Image image;
late Font font;
num rot = 2;

void mainLoop() {
  Cls();

  var mhLeft = MouseHit(0);

  // UiBegin/UiEnd can be called at any point as long as it is called after the Graphics command
  DrawText('FPS: ${FpsString()}', 10, 20);
  DrawText('MS: ${MillisecsString()}', 10, 40);
  DrawText('Press space :)', 100, 20);

  if (mhLeft) {
    if (IsMouseHidden()) {
      ShowMouse();
    } else {
      HideMouse();
    }
  }

  // See https://keycode.info for keycodes
  if (KeyDown(KeyCode.SPACE)) {
    var text =
        'Image size: ${ImageWidth(image).toString()} | ${ImageHeight(image).toString()}';
    DrawText(text, GraphicsWidth() / 2 - TextWidth(text) / 2,
        GraphicsHeight() / 2 - TextHeight(text) / 2);
  }

  if (IsMouseHidden()) {
    DrawText(
        'mxs: ${MouseXSpeed().toString()} | mys: ${MouseYSpeed().toString()}',
        MouseX() - 50,
        MouseY() + 80);
  } else {
    DrawText('mx: ${MouseX().toString()} | my: ${MouseY().toString()}',
        MouseX() - 50, MouseY() + 80);
  }

  // Reverse rotation on mouse click
  if (mhLeft) {
    rot /= -1;
  }

  AddImageRotation(image, rot);
  DrawText('Rotation: ${ImageRotation(image)}', MouseX() - 50, MouseY() + 100);
  DrawImage(image, MouseX(), MouseY());
}
