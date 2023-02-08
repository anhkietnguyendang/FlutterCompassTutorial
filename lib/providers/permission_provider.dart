import 'package:flutter/material.dart';
import '../models/app_permission.dart';

class AppPermissionProvider with ChangeNotifier{
  static final AppPermissionProvider _instance = AppPermissionProvider._internal();
  factory AppPermissionProvider(){
    return _instance;
  }

  AppPermissionProvider._internal(){
    init();
  }

  void init(){
    checkLocationPermission();
  }

  AppPermission permission = AppPermission();

  // Location permission
  bool _location = false;
  bool get location => _location;

  Future<void> checkLocationPermission() async{
    _location = await permission.location;
    notifyListeners();
  }

  void requestLocationPermission() async{
    _location = await permission.requestLocationPermission();
    notifyListeners();
  }


}