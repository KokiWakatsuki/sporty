// ignore_for_file: duplicate_import, unused_import, unnecessary_import, unused_element, unused_local_variable

import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sporty/view/test2.dart';
import 'package:video_player/video_player.dart';

// 写真撮影画面
class Test2 extends StatefulWidget {
  const Test2({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Test2State createState() => Test2State();
}


class Test2State extends State<Test2> {
  late CameraController _controller;
  VideoPlayerController? _videoController;
  File? _videoFile;
  late Future<void> _initializeControllerFuture;

//----------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    debugPrint('4');

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.max,
    );

    if(_videoFile != null){
      _videoController = VideoPlayerController.file(_videoFile!);
      _videoController!.initialize();
    }

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
    debugPrint('aaaaa');
  }

//----------------------------------------------------------------------

  //動画撮影開始
  Future<void> startVideoRecording() async {
      await _controller.startVideoRecording();
  }

  //動画撮影終了
  Future<XFile?> stopVideoRecording() async {
    XFile file = await _controller.stopVideoRecording();
    return file;
  }

  //動画再生
  Future<void> _startVideoPlayer() async {
  if (_videoFile != null) {
    _videoController = VideoPlayerController.file(_videoFile!);
    await _videoController!.initialize().then((_) {
      setState(() {});
    });
    await _videoController!.setLooping(true);
    await _videoController!.play();
  }
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
      body: Center(
        child: _videoController == null
          ? FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
          : VideoPlayer(_videoController!)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 写真を撮る
          await startVideoRecording();
          XFile? rawVideo =
                await stopVideoRecording();
            File videoFile =
                File(rawVideo!.path);
          _startVideoPlayer();
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}