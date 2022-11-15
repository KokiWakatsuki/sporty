import 'package:camera/camera.dart';
// ignore: unused_import
import 'screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:sporty/view/top.dart';
import 'package:sporty/view/menu.dart';
import 'package:sporty/view/test.dart';
import 'package:sporty/view/slow.dart';
import 'package:sporty/view/delay.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  
  runApp(App(camera: firstCamera));
}

class App extends StatelessWidget {
  const App({
    Key? key, 
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/top',
      routes: {
        '/top': (context) => const Top(),
        '/menu': (context) => const Menu(),
        '/test': (context) => Test(camera: camera),
        '/slow': (context) => const Slow(),
        '/delay': (context) => Delay(camera: camera),
      },
    );
  }
}