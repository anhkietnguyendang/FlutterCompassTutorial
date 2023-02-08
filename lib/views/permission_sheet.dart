import 'package:flutter/material.dart';
import 'package:my_compass/providers/permission_provider.dart';

class PermissionSheet extends StatelessWidget {
  const PermissionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Location Permission Required'),
          ElevatedButton(
            onPressed: requestPermission,
            child: const Text('Request Permissions'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: openAppSettings,
            child: const Text('Open App Settings'),
          )
        ],
      ),
    );
  }

  void requestPermission(){
    var permissions = AppPermissionProvider();
    permissions.requestLocationPermission();
  }

  void openAppSettings(){
    openAppSettings();
  }
}
