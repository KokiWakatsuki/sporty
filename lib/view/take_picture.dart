// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_constructors, deprecated_member_use, duplicate_ignore, constant_identifier_names, sort_child_properties_last

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
                      Text('カメラで動画を撮影する', style: TextStyle(fontSize: sub_text_size,),),
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
                      Text('STEP 2', style: TextStyle(fontSize: main_text_size,),),
                      Text(' ', style: TextStyle(fontSize: space_text_size,),),
                      Text('ストレージの動画を確認する', style: TextStyle(fontSize: sub_text_size,),),
                      Icon(
                        size: 50, color: Colors.black, Icons.folder
                      ),
                    ],
                  )
                )
              ),
            ),
          ])
          : Column(children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isVideoPlay = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green,
                width: _screenSize.width,
                height: _screenSize.height * 0.07,
                child: Center(
                  child: Text('再生をやめる'),
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
