// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, prefer_const_constructors, no_leading_underscores_for_local_identifiers, constant_identifier_names, sort_child_properties_last, deprecated_member_use, duplicate_ignore, avoid_print, prefer_final_fields

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Comparison3 extends StatefulWidget {
  const Comparison3({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<Comparison3> createState() => _Comparison3State();
}

class _Comparison3State extends State<Comparison3> {
  final List<VideoPlayerController> _controller = [];
  final List<ChewieController> _chewieController = [];
  late PickedFile pickedFile_1;
  late PickedFile pickedFile_2;
  final imagePicker = ImagePicker();
  bool _isVideoSet_1 = false;
  bool _isVideoSet_2 = false;
  bool _isTypeSetPage = false;
  bool _isTypeSet = false;
  static const double main_text_size = 25;
  static const double sub_text_size = 17;
  static const double space_text_size = 10;

  @override
  void initState() {
    super.initState();
  }

  Future getVideoFromCamera_1() async {
    // ignore: deprecated_member_use
    pickedFile_1 = (await imagePicker.getVideo(source: ImageSource.camera))!;
    setState(() {
      _isVideoSet_1 = true;
    });
  }

  Future getVideoFromCamera_2() async {
    // ignore: deprecated_member_use
    pickedFile_2 = (await imagePicker.getVideo(source: ImageSource.camera))!;
    _isVideoSet_2 = true;
    setVideo();
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
    setVideo();
  }

  Future setType_1() async {
    _isTypeSetPage = true;
    _isTypeSet = false;
    setVideo();
  }

  Future setType_2() async {
    _isTypeSetPage = true;
    _isTypeSet = true;
    setVideo();
  }

  Future setVideo() async {
    _controller.add(VideoPlayerController.file(
      File(pickedFile_1.path),
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      ),
    ));
    _controller.add(VideoPlayerController.file(
      File(pickedFile_2.path),
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      ),
    ));
    await _controller[0].initialize();
    await _controller[1].initialize();
    _chewieController.add(ChewieController(
      videoPlayerController: _controller[0],
      autoPlay: true,
      showControlsOnInitialize: false,
      allowFullScreen: false,
      looping: true,
    ));
    _chewieController.add(ChewieController(
      videoPlayerController: _controller[1],
      autoPlay: true,
      showControlsOnInitialize: false,
      allowFullScreen: false,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          // ignore: unnecessary_null_comparison3
          child: _isVideoSet_1 == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                          getVideoFromCamera_1();
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
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'STEP 1',
                                style: TextStyle(
                                  fontSize: main_text_size,
                                ),
                              ),
                              Text(
                                ' ',
                                style: TextStyle(
                                  fontSize: space_text_size,
                                ),
                              ),
                              Text(
                                'カメラから映像を取得する',
                                style: TextStyle(
                                  fontSize: sub_text_size,
                                ),
                              ),
                              Text(
                                ' ',
                                style: TextStyle(
                                  fontSize: space_text_size,
                                ),
                              ),
                              Text(
                                '※操作不可・ループON',
                                style: TextStyle(
                                  fontSize: sub_text_size,
                                ),
                              ),
                              Icon(
                                  size: 50,
                                  color: Colors.black,
                                  Icons.videocam),
                            ],
                          )),
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
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'STEP 1',
                                  style: TextStyle(
                                    fontSize: main_text_size,
                                  ),
                                ),
                                Text(
                                  ' ',
                                  style: TextStyle(
                                    fontSize: space_text_size,
                                  ),
                                ),
                                Text(
                                  'ストレージから映像を取得する',
                                  style: TextStyle(
                                    fontSize: sub_text_size,
                                  ),
                                ),
                                Text(
                                  ' ',
                                  style: TextStyle(
                                    fontSize: space_text_size,
                                  ),
                                ),
                                Text(
                                  '※操作不可・ループON',
                                  style: TextStyle(
                                    fontSize: sub_text_size,
                                  ),
                                ),
                                Icon(
                                    size: 50,
                                    color: Colors.black,
                                    Icons.folder),
                              ],
                            ))),
                      ),
                    ])
              : _isVideoSet_2 == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Align(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isVideoSet_1 = false;
                                });
                              },
                              child: const Icon(
                                  color: Colors.white, Icons.arrow_back),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          InkWell(
                            onTap: () {
                              getVideoFromCamera_2();
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
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'STEP 2',
                                    style: TextStyle(
                                      fontSize: main_text_size,
                                    ),
                                  ),
                                  Text(
                                    ' ',
                                    style: TextStyle(
                                      fontSize: space_text_size,
                                    ),
                                  ),
                                  Text(
                                    'カメラから映像を取得する',
                                    style: TextStyle(
                                      fontSize: sub_text_size,
                                    ),
                                  ),
                                  Text(
                                    ' ',
                                    style: TextStyle(
                                      fontSize: space_text_size,
                                    ),
                                  ),
                                  Text(
                                    '※操作可・ループOFF',
                                    style: TextStyle(
                                      fontSize: sub_text_size,
                                    ),
                                  ),
                                  Icon(
                                      size: 50,
                                      color: Colors.black,
                                      Icons.videocam),
                                ],
                              )),
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'STEP 2',
                                      style: TextStyle(
                                        fontSize: main_text_size,
                                      ),
                                    ),
                                    Text(
                                      ' ',
                                      style: TextStyle(
                                        fontSize: space_text_size,
                                      ),
                                    ),
                                    Text(
                                      'ストレージから映像を取得する',
                                      style: TextStyle(
                                        fontSize: sub_text_size,
                                      ),
                                    ),
                                    Text(
                                      ' ',
                                      style: TextStyle(
                                        fontSize: space_text_size,
                                      ),
                                    ),
                                    Text(
                                      '※操作可・ループOFF',
                                      style: TextStyle(
                                        fontSize: sub_text_size,
                                      ),
                                    ),
                                    Icon(
                                        size: 50,
                                        color: Colors.black,
                                        Icons.folder),
                                  ],
                                ))),
                          ),
                        ])
                  : Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Chewie(controller: _chewieController[0]),
                        ),
                        InteractiveViewer(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Opacity(
                              opacity: 0.5,
                              child: Chewie(controller: _chewieController[1]),
                            ),
                          ),
                        ),
                        Align(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller[0].dispose();
                                _controller[1].dispose();
                                _chewieController[0].dispose();
                                _chewieController[1].dispose();
                                _controller.clear();
                                _chewieController.clear();
                                _isVideoSet_2 = false;
                              });
                            },
                            child: const Icon(
                                color: Colors.white, Icons.arrow_back),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    )),
    );
  }
}
