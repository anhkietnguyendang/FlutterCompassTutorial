import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_compass/models/my_compass.dart';

class CompassViewModel with ChangeNotifier{
  MyCompass myCompass = MyCompass();

  ConnectionState _connectionState = ConnectionState.none;
  ConnectionState get state => _connectionState;

  double _compassHeading = 0.0;
  double get heading => _compassHeading;

  void updateState(ConnectionState newState){
    _connectionState = newState;
    notifyListeners();
  }

  void updateHeading(MyCompassEvent event){
    _compassHeading = event.heading!;
    notifyListeners();
  }

}