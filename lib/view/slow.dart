// ignore_for_file: unused_import

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// 写真撮影画面
class Slow extends StatefulWidget {
  const Slow({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  SlowState createState() => SlowState();
}

class SlowState extends State<Slow> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  final imagePicker = ImagePicker();
  bool _isVideoPlay = false;

  @override
  void initState() {
    super.initState();
  }

  Future getVideoFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await imagePicker.getVideo(source: ImageSource.camera);
    _controller = VideoPlayerController.file(File(pickedFile!.path));
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      zoomAndPan: true,
    );
    setState(() {
      _isVideoPlay = true;
    });
  }

  Future getVideoFromGarally() async {
    PickedFile pickedFile =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
    _controller = VideoPlayerController.file(File(pickedFile.path));
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      zoomAndPan: true,
    );
    setState(() {
      _isVideoPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          // ignore: unnecessary_null_comparison
          child: _isVideoPlay == false
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                FloatingActionButton(
                  onPressed: getVideoFromCamera,
                  child: const Icon(Icons.video_call)),
                FloatingActionButton(
                  onPressed: getVideoFromGarally,
                  child: const Icon(Icons.movie_creation))
                ]
              )
            : Chewie(controller: _chewieController)
        ),
    );
  }
}
