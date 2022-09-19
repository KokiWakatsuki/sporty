import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  go(BuildContext context) {
    context.push('/c');
  }

  back(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.green,
      title: const Text('画面B'),
    );

    final goButton = ElevatedButton(
      onPressed: () => go(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text('進む >'),
    );

    final backButton = ElevatedButton(
      onPressed: () => back(context),
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
            goButton,
          ],
        ),
      ),
    );
  }
}