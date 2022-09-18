import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  go(BuildContext context) {
    context.push('/b');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('画面A'),
    );

    final goButton = ElevatedButton(
      onPressed: () => go(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('進む >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goButton,
          ],
        ),
      ),
    );
  }
}