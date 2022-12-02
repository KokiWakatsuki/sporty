import 'package:flutter/material.dart';

class DelayMenu extends StatelessWidget {
  const DelayMenu({Key? key}) : super(key: key);

  goTest2(BuildContext context) {
    Navigator.pushNamed(context, '/delay2');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('DELAY MENU'),
    );

    final goTest2Button = ElevatedButton(
      onPressed: () => goTest2(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('テスト2 >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goTest2Button,
          ],
        ),
      ),
    );
  }
}
