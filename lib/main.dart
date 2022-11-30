import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'video_recorder_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.firstWhere((camera) {
    return camera.lensDirection == CameraLensDirection.front;
  });

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: VideoRecorderScreen(camera: firstCamera),
  ));
}