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

  goTakePicture(BuildContext context) {
    Navigator.pushNamed(context, '/take_picture');
  }

  goP2P(BuildContext context) {
    Navigator.pushNamed(context, '/p2p');
  }
  
  goComparison(BuildContext context) {
    Navigator.pushNamed(context, '/comparison');
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
      child: const Text('遅延再生 >'),
    );

    final goSlowButton = ElevatedButton(
      onPressed: () => goSlow(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('スロー再生 >'),
    );

    final goTakePictureButton = ElevatedButton(
      onPressed: () => goTakePicture(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('写真撮影 >'),
    );

    final goP2PButton = ElevatedButton(
      onPressed: () => goP2P(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('ファイル共有 >'),
    );

    final goComparisonButton = ElevatedButton(
      onPressed: () => goComparison(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('動画比較 >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goTestButton,
            goTakePictureButton,
            goDelayMenuButton,
            goSlowButton,
            goP2PButton,
            goComparisonButton,
          ],
        ),
      ),
    );
  }
}
