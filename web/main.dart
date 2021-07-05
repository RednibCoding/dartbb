import 'dart:html';

import 'dartbb/dartbb.dart';
import 'dartbb/font.dart';
import 'dartbb/image.dart';
import 'dartbb/sound.dart';

void main() async {
  Graphics(640, 480, mainLoop);
  SetAutoResize(false);
  TFormFilter(true);
  SetAutoMidhandle(true);

  animImage1 = await LoadAnimImage('media/Orc_Grunts_20x20.png', 20, 20, 0, 28);
  ScaleImage(animImage1, 2.6, 2.6);
  animImage2 = CloneImage(animImage1);
  animImage3 = CloneImage(animImage1);

  image1 = await LoadImage('media/darticon.png');
  ScaleImage(image1, 2, 2);
  SetImageMidhandle(image1, true);

  image2 = CopyImage(image1);
  image3 = CopyImage(image1);
  image4 = CopyImage(image1);
  image5 = CopyImage(image1);
  image6 = CopyImage(image1);
  font = LoadFont('media/mandatoryplaything.ttf');

  music = await LoadSound('media/towninruins.ogg');
  hit = await LoadSound('media/hit.wav');

  SetFont(font, 12);

  RunGame();
}

late Image animImage1;
late Image animImage2;
late Image animImage3;
num animImageX1 = 20;
num animImageX2 = 80;
num animImageX3 = 120;
num animImageSpeed1 = 3;
num animImageSpeed2 = 2;
num animImageSpeed3 = 1;
late Image image1;
late Image image2;
late Image image3;
late Image image4;
late Image image5;
late Image image6;
late Font font;
late Sound music;
late Sound hit;

void mainLoop() {
  Cls();

  if (!IsSoundPlaying(music)) {
    PlaySound(music);
  }

  var mhLeft = MouseHit(0);

  DrawText('FPS: ${FpsString()}', 10, 20);
  DrawText('MS: ${MillisecsString()}', 10, 40);
  DrawText('Mouse Wheel: ${MouseZSpeed()}', 150, 40);
  DrawText(
      'Press space', GraphicsWidth() / 2 - TextWidth('Press space') / 2, 20);

  var anchorX = 120;
  var anchorY = 100;

  animImageX1 += animImageSpeed1;
  if (animImageX1 > GraphicsWidth() - 10 || animImageX1 < 10) {
    animImageSpeed1 /= -1;
    FlipImageX(animImage1);
  }
  animImageX2 += animImageSpeed2;
  if (animImageX2 > GraphicsWidth() - 10 || animImageX2 < 10) {
    animImageSpeed2 /= -1;
    FlipImageX(animImage2);
  }
  animImageX3 += animImageSpeed3;
  if (animImageX3 > GraphicsWidth() - 10 || animImageX3 < 10) {
    animImageSpeed3 /= -1;
    FlipImageX(animImage3);
  }
  TFormFilter(false);
  DrawAnimImage(animImage1, animImageX1, anchorY + 250, 5, 8, 8);
  DrawAnimImage(animImage2, animImageX2, anchorY + 250, 13, 16, 12);

  if (ImageRectsOverlap(animImage3, animImageX3, anchorY + 250, animImage1,
          animImageX1, anchorY + 250) ||
      ImageRectsOverlap(animImage3, animImageX3, anchorY + 250, animImage2,
          animImageX2, anchorY + 250)) {
    var text = "Arghh..";
    if (!IsSoundPlaying(hit)) {
      PlaySound(hit);
    }
    DrawText(text, animImageX3 - TextWidth(text) / 2, anchorY + 250 - 32);
    DrawImage(animImage3, animImageX3, anchorY + 245, 20);
  } else {
    DrawAnimImage(animImage3, animImageX3, anchorY + 250, 21, 24, 14);
  }
  TFormFilter(true);

  // Draw primitives
  var lineThickness = 3;
  DrawLine(anchorX, anchorY, anchorX + 20, anchorY + 20, lineThickness);
  DrawRect(anchorX + 100, anchorY, 20, 20);
  DrawRect(anchorX + 200, anchorY, 20, 20, false, lineThickness);
  DrawCircle(anchorX + 300, anchorY + 10, 10);
  DrawCircle(anchorX + 400, anchorY + 10, 10, false, lineThickness);

  // Auto animating is pretty easy right? :)
  AutoScaleImageX(image2, 0.04, 0, 1, true);
  DrawImage(image2, anchorX, anchorY + 100);

  AutoScaleImageX(image3, 0.05, 0.5, 1.5, true);
  AutoScaleImageY(image3, 0.05, 0.8, 1.8, true);
  DrawImage(image3, anchorX + 100, anchorY + 100);

  AutoScaleImageX(image4, 0.05, 0, 2, true);
  AutoScaleImageY(image4, 0.05, 0, 2, true);
  AutoRotateImage(image4, 2);
  DrawImage(image4, anchorX + 200, anchorY + 100);

  AutoScaleImageX(image5, 0.04, 0, 1, true);
  AutoRotateImage(image5, 1);
  DrawImage(image5, anchorX + 300, anchorY + 100);

  AutoRotateImage(image6, -2, 0, 90, true);
  AutoAlphaImage(image6, 0.05, 0, 1, true);
  DrawImage(image6, anchorX + 400, anchorY + 100);

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
        'Scaled Image size: ${ImageWidth(image1).toInt().toString()} | ${ImageHeight(image1).toInt().toString()}';
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
}
