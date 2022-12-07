// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sporty/main.dart';

int delay_min = 0;
int delay_sec = 3;
int resolution_preset = 5;

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

    final lens_dropdownButton = DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('内カメラ'),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('外カメラ'),
        ),
      ],
      value: camera_lens_flag,
      onChanged: (int? value) {
        setState(() {
          camera_lens_flag = value!;
        });
      },
      iconSize: 0,
    );

    final resolution_dropdownButton = DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('240p'),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('480p'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('720p'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('1080p'),
        ),
        DropdownMenuItem(
          value: 4,
          child: Text('2160p'),
        ),
        DropdownMenuItem(
          value: 5,
          child: Text('MAX'),
        ),
      ],
      value: resolution_preset,
      onChanged: (int? value) {
        setState(() {
          resolution_preset = value!;
        });
      },
      iconSize: 0,
    );

    final sec_dropdownButton = DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('0'),
        ),
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
        DropdownMenuItem(
          value: 11,
          child: Text('11'),
        ),
        DropdownMenuItem(
          value: 12,
          child: Text('12'),
        ),
        DropdownMenuItem(
          value: 13,
          child: Text('13'),
        ),
        DropdownMenuItem(
          value: 14,
          child: Text('14'),
        ),
        DropdownMenuItem(
          value: 15,
          child: Text('15'),
        ),
        DropdownMenuItem(
          value: 16,
          child: Text('16'),
        ),
        DropdownMenuItem(
          value: 17,
          child: Text('17'),
        ),
        DropdownMenuItem(
          value: 18,
          child: Text('18'),
        ),
        DropdownMenuItem(
          value: 19,
          child: Text('19'),
        ),
        DropdownMenuItem(
          value: 20,
          child: Text('20'),
        ),
        DropdownMenuItem(
          value: 21,
          child: Text('21'),
        ),
        DropdownMenuItem(
          value: 22,
          child: Text('22'),
        ),
        DropdownMenuItem(
          value: 23,
          child: Text('23'),
        ),
        DropdownMenuItem(
          value: 24,
          child: Text('24'),
        ),
        DropdownMenuItem(
          value: 25,
          child: Text('25'),
        ),
        DropdownMenuItem(
          value: 26,
          child: Text('26'),
        ),
        DropdownMenuItem(
          value: 27,
          child: Text('27'),
        ),
        DropdownMenuItem(
          value: 28,
          child: Text('28'),
        ),
        DropdownMenuItem(
          value: 29,
          child: Text('29'),
        ),
        DropdownMenuItem(
          value: 30,
          child: Text('30'),
        ),
        DropdownMenuItem(
          value: 31,
          child: Text('31'),
        ),
        DropdownMenuItem(
          value: 32,
          child: Text('32'),
        ),
        DropdownMenuItem(
          value: 33,
          child: Text('33'),
        ),
        DropdownMenuItem(
          value: 34,
          child: Text('34'),
        ),
        DropdownMenuItem(
          value: 35,
          child: Text('35'),
        ),
        DropdownMenuItem(
          value: 36,
          child: Text('36'),
        ),
        DropdownMenuItem(
          value: 37,
          child: Text('37'),
        ),
        DropdownMenuItem(
          value: 38,
          child: Text('38'),
        ),
        DropdownMenuItem(
          value: 39,
          child: Text('39'),
        ),
        DropdownMenuItem(
          value: 40,
          child: Text('40'),
        ),
        DropdownMenuItem(
          value: 41,
          child: Text('41'),
        ),
        DropdownMenuItem(
          value: 42,
          child: Text('42'),
        ),
        DropdownMenuItem(
          value: 43,
          child: Text('43'),
        ),
        DropdownMenuItem(
          value: 44,
          child: Text('44'),
        ),
        DropdownMenuItem(
          value: 45,
          child: Text('45'),
        ),
        DropdownMenuItem(
          value: 46,
          child: Text('46'),
        ),
        DropdownMenuItem(
          value: 47,
          child: Text('47'),
        ),
        DropdownMenuItem(
          value: 48,
          child: Text('48'),
        ),
        DropdownMenuItem(
          value: 49,
          child: Text('49'),
        ),
        DropdownMenuItem(
          value: 50,
          child: Text('50'),
        ),
        DropdownMenuItem(
          value: 51,
          child: Text('51'),
        ),
        DropdownMenuItem(
          value: 52,
          child: Text('52'),
        ),
        DropdownMenuItem(
          value: 53,
          child: Text('53'),
        ),
        DropdownMenuItem(
          value: 54,
          child: Text('54'),
        ),
        DropdownMenuItem(
          value: 55,
          child: Text('55'),
        ),
        DropdownMenuItem(
          value: 56,
          child: Text('56'),
        ),
        DropdownMenuItem(
          value: 57,
          child: Text('57'),
        ),
        DropdownMenuItem(
          value: 58,
          child: Text('58'),
        ),
        DropdownMenuItem(
          value: 59,
          child: Text('59'),
        ),
      ],
      value: delay_sec,
      onChanged: (int? value) {
        setState(() {
          delay_sec = value!;
        });
      },
      iconSize: 0,
    );

    final min_dropdownButton = DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('0'),
        ),
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
      value: delay_min,
      onChanged: (int? value) {
        setState(() {
          delay_min = value!;
        });
      },
      iconSize: 0,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                min_dropdownButton,
                const Text(' 分　'),
                sec_dropdownButton,
                const Text(' 秒'),
              ]
            ),
            lens_dropdownButton,
            resolution_dropdownButton,
            goTest2Button,
          ],
        ),
      ),
    );
  }
}
