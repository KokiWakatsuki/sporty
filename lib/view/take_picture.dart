// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_constructors, deprecated_member_use, duplicate_ignore

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'dart:typed_data';


// 写真撮影画面
class TakePicture extends StatefulWidget {
  const TakePicture({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureState createState() => TakePictureState();
}

class TakePictureState extends State<TakePicture> {
  late File _image;
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  final imagePicker = ImagePicker();
  late PickedFile pickedFile;
  bool _isVideoPlay = false;

  @override
  void initState() {
    super.initState();
  }

  Future getVideoFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await imagePicker.getVideo(source: ImageSource.camera);
    GallerySaver.saveVideo(pickedFile!.path, albumName: 'SPORTY');
  }

  Future getVideoFromGarally() async {
    PickedFile pickedFile = (await imagePicker.getVideo(source: ImageSource.gallery))!;
    _controller = VideoPlayerController.file(File(pickedFile.path));
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: false,
      zoomAndPan: true,
      playbackSpeeds: const [0.1, 0.2, 0.25, 0.3, 0.4, 0.5, 0.6, 0.7, 0.75, 0.8, 0.9, 1]
    );
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
                    size: 50,
                    color:Colors.white,
                    Icons.video_call
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                getVideoFromGarally();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                width: _screenSize.width,
                height: _screenSize.height * 0.5,
                child: Center(
                  child: const Icon(
                    size: 50,
                    color:Colors.white,
                    Icons.movie_creation
                  ),
                ),
              ),
            ),
            ]
          )
          : Column(children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isVideoPlay = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                width: _screenSize.width,
                height: _screenSize.height * 0.1,
                child: Center(
                  child: Text('戻る'),
                  ),
                ),
              ),
            Container(
              width: _screenSize.width,
              height: _screenSize.height * 0.9,
              child: Chewie(controller: _chewieController)
            ),
            ],
          )
        ),
    );
  }
}
