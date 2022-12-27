// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class Comparison extends StatefulWidget {
  const Comparison({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<Comparison> createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {
  late VideoPlayerController _controller_1;
  late VideoPlayerController _controller_2;
  late ChewieController _chewieController_1;
  late ChewieController _chewieController_2;
  final imagePicker = ImagePicker();
  bool _isVideoPlay_1 = false;
  bool _isVideoPlay_2 = false;
  late PickedFile pickedFile_1;
  late PickedFile pickedFile_2;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          // ignore: unnecessary_null_comparison
          child: _isVideoPlay_1 == false
            ? Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const Text("1つ目の動画を選択してください",style: TextStyle(
                  color: Colors.white,
                ),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  FloatingActionButton(
                    onPressed: getVideoFromCamera,
                    child: const Icon(Icons.video_call)),
                  FloatingActionButton(
                    onPressed: getVideoFromGarally_1,
                    child: const Icon(Icons.movie_creation))
                  ]
                )]
              )
            : _isVideoPlay_2 == false
              ? Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  const Text("2つ目の動画を選択してください",style: TextStyle(
                    color: Colors.white,
                  ),),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    FloatingActionButton(
                      onPressed: getVideoFromCamera,
                      child: const Icon(Icons.video_call)),
                    FloatingActionButton(
                      onPressed: getVideoFromGarally_2,
                      child: const Icon(Icons.movie_creation))
                    ]
                  )]
                )
              : Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  height:MediaQuery.of(context).size.height * 0.5,
                  child: Chewie(controller: _chewieController_1),
                ),
                Container(
                  height:MediaQuery.of(context).size.height * 0.5,
                  child: Chewie(controller: _chewieController_2),
                ),
                ]
              )
        ),
    );
  }
}
