// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

int delay_sec = 3;

class DelayMenu extends StatefulWidget {
  const DelayMenu({Key? key}) : super(key: key);

  @override
  State<DelayMenu> createState() => _DelayMenuState();
}

class _DelayMenuState extends State<DelayMenu> {
  goTest2(BuildContext context) {
    Navigator.pushNamed(context, '/delay2');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('DELAY MENU'),
    );

    final dropdownButton = DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text('1'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('2'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('3'),
        ),
        DropdownMenuItem(
          value: 4,
          child: Text('4'),
        ),
        DropdownMenuItem(
          value: 5,
          child: Text('5'),
        ),
        DropdownMenuItem(
          value: 6,
          child: Text('6'),
        ),
        DropdownMenuItem(
          value: 7,
          child: Text('7'),
        ),
        DropdownMenuItem(
          value: 8,
          child: Text('8'),
        ),
        DropdownMenuItem(
          value: 9,
          child: Text('9'),
        ),
        DropdownMenuItem(
          value: 10,
          child: Text('10'),
        ),
      ],
      value: delay_sec,
      onChanged: (int? value) {
        setState(() {
          delay_sec = value!;
        });
      },
    );

    final goTest2Button = ElevatedButton(
      onPressed: () => goTest2(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('テスト2 >'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            dropdownButton,
            goTest2Button,
          ],
        ),
      ),
    );
  }
}
