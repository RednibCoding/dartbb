library dartbb.color;

class Color {
  late int r;
  late int g;
  late int b;
  late double a;

  Color(int r, int g, int b, [double a = 1.0]) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
}
