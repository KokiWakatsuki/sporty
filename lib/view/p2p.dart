// ignore_for_file: public_member_api_docs, unused_element, sort_child_properties_last, deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison, unused_field, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, await_only_futures, unused_local_variable, non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class P2P extends StatefulWidget {
  const P2P({Key? key}) : super(key: key);

  @override
  State<P2P> createState() => _P2PState();
}

class _P2PState extends State<P2P> with WidgetsBindingObserver {
  int a = 0;
  String text = '';
  String subject = '';
  List<String> imagePaths = [];
  int len = 0;
  int chewie_update = 0;
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    final appBar = AppBar(
      backgroundColor: Colors.green,
      title: const Text('動画共有'),
    );
    return Scaffold(
        appBar: appBar,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("動画を選択"),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile =
                      (await imagePicker.getVideo(source: ImageSource.gallery))!;
                      _controller = VideoPlayerController.file(File(pickedFile.path));
                      await _controller.initialize();
                      _chewieController = ChewieController(
                        videoPlayerController: _controller,
                        autoPlay: true,
                        looping: false,
                        zoomAndPan: true,
                        showControlsOnInitialize: false,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                          len = imagePaths.length;
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: const Text('共有'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                        ),
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShare(context),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return Row(children: [
                        ElevatedButton(
                          child: const Text('直前に選択した動画を破棄'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, // background
                          ),
                          onPressed: () => setState(() {
                            chewie_update = 1;
                            _onDeleteImage();
                          })
                        ),
                        Text('          選択中の動画：$len')
                      ],);
                    },
                  ),
                  Text(''),
                  text.isEmpty && imagePaths.isEmpty
                  ? Text('')
                  : chewie_update == 0
                  ? Column(children: [
                    Text('直前に選択した動画'),
                    Container(
                      color: Colors.black,
                      width: _screenSize.width,
                      height: _screenSize.height * 0.6,
                      child: Chewie(controller: _chewieController)
                    ),
                  ],
                  )
                  : Column(children: [
                    Text('LOADING'),
                    Container(
                      color: Colors.black,
                      width: _screenSize.width,
                      height: _screenSize.height * 0.6,
                      child: const Center(child: CircularProgressIndicator())
                    ),
                  ],
                  )
                ],
              ),
            ),
          )
        );
  }

  _onDeleteImage() async {
    chewie_update = 0;
    imagePaths.removeLast();
    len = imagePaths.length;
    _controller.dispose();
    _controller = VideoPlayerController.file(File(imagePaths.last));
    await _controller.initialize();
    _chewieController = await ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: false,
      zoomAndPan: true,
      showControlsOnInitialize: false,
    );
    setState(() {
      
    });
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("text");
  }
}