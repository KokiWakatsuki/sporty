import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

// 画面 C
class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('画面C'),
    );

    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('< 戻る'),
    );

    // 画面全体
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