import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sporty/view/top.dart';
import 'package:sporty/view/menu.dart';
import 'package:sporty/view/slow.dart';
import 'package:sporty/view/delay.dart';
// ignore_for_file: unused_import
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

//late List<CameraDescription> cameras;

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
        '/slow': (context) => const Slow(),
        '/delay': (context) => TakePictureScreen(camera: camera),
      },
    );
  }
}