import 'package:flutter/material.dart';

class BananaCounter extends StatelessWidget {
  final int number;
  const BananaCounter({super.key, required this.number});

  @override
  Widget build(BuildContext context) {

    final text = Text('$number');

    final row = Row(children: [
      text,
    ]);

    final con = Container(
      color: Colors.white,
      child: row,
    );

    return con;
  }
}