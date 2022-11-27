import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

// 写真撮影画面
class Test extends StatefulWidget {
  const Test({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TestState createState() => TestState();
}


class TestState extends State<Test> {
  VideoPlayerController? _controller;
  final imagePicker = ImagePicker();
  Future getVideoFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await imagePicker.getVideo(source: ImageSource.camera);
    _controller = VideoPlayerController.file(File(pickedFile!.path));
    _controller!.initialize().then((_) {
      setState(() {
        _controller!.play();
      });
    });
  }
  Future getVideoFromGarally() async {
    PickedFile pickedFile =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
    _controller = VideoPlayerController.file(File(pickedFile.path));
    _controller!.initialize().then((_) {
      setState(() {
        _controller!.play();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Center(
            // ignore: unnecessary_null_comparison
            child: _controller == null
                ? Text(
                    '動画を選択してください',
                    style: Theme.of(context).textTheme.headline4,
                  )
                : VideoPlayer(_controller!)),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FloatingActionButton(
              onPressed: getVideoFromCamera, child: const Icon(Icons.video_call)),
          FloatingActionButton(
              onPressed: getVideoFromGarally, child: const Icon(Icons.movie_creation))
        ]));
  }
}