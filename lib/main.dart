/*
import 'package:camera/camera.dart';5
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
*/

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/camera_screen.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    throw ('Error in fetching the cameras: $e');
  }
  runApp(MyApp());
}

/*test*/

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoVision Visioner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}