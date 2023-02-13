import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_compass/flutter_compass.dart';

class MyCompass {
  static final MyCompass _instance = MyCompass._internal();
  factory MyCompass(){
    return _instance;
  }

  MyCompass._internal();

  final Stream<CompassEvent>? compassStream = FlutterCompass.events;

  static final StreamController<MyCompassEvent> _controller = StreamController();
  static Stream<MyCompassEvent> get myCompassStream => _controller.stream;

  void init(){
    compassStream?.listen((CompassEvent event) {
      MyCompassEvent myEvent = MyCompassEvent(event.heading, event.headingForCameraMode, event.accuracy);
      _controller.sink.add(myEvent);
    });
  }

  void dispose(){
    _controller.close();
  }
}

class MyCompassEvent {
  // The heading, in degrees, of the device around its Z
  // axis, or where the top of the device is pointing.
  final double? heading;

  // The heading, in degrees, of the device around its X axis, or
  // where the back of the device is pointing.
  final double? headingForCameraMode;

  // The deviation error, in degrees, plus or minus from the heading.
  // NOTE: for iOS this is computed by the platform and is reliable. For
  // Android several values are hard-coded, and the true error could be more
  // or less than the value here.
  final double? accuracy;

  MyCompassEvent(this.heading, this.headingForCameraMode, this.accuracy);
}

