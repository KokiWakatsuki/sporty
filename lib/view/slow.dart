import 'package:flutter/material.dart';

class Slow extends StatelessWidget {
  const Slow({Key? key}) : super(key: key);

  backMenu(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.green,
      title: const Text('スロー再生'),
    );

    final backButton = ElevatedButton(
      onPressed: () => backMenu(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton,
          ],
        ),
      ),
    );
  }
}