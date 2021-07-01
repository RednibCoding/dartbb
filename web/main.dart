import 'dartbb/dartbb.dart';
import 'dartbb/font.dart';

void main() async {
  // Innitialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);

  // Loading stuff
  image = await LoadImage('media/darticon.png');
  font = LoadFont('media/mandatoryplaything.ttf');

  // UiBegin tells dartbb to target the ui canvas
  // All commands between UiBegin and UiEnd will target the ui canvas
  UiBegin();
  SetFont(font);
  UiEnd();

  // Begin the render loop and therefore the given "mainLoop" (this must be called after all resources have been loaded)
  RunGame();
}

late Image image;
late Font font;

void mainLoop() {
  Cls();

  // UiBegin/UiEnd can be called at any point as long as it is called after the Graphics command
  UiBegin();
  DrawText(FpsString(), 10, 20);
  UiEnd();

  DrawImage(image, 50, 50);
}
