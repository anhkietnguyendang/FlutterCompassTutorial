import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_compass/providers/permission_provider.dart';
import 'package:my_compass/views/compass_view.dart';
import 'package:my_compass/views/permission_sheet.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var permissions = Provider.of<AppPermissionProvider>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Flutter Compass'),
        ),
        body: Builder(builder: (context) {
          if (permissions.location) {
            return const CompassView();
          } else {
            return const PermissionSheet();
          }
        }),
      ),
    );
  }
}