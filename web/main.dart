import 'dart:html';

import 'dartbb/dartbb.dart';
import 'dartbb/font.dart';
import 'dartbb/image.dart';

void main() async {
  // Initialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);
  SetAutoMidhandle(true);
  // Loading stuff
  image1 = await LoadImage('media/darticon.png');
  ScaleImage(image1, 2, 2);
  SetImageMidhandle(image1, true);

  // A copy basically copies the image element but not the attributes like scale/rotation/position etc.
  // As you can see above, 'image1' has been scaled and the pivot point has been changed, but that does not
  // apply to the copies when they are copied with 'CopyImage'
  // This is usefull when you don't want to load the same image media multiple times (in this case 'media/darticon.png').
  // To make an exact copy with all attributes, use CloneImage(Image) instead.
  image2 = CopyImage(image1);
  image3 = CopyImage(image1);
  image4 = CopyImage(image1);
  image5 = CopyImage(image1);
  image6 = CopyImage(image1);
  font = LoadFont('media/mandatoryplaything.ttf');

  SetFont(font, 12);

  // Begin the render loop and therefore the given "mainLoop" (this must be called after all resources have been loaded)
  // This should be the last command as this results in an endless loop
  RunGame();
}

// Create some variables for the images and font
late Image image1;
late Image image2;
late Image image3;
late Image image4;
late Image image5;
late Image image6;
late Font font;

// The mainLoop that has been given to the Graphics command
void mainLoop() {
  // Clear the screen
  Cls();

  var mhLeft = MouseHit(0);

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
    var text1 =
        'Scaled Image size: ${ImageWidth(image1).toString()} | ${ImageHeight(image1).toString()}';
    var text2 =
        'Natural Image size: ${NaturalImageWidth(image1).toString()} | ${NaturalImageHeight(image1).toString()}';

    DrawText(text1, GraphicsWidth() / 2 - TextWidth(text1) / 2,
        GraphicsHeight() / 2 - TextHeight(text1) / 2 - 5);
    DrawText(text2, GraphicsWidth() / 2 - TextWidth(text2) / 2,
        GraphicsHeight() / 2 + TextHeight(text2) / 2 + 5);
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

  var anchorX = 120;
  var anchorY = 100;

  // Auto animating is pretty easy right? :)

  AutoScaleImageX(image2, 0.04, 0, 1, true);
  DrawImage(image2, anchorX, anchorY);

  AutoScaleImageX(image3, 0.05, 0.5, 1.5, true);
  AutoScaleImageY(image3, 0.05, 0.8, 1.8, true);
  DrawImage(image3, anchorX + 100, anchorY);

  AutoScaleImageX(image4, 0.05, 0, 2, true);
  AutoScaleImageY(image4, 0.05, 0, 2, true);
  AutoRotateImage(image4, 2);
  DrawImage(image4, anchorX + 200, anchorY);

  AutoScaleImageX(image5, 0.04, 0, 1, true);
  AutoRotateImage(image5, 1);
  DrawImage(image5, anchorX + 300, anchorY);

  AutoRotateImage(image6, 2, 90, 360, true);
  DrawImage(image6, anchorX + 400, anchorY);

  AutoHandleImageX(image1, 1, -50, 50, true);
  AutoHandleImageY(image1, 2, -50, 50, true);
  AutoRotateImage(image1, 2);
  DrawImage(image1, GraphicsWidth() / 2,
      GraphicsHeight() / 2 + ImageHeight(image1) / 2);
}
