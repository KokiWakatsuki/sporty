// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

var _height = 0.08;
var _width = 0.8;

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
      backgroundColor: Colors.green,
      title: const Text('メニュー'),
    );

    final goComparisonButton = ElevatedButton(
      onPressed: () => goComparison(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
      ),
      child: const Text(
        '並べて比較',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );

    final goComparison2Button = ElevatedButton(
      onPressed: () => goComparison2(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
      ),
      child: const Text(
        '交互に比較',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );

    final goComparison3Button = ElevatedButton(
      onPressed: () => goComparison3(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: Size(
          MediaQuery.of(context).size.width * _width,
          MediaQuery.of(context).size.height * _height,
        ),
      ),
      child: const Text(
        '透過させて比較',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Center(
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
    );
  }
}
