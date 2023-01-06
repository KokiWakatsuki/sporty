// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sporty/view/top.dart';
import 'package:sporty/view/menu.dart';
import 'package:sporty/view/test.dart';
import 'package:sporty/view/take_picture.dart';
import 'package:sporty/view/slow.dart';
import 'package:sporty/view/p2p.dart';
import 'package:sporty/view/comparison.dart';
import 'package:sporty/view/delay_menu.dart';
import 'view_model/video_recorder_screen.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  final cameras = await availableCameras();

  //final firstCamera = cameras.first;

  //上のコード：chromeで動作するが，遅延再生使えない
  //下のコード：遅延再生使えるが，chromeで動作しない

  final firstCamera = cameras.firstWhere((camera) {
    if (camera_lens_flag == 1) {
      return camera.lensDirection == CameraLensDirection.back;
    } else {
      return camera.lensDirection == CameraLensDirection.front;
    }
  });

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu', // '/top',
      routes: {
        '/top': (context) => const Top(),
        '/menu': (context) => const Menu(),
        '/delay_menu': (context) => const DelayMenu(),
        '/test': (context) => const Test(),
        '/delay': (context) => VideoRecorderScreen(camera: camera),
        '/slow': (context) => Slow(camera: camera),
        '/take_picture': (context) => TakePicture(camera: camera),
        '/p2p': (context) => const P2P(),
        '/comparison': (context) => Comparison(camera: camera), 
      },
    );
  }
}
