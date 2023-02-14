import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:my_compass/view_models/my_compass_provider.dart';
import 'package:provider/provider.dart';

class CompassView extends StatelessWidget {
  const CompassView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyCompassProvider>(
        builder: (BuildContext context, MyCompassProvider myCompass, Widget? child) {
      return Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Transform.rotate(
            angle: (myCompass.heading * (math.pi / 180) * -1),
            child: Image.asset('assets/compass.jpg'),
          ),
        ),
      );
    });
  }
}
