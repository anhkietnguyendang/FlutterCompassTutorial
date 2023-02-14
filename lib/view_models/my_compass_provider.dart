import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_compass/flutter_compass.dart';

class MyCompassProvider with ChangeNotifier{
  MyCompassProvider(){
    init();
  }

  double heading = 0.0;
  final Stream<CompassEvent>? compassStream = FlutterCompass.events;

  void init(){
    compassStream?.listen((CompassEvent event) {
      heading = event.heading?? 0;
      notifyListeners();
    });
  }
}


