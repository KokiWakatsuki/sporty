// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_final_fields, sort_child_properties_last, deprecated_member_use, duplicate_ignore, constant_identifier_names

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
  static const double main_text_size = 25;
  static const double sub_text_size = 17;
  static const double space_text_size = 10;

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
                    getVideoFromCamera1();
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
                    getVideoFromGarally_1();
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
            : _isVideoSet_2 == false
                ? Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Align(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              setState(() {
                                _isVideoSet_1 = false;
                              });
                            });
                          },
                          child:
                              const Icon(color: Colors.white, Icons.arrow_back),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    InkWell(
                      onTap: () {
                        getVideoFromCamera1();
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
                              Text('STEP 2', style: TextStyle(fontSize: main_text_size,),),
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
                        getVideoFromGarally_2();
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
                              Text('STEP 2', style: TextStyle(fontSize: main_text_size,),),
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
                            _isVideoSet_2 = false;
                          });
                        },
                        child:
                            const Icon(color: Colors.white, Icons.arrow_back),
                      ),
                  ],
                )
      ),
    );
  }
}
