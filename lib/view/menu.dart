import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  goSlow(BuildContext context) {
    context.push('/slow');
  }

  goDelay(BuildContext context) {
    context.push('/delay');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('MENU'),
    );

    final goSlowButton = ElevatedButton(
      onPressed: () => goSlow(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('スロー再生 >'),
    );

    final goDelayButton = ElevatedButton(
      onPressed: () => goDelay(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('遅延再生 >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goSlowButton, goDelayButton,
          ],
        ),
      ),
    );
  }
}