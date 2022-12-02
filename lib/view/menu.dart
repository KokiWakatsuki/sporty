import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  goTest(BuildContext context) {
    Navigator.pushNamed(context, '/test');
  }

  goDelayMenu(BuildContext context) {
    Navigator.pushNamed(context, '/delay_menu');
  }

  goSlow(BuildContext context) {
    Navigator.pushNamed(context, '/slow');
  }

  goDelay(BuildContext context) {
    Navigator.pushNamed(context, '/delay');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('MENU'),
    );

    final goTestButton = ElevatedButton(
      onPressed: () => goTest(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('テスト >'),
    );

    final goDelayMenuButton = ElevatedButton(
      onPressed: () => goDelayMenu(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('DELAY MENU >'),
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
            goDelayMenuButton,
            goTestButton,
            goSlowButton,
            goDelayButton,
          ],
        ),
      ),
    );
  }
}
