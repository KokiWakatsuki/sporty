// ignore_for_file: duplicate_import, unused_import, unnecessary_import, unused_element, unused_local_variable, unused_field, no_logic_in_create_state

import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sporty/view/test2.dart';
import 'package:video_player/video_player.dart';

import 'package:sporty/view_model/video_recorder_screen.dart';

// 写真撮影画面
class Test2 extends StatefulWidget {
  final CameraDescription camera;
  const Test2({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  Test2State createState() => Test2State(cameras: camera);
}

class Test2State extends State<Test2> {
  final CameraDescription cameras;
  Test2State({
    Key? key,
    required this.cameras,
  });

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

//----------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.max,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

//----------------------------------------------------------------------

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

//----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: VideoRecorderScreen(camera: cameras)),
    );
  }
}
