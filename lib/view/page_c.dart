import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  back(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('画面C'),
    );

    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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