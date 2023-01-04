// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers

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
    getVideoFromCamera();
    super.initState();
  }

  Future getVideoFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await imagePicker.getVideo(source: ImageSource.camera);
    GallerySaver.saveVideo(pickedFile!.path, albumName: 'SPORTY');
    setState(() {
      getVideoFromCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: Text("LOADING"),
              )
        );
  }
}
