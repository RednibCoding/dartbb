library dartbb.time;

class Time {
  int milliSecs() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
