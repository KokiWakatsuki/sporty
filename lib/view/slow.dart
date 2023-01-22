// ignore_for_file: unused_import, sized_box_for_whitespace, prefer_const_constructors, no_leading_underscores_for_local_identifiers, deprecated_member_use, duplicate_ignore, sort_child_properties_last, constant_identifier_names

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
  static const double main_text_size = 25;
  static const double sub_text_size = 17;
  static const double space_text_size = 10;

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
        showControlsOnInitialize: false,
        playbackSpeeds: const [
          0.1,
          0.2,
          0.25,
          0.3,
          0.4,
          0.5,
          0.6,
          0.7,
          0.75,
          0.8,
          0.9,
          1
        ]);
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
        allowFullScreen: false,
        zoomAndPan: true,
        showControlsOnInitialize: false,
        playbackSpeeds: const [
          0.1,
          0.2,
          0.25,
          0.3,
          0.4,
          0.5,
          0.6,
          0.7,
          0.75,
          0.8,
          0.9,
          1
        ]);
    setState(() {
      _isVideoPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          // ignore: unnecessary_null_comparison
          child: _isVideoPlay == false
              ? Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Align(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child:
                            const Icon(color: Colors.white, Icons.arrow_back),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  InkWell(
                    onTap: () {
                      getVideoFromCamera();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: _screenSize.width * 0.85,
                      height: _screenSize.height * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('STEP 1', style: TextStyle(fontSize: main_text_size,),),
                            Text(' ', style: TextStyle(fontSize: space_text_size,),),
                            Text('カメラから映像を取得する', style: TextStyle(fontSize: sub_text_size,),),
                            Icon(
                              size: 50, color: Colors.black, Icons.videocam
                            ),
                          ],
                        ) 
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getVideoFromGarally();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: _screenSize.width * 0.85,
                      height: _screenSize.height * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('STEP 1', style: TextStyle(fontSize: main_text_size,),),
                            Text(' ', style: TextStyle(fontSize: space_text_size,),),
                            Text('ストレージから映像を取得する', style: TextStyle(fontSize: sub_text_size,),),
                            Icon(
                              size: 50, color: Colors.black, Icons.folder
                            ),
                          ],
                        )
                      )
                    ),
                  ),
                ])
              : Stack(
                  children: [
                    Container(
                      width: _screenSize.width,
                      height: _screenSize.height,
                      child: Chewie(controller: _chewieController)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVideoPlay = false;
                            _controller.dispose();
                          });
                        },
                        child:
                            const Icon(color: Colors.white, Icons.arrow_back),
                      ),
                  ],
                )),
    );
  }
}
