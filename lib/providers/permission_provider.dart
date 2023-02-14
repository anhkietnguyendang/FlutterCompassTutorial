import 'package:flutter/material.dart';
import '../models/app_permission.dart';

class AppPermissionProvider with ChangeNotifier{
  AppPermissionProvider(){
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

  Future<bool> openSettings() async{
    return await permission.openSettings();
  }


}