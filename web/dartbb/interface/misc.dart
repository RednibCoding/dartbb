part of '../interface.dart';

int Fps() {
  return Core.dartbbCtx.fps;
}

String FpsString() {
  return Core.dartbbCtx.fps.toString();
}

int Millisecs() {
  return Core.dartbbCtx.millisecs;
}

String MillisecsString() {
  return Core.dartbbCtx.millisecs.toString();
}
