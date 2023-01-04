// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
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
  final imagePicker = ImagePicker();
  late PickedFile pickedFile;

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
    PickedFile pickedFile =
        // ignore: deprecated_member_use
        (await imagePicker.getVideo(source: ImageSource.gallery))!;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          // ignore: unnecessary_null_comparison
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            InkWell(
              onTap: () {
                getVideoFromCamera();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green,
                width: _screenSize.width,
                height: _screenSize.width,
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
                height: _screenSize.width,
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
        ),
    );
  }
}
