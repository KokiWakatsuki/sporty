import 'package:flutter/material.dart';
import 'package:sporty/view/menu.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  goMenu(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: "/menu"),
          builder: (BuildContext context) => const Menu(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: const Center(
        child: Text(
          'タップしてください',
        ),
      ),
      onTap: () => goMenu(context),
    ));
  }
}
