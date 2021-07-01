import 'dartbb/dartbb.dart';

void main() async {
  image = await LoadImage('media/darticon.png');
  Graphics(640, 480, mainLoop);
}

late Image image;

void mainLoop() {
  Cls();
  DrawText(FpsString(), 10, 20);
  DrawImage(image, 50, 50);
}
