import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

// 画面 A
class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  // 進むボタンを押したとき
  go(BuildContext context) {
    // 画面 B へ進む
    context.push('/b');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('画面A'),
    );

    // 進むボタン
    final goButton = ElevatedButton(
      onPressed: () => go(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('進む >'),
    );

    // 画面全体
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