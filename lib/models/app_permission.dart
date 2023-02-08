import 'package:permission_handler/permission_handler.dart';

class AppPermission{
  AppPermission();

  // Location permission
  Future<bool> get location => isLocationPermissionGranted();
  Future<bool> isLocationPermissionGranted () async{
    PermissionStatus status = await Permission.locationWhenInUse.status;
    return (status == PermissionStatus.granted);
  }

  // Request Location permission
  Future<bool> requestLocationPermission() async{
    PermissionStatus status = await Permission.locationWhenInUse.request();
    return (status == PermissionStatus.granted);
  }

  // Storage permission

  // Camera permission


}