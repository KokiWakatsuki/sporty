// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

var _height = 0.1;
var _width = 0.85;

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  goTest(BuildContext context) {
    Navigator.pushNamed(context, '/test');
  }

  goDelayMenu(BuildContext context) {
    Navigator.pushNamed(context, '/delay_menu');
  }

  goSlow(BuildContext context) {
    Navigator.pushNamed(context, '/slow');
  }

  goTakePicture(BuildContext context) {
    Navigator.pushNamed(context, '/take_picture');
  }

  goP2P(BuildContext context) {
    Navigator.pushNamed(context, '/p2p');
  }

  goComparisonMenu(BuildContext context) {
    Navigator.pushNamed(context, '/comparison_menu');
  }

  goComparison(BuildContext context) {
    Navigator.pushNamed(context, '/comparison');
  }

  goComparison2(BuildContext context) {
    Navigator.pushNamed(context, '/comparison2');
  }

  goComparison3(BuildContext context) {
    Navigator.pushNamed(context, '/comparison3');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.grey,
      title: const Text(
        style: TextStyle(
        color: Colors.black,
      ),
      'メニュー'
    ),
    );

    final goTestButton = ElevatedButton(
      onPressed: () => goTest(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
      ),
      child: const Text(
        'テスト',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );

    final goDelayMenuButton = ElevatedButton(
      onPressed: () => goDelayMenu(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        '遅延再生',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final goSlowButton = ElevatedButton(
      onPressed: () => goSlow(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        'スロー再生',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final goTakePictureButton = ElevatedButton(
      onPressed: () => goTakePicture(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        '動画撮影',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final goP2PButton = ElevatedButton(
      onPressed: () => goP2P(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        'ファイル共有',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final goComparisonMenuButton = ElevatedButton(
      onPressed: () => goComparisonMenu(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        '動画比較',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //goTestButton,
            goTakePictureButton,
            goDelayMenuButton,
            goSlowButton,
            goP2PButton,
            goComparisonMenuButton,
          ],
        ),
      )),
    );
  }
}
