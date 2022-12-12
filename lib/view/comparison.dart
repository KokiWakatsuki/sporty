import 'package:flutter/material.dart';

class Comparison extends StatelessWidget {
  const Comparison({Key? key}) : super(key: key);

  goMenu(BuildContext context) {
    Navigator.pushNamed(context, '/menu');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('比較'),
    );

    final goMenuButton = ElevatedButton(
      onPressed: () => goMenu(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('MENU >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goMenuButton,
          ],
        ),
      ),
    );
  }
}
