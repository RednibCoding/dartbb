# dartbb
dartbb (dart**b**litz**b**asic) is a native Dart 2d web framework inspired by the BlitzBasic language.

_Currently this is a web-simple project to make testing easier. Later, when this framework becomes more mature, it will be released as a pub package_


## Demo Video

https://user-images.githubusercontent.com/28296119/124291748-2d153600-db55-11eb-8c4f-0a32313311cf.mov

## Example
Creating a graphics context and drawing an image is just too easy:
```dart
void main() async {
  // Initialize graphics context (this must be called before any other dartbb function)
  Graphics(640, 480, mainLoop);

  // Loading stuff
  image = await LoadImage('media/darticon.png');

  // Run the game
  RunGame();
}

// Create an image variable
late Image image;

// Create the main loop that has been given to the Graphics command
void mainLoop() {
  // Clear the screen
  Cls();
  // Draw the image at the exact center of the screen
  var middleX = GraphicsWidth() / 2 - ImageWidth(image) / 2;
  var middleY = GraphicsHeight() / 2 - ImageHeight(image) / 2;
  DrawImage(image, middleX, middleY);
}
```

![2021-07-02 16_59_24-dartbb](https://user-images.githubusercontent.com/28296119/124293502-07892c00-db57-11eb-9471-d2995fba06d4.png)

## Progress
- Create a canvas object for drawing **(Done)**
- Autoresizing of canvas when window size changes
- Loading images **(Done)**
- Drawing images **(Done)**
- Change pivot point of images **(Done)**
- Auto changing pivot points of images (animating) **(Done)**
- Draw text **(Done)**
- Load fonts **(Done)**
- Set fonts **(Done)**
- Mouse down/hit **(Done)**
- Keyboad key down/hit **(Done)**
- Mousewheel scolling
- Touchinput
- Rotating images **(Done)**
- Scaling images **(Done)**
- Auto scrolling/scaling of images (animating) **(Done)**
- Fps counter **(Done)**
- Spritesheet loading
- Spritesheed drawing
- Spritesheet autodrawing (animating)
- Load sounds
- Play sounds
- WebGL renderer
