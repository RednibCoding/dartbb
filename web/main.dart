import 'dartbb/dartbb.dart';

void main() async {
  // Innitialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);

  // Loading stuff
  image = await LoadImage('media/darticon.png');

  // Begin the render loop and therefore the given "mainLoop" (this must be called after all resources have been loaded)
  Begin();
}

late Image image;

void mainLoop() {
  Cls();
  DrawText(FpsString(), 10, 20);
  DrawImage(image, 50, 50);
}
