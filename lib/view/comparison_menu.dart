// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

var _height = 0.1;
var _width = 0.85;

class ComparisonMenu extends StatelessWidget {
  const ComparisonMenu({Key? key}) : super(key: key);

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
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      title: const Text(
        '動画比較メニュー',
        style: TextStyle(
          color: Colors.black,
        ),),
    );

    final goComparisonButton = ElevatedButton(
      onPressed: () => goComparison(context),
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
        '並べて比較',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final goComparison2Button = ElevatedButton(
      onPressed: () => goComparison2(context),
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
        '交互に比較',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final goComparison3Button = ElevatedButton(
      onPressed: () => goComparison3(context),
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
        '透過させて比較',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goComparisonButton,
            goComparison2Button,
            goComparison3Button,
          ],
        ),
      )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:
              const Icon(color: Colors.white, Icons.arrow_back),
        ),
      ],)
    );
  }
}
