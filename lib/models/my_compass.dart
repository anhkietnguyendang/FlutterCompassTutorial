import 'dart:async';
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
  final double? heading;
  final double? headingForCameraMode;
  final double? accuracy;
  MyCompassEvent(this.heading, this.headingForCameraMode, this.accuracy);
}

