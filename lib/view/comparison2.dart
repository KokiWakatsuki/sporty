// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Comparison2 extends StatefulWidget {
  const Comparison2({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<Comparison2> createState() => _Comparison2State();
}

class _Comparison2State extends State<Comparison2> {
  late VideoPlayerController _controller_1;
  late VideoPlayerController _controller_2;
  late ChewieController _chewieController_1;
  late ChewieController _chewieController_2;
  final imagePicker = ImagePicker();
  bool _isVideoPlay_1 = false;
  bool _isVideoPlay_2 = false;
  late PickedFile pickedFile_1;
  late PickedFile pickedFile_2;
  late VoidCallback _listener;
  bool _isPlayComplete = false;

  @override
  void initState() {
    super.initState();
  }

  Future getVideoFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await imagePicker.getVideo(source: ImageSource.camera);
    _controller_1 = VideoPlayerController.file(File(pickedFile!.path));
    await _controller_1.initialize();
    _chewieController_1 = ChewieController(
      videoPlayerController: _controller_1,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      zoomAndPan: true,
    );
    setState(() {
      _isVideoPlay_1 = true;
    });
  }

  Future getVideoFromGarally_1() async {
    pickedFile_1 =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
    setState(() {
      _isVideoPlay_1 = true;
    });
  }

  Future getVideoFromGarally_2() async {
    pickedFile_2 =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
    await getVideoFromGarally();
    setState(() {
      _isVideoPlay_2 = true;
    });
  }

  Future getVideoFromGarally() async {
    _controller_1 = VideoPlayerController.file(
      File(pickedFile_1.path),
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      ),
    );
    _controller_2 = VideoPlayerController.file(
      File(pickedFile_2.path),
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      ),
    );
    await _controller_1.initialize();
    await _controller_2.initialize();
    _chewieController_1 = ChewieController(
      videoPlayerController: _controller_1,
      autoPlay: true,
      looping: true,
      //fullScreenByDefault: true,
      //allowFullScreen: false,
      zoomAndPan: true,
    );
    _chewieController_2 = ChewieController(
      videoPlayerController: _controller_2,
      autoPlay: true,
      looping: true,
      //fullScreenByDefault: true,
      //allowFullScreen: false,
      zoomAndPan: true,
    );
    _listener = () {
      if (!_controller_1.value.isPlaying) {
        // 再生完了
        setState(() {
          _isPlayComplete = true;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _isVideoPlay_1 == false
            ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                  onTap: () {
                    getVideoFromCamera();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blue,
                    width: _screenSize.width,
                    height: _screenSize.height * 0.5,
                    child: Center(
                      child: const Icon(
                          size: 50, color: Colors.white, Icons.video_call),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getVideoFromGarally_1();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.green,
                    width: _screenSize.width,
                    height: _screenSize.height * 0.5,
                    child: Center(
                      child: const Icon(
                          size: 50, color: Colors.white, Icons.movie_creation),
                    ),
                  ),
                ),
              ])
            : _isVideoPlay_2 == false
                ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    InkWell(
                      onTap: () {
                        getVideoFromCamera();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.green,
                        width: _screenSize.width,
                        height: _screenSize.height * 0.5,
                        child: Center(
                          child: const Icon(
                              size: 50, color: Colors.white, Icons.video_call),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getVideoFromGarally_2();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.blue,
                        width: _screenSize.width,
                        height: _screenSize.height * 0.5,
                        child: Center(
                          child: const Icon(
                              size: 50,
                              color: Colors.white,
                              Icons.movie_creation),
                        ),
                      ),
                    ),
                  ])
                : _isPlayComplete == false
                    ? Chewie(controller: _chewieController_1)
                    : Chewie(controller: _chewieController_2),
      ),
    );
  }
}
