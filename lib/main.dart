// ignore_for_file: unused_import

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sporty/view/top.dart';
import 'package:sporty/view/menu.dart';
import 'package:sporty/view/test.dart';
import 'package:sporty/view/test2.dart';
import 'package:sporty/view/slow.dart';
import 'package:sporty/view/delay.dart';

import 'view_model/video_recorder_screen.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(App(camera: firstCamera));
}

class App extends StatelessWidget {
  final CameraDescription camera;
  const App({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/top',
      routes: {
        '/top': (context) => const Top(),
        '/menu': (context) => const Menu(),
        '/test': (context) => Test(camera: camera),
        '/test2': (context) => Test2(camera: camera),
        '/slow': (context) => const Slow(),
        '/delay': (context) => Delay(camera: camera),
      },
    );
  }
}
