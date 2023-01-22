// ignore_for_file: use_build_context_synchronously, avoid_print, unused_field, unused_import, implementation_imports, unused_local_variable, must_be_immutable, unnecessary_string_interpolations, override_on_non_overriding_member, await_only_futures, no_leading_underscores_for_local_identifiers, unnecessary_import, deprecated_member_use, non_constant_identifier_names

import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:sporty/view/delay_menu.dart';
import 'package:sporty/main.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:chewie/chewie.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

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
  late ChewieController _chewieController;
  late Future<void> _initializeCameraControllerFuture;
  bool _isVideoPlay = false;
  XFile? video;
  bool _disposeFlag = false;
  int delay_time = 0;

  @override
  void initState() {
    super.initState();

    delay_time = delay_min * 60 + delay_sec;

    Future(() async {
      final cameras = await availableCameras();
      final firstCamera = cameras.firstWhere((camera) {
        if (camera_lens_flag == 1) {
          return camera.lensDirection == CameraLensDirection.back;
        } else {
          return camera.lensDirection == CameraLensDirection.front;
        }
      });
      switch (resolution_preset) {
        case 0:
          _cameraController = CameraController(
            firstCamera,
            ResolutionPreset.low,
          );
          debugPrint("0");
          break;
        case 1:
          _cameraController = CameraController(
            firstCamera,
            ResolutionPreset.medium,
          );
          debugPrint("1");
          break;
        case 2:
          _cameraController = CameraController(
            firstCamera,
            ResolutionPreset.high,
          );
          debugPrint("2");
          break;
        case 3:
          _cameraController = CameraController(
            firstCamera,
            ResolutionPreset.veryHigh,
          );
          debugPrint("3");
          break;
        case 4:
          _cameraController = CameraController(
            firstCamera,
            ResolutionPreset.ultraHigh,
          );
          debugPrint("4");
          break;
        case 5:
          _cameraController = CameraController(
            firstCamera,
            ResolutionPreset.max,
          );
          debugPrint("5");
          break;
      }
      _initializeCameraControllerFuture = _cameraController.initialize();
      await _initializeCameraControllerFuture;
      await _cameraController.startVideoRecording();
      videorecord();
    });
  }

  void videorecord() async {
    //debugPrint("sss-----------------------------------------------------------------------------");
    await _initializeCameraControllerFuture;
    await Future.delayed(Duration(seconds: delay_time));
    video = await _cameraController.stopVideoRecording();
    await _cameraController.startVideoRecording();
    if(_disposeFlag == true) _videoController.dispose();
    _videoController = VideoPlayerController.file(File(video!.path));
    await _videoController.initialize();
    _chewieController = await ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      showControlsOnInitialize: false,
      showOptions: false,
      showControls: false,
      allowFullScreen: false,
      allowMuting: false,
      allowPlaybackSpeedChanging: false,
      useRootNavigator: false,
      allowedScreenSleep: false,
    );
    _disposeFlag = true;
    //debugPrint("ggg-----------------------------------------------------------------------------");
    setState(() {
      _isVideoPlay = true;
    });

    return videorecord();
  }

  void saveVideo(XFile? pickedFile) {
    GallerySaver.saveVideo(pickedFile!.path, albumName: 'SPORTY');
  }

  @override
  Widget build(BuildContext context) {
    // final appBar = AppBar(
    //   backgroundColor: Colors.green,
    //   title: const Text('遅延再生'),
    // );
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: appBar,
      body: _isVideoPlay == true
          ? Stack(
              children: [
                Container(
                    color: Colors.black,
                    width: _screenSize.width,
                    height: _screenSize.height,
                    child: Chewie(controller: _chewieController)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    _cameraController.stopVideoRecording();
                    _cameraController.dispose();
                    _videoController.dispose();
                    Navigator.of(context).pop();
                  },
                  child:
                      const Icon(color: Colors.white, Icons.arrow_back),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () {
                        saveVideo(video);
                      },
                      child:
                          const Icon(color: Colors.white, Icons.file_download),
                    ))
              ],
            )
          : Stack(
            children: [
              const Center(child: CircularProgressIndicator()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  _cameraController.stopVideoRecording();
                  _cameraController.dispose();
                  Navigator.of(context).pop();
                },
                child:
                    const Icon(color: Colors.black, Icons.arrow_back),
              ),
            ]
          ),
    );
  }
}
