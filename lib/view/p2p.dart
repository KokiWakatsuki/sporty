// ignore_for_file: public_member_api_docs, unused_element, sort_child_properties_last, deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';

class P2P extends StatefulWidget {
  const P2P({Key? key}) : super(key: key);

  @override
  State<P2P> createState() => _P2PState();
}

class _P2PState extends State<P2P> with WidgetsBindingObserver {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
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
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: const Text('共有'),
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShare(context),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: const Text('選択した動画を破棄'),
                        onPressed: () => _onShareWithEmptyOrigin(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        );
  }

  _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
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