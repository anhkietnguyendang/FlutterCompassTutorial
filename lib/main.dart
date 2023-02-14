import 'package:flutter/material.dart';
import 'package:my_compass/providers/permission_provider.dart';
import 'package:my_compass/views/main_view.dart';
import 'package:provider/provider.dart';
import 'view_models/my_compass_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppPermissionProvider()),
    ChangeNotifierProvider(create: (_) => MyCompassProvider()),
  ], child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compass tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}

