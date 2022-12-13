﻿// ignore_for_file: avoid_print, unnecessary_null_comparison, unnecessary_new, prefer_is_empty, library_private_types_in_public_api, use_key_in_widget_constructors, unused_import

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

// typedef void Callback(List<dynamic> list, int h, int w);
List<CameraDescription> cameras = [];

class CameraFeed extends StatefulWidget {
  static const routeName = '/camera-feed';
  @override
  _CameraFeedState createState() => _CameraFeedState();
}

class _CameraFeedState extends State<CameraFeed> {
  late CameraController controller;
  bool isDetecting = false;
  Map<int, dynamic> keyPoints = {};
  late ui.Image image;

  poseEstimation(CameraImage img) async {
    List results;
    results = (await Tflite.runPoseNetOnFrame(
      bytesList: img.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: img.height,
      imageWidth: img.width,
      numResults: 1,
    ))!;
    return results;
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then(
      (cameras) {
        CameraDescription rearCamera = cameras.firstWhere((description) {
          return description.lensDirection == CameraLensDirection.back;
        });

        controller = new CameraController(rearCamera, ResolutionPreset.high);
        controller.initialize().then(
          (_) {
            if (!mounted) {
              return;
            }
            setState(() {});
            controller.startImageStream(
              (CameraImage img) async {
                if (!isDetecting) {
                  isDetecting = true;
                  // List recognition = await Tflite.runPoseNetOnFrame(
                  //   bytesList: img.planes.map((plane) {
                  //     return plane.bytes;
                  //   }).toList(),
                  //   imageHeight: img.height,
                  //   imageWidth: img.width,
                  //   numResults: 1,
                  // );
                  var future = compute(poseEstimation, img);
                  List recognition = await future;
                  if (recognition.length > 0) {
                    // Should check mounted because setState is called after disposed
                    if (!mounted) {
                      return;
                    }
                    setState(() {
                      keyPoints = new Map<int, dynamic>.from(
                          recognition[0]['keypoints']);
                    });
                    print(keyPoints);
                  } else {
                    keyPoints = {};
                  }
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    isDetecting = false;
                  });
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomPaint(
              foregroundPainter: CirclePainter(keyPoints),
              child: CameraPreview(controller),
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Map params;
  CirclePainter(this.params);

  @override
  void paint(ui.Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.red;
    if (params.isNotEmpty) {
      params.forEach((index, param) {
        canvas.drawCircle(
            Offset(size.width * param['x'], size.height * param['y']),
            5,
            paint);
      });
      print("Done!");
    }
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) => true;
}
