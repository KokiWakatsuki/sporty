// ignore_for_file: unused_import

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sporty/view/top.dart';
import 'package:sporty/view/menu.dart';
import 'package:sporty/view/test.dart';
import 'package:sporty/view/slow.dart';
import 'package:sporty/view/delay.dart';

import 'screens/camera_view.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraView(camera: firstCamera),
    ));
  } on CameraException catch (e) {
    debugPrint('Initialize Error: ${e.description}');
  }
}