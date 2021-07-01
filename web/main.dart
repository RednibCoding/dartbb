import 'dartbb/dartbb.dart';
import 'dartbb/font.dart';

void main() async {
  // Innitialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);

  // Loading stuff
  image = await LoadImage('media/darticon.png');
  font = LoadFont('media/mandatoryplaything.ttf');

  SetUiCanvasFocused(true);
  SetFont(font);
  SetUiCanvasFocused(false);

  // Begin the render loop and therefore the given "mainLoop" (this must be called after all resources have been loaded)
  Begin();
}

late Image image;
late Font font;

void mainLoop() {
  Cls();
  SetUiCanvasFocused(true);
  DrawText(FpsString(), 10, 20);
  SetUiCanvasFocused(false);
  DrawImage(image, 50, 50);
}
