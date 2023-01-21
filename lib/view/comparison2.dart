// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_final_fields

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
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  final imagePicker = ImagePicker();
  bool _isVideoSet_1 = false;
  bool _isVideoSet_2 = false;
  late PickedFile pickedFile_1;
  late PickedFile pickedFile_2;
  late VoidCallback _listener;
  bool _flag = false;

  @override
  void initState(){
    super.initState();
  }

  Future getVideoFromCamera1() async {
    // ignore: deprecated_member_use
    pickedFile_1 = (await imagePicker.getVideo(source: ImageSource.camera))!;
    setState(() {
      _isVideoSet_1 = true;
    });
  }

  Future getVideoFromCamera2() async {
    // ignore: deprecated_member_use
    pickedFile_2 = (await imagePicker.getVideo(source: ImageSource.camera))!;
    _isVideoSet_2 = true;
    setVideo1();
  }

  Future getVideoFromGarally_1() async {
    pickedFile_1 =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
    setState(() {
      _isVideoSet_1 = true;
    });
  }

  Future getVideoFromGarally_2() async {
    pickedFile_2 =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
    _isVideoSet_2 = true;
    setVideo1();
  }

  Future setVideo1() async {
    _controller = VideoPlayerController.file(File(pickedFile_1.path),);
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
    );
    setState(() {});
    _listener = () async{
      if (!_controller.value.isPlaying) {
        // 再生完了
          _controller.dispose();
          await setVideo2();
      }
    };
    _controller.addListener(_listener);
  }

  Future setVideo2() async {
    _controller = VideoPlayerController.file(File(pickedFile_2.path),);
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
    );
    setState(() {});
    _listener = () async{
      if (!_controller.value.isPlaying) {
        // 再生完了
          _controller.dispose();
          await setVideo1();
      }
    };
    _controller.addListener(_listener);
  }

  

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _isVideoSet_1 == false
            ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                  onTap: () {
                    getVideoFromCamera1();
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
            : _isVideoSet_2 == false
                ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    InkWell(
                      onTap: () {
                        getVideoFromCamera1();
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
                : Chewie(controller: _chewieController)
      ),
    );
  }
}
