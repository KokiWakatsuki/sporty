// ignore_for_file: use_build_context_synchronously, avoid_print, unused_field, unused_import, implementation_imports, unused_local_variable, must_be_immutable, unnecessary_string_interpolations, override_on_non_overriding_member, await_only_futures

import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:sporty/view/delay_menu.dart';
import 'package:sporty/main.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

List<CameraDescription> cameras = [];

class VideoRecorderScreen extends StatefulWidget {
  CameraDescription camera;

  VideoRecorderScreen({
    super.key,
    required this.camera,
  });

  @override
  State<VideoRecorderScreen> createState() => _VideoRecorderScreenState();
}

class CacheClass {
  // Singleton Patternを実現
  static final CacheClass _instance = CacheClass._internal();
  CacheClass._internal();
  factory CacheClass() => _instance;

  // キャッシュで保持するデータ
  late XFile data;
}

class _VideoRecorderScreenState extends State<VideoRecorderScreen> {
  late CameraController _cameraController;
  late VideoPlayerController _videoController;
  late Future<void> _initializeCameraControllerFuture;
  late Future<void> _initializeVideoControllerFuture;
  bool _isRecording = false;
  bool _isVideoPlay = false;
  XFile? video;

  @override
  void initState() {
    super.initState();
    
    Future(() async {
      final cameras = await availableCameras();
      final firstCamera = cameras.firstWhere((camera) {
        if(camera_lens_flag == 1){
          return camera.lensDirection == CameraLensDirection.back;
        }else{
          return camera.lensDirection == CameraLensDirection.front;
        }
      });
      switch(resolution_preset){
        case 0:
          _cameraController = CameraController(firstCamera, ResolutionPreset.low,);
          debugPrint("0");
          break;
        case 1:
          _cameraController = CameraController(firstCamera, ResolutionPreset.medium,);
          debugPrint("1");
          break;
        case 2:
          _cameraController = CameraController(firstCamera, ResolutionPreset.high,);
          debugPrint("2");
          break;
        case 3:
          _cameraController = CameraController(firstCamera, ResolutionPreset.veryHigh,);
          debugPrint("3");
          break;
        case 4:
          _cameraController = CameraController(firstCamera, ResolutionPreset.ultraHigh,);
          debugPrint("4");
          break;
        case 5:
          _cameraController = CameraController(firstCamera, ResolutionPreset.max,);
          debugPrint("5");
          break;
      }
      _initializeCameraControllerFuture = _cameraController.initialize();
      videorecord();
    });
  }

  void videorecord() async {
    await _initializeCameraControllerFuture;

    await _cameraController.prepareForVideoRecording();
    await _cameraController.startVideoRecording();
    _isRecording = true;
    await Future.delayed(Duration(seconds: delay_sec));
    video = await _cameraController.stopVideoRecording();
    _isRecording = false;
    _isVideoPlay = true;
    setState(() {
      videoplay(video!.path);
    });
    return videorecord();
  }

  void videoplay(final String videoPath) async {
    _videoController = await VideoPlayerController.file(File(videoPath));
    debugPrint("$videoPath");
    _initializeVideoControllerFuture = _videoController.initialize();
    await _videoController.play();
  }

  @override
  void disposeCamera() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void disposeVideo() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isVideoPlay == true
          ? VideoPlayer(_videoController)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

//--------------------------------------------------------------------------------

/*
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
          //future: _initializeCameraControllerFuture,
          builder: (context, snapshot) {
            if (_isVideoPlay == true) {
              return VideoPlayer(_videoController);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
*/

//--------------------------------------------------------------------------------

/*
class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.videoPath));
    _initializeControllerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video player screen')),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
*/
