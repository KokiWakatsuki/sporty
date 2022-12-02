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
        DropdownMenuItem(
          value: 60,
          child: Text('60'),
        ),
        DropdownMenuItem(
          value: 61,
          child: Text('61'),
        ),
        DropdownMenuItem(
          value: 62,
          child: Text('62'),
        ),
        DropdownMenuItem(
          value: 63,
          child: Text('63'),
        ),
        DropdownMenuItem(
          value: 64,
          child: Text('64'),
        ),
        DropdownMenuItem(
          value: 65,
          child: Text('65'),
        ),
        DropdownMenuItem(
          value: 66,
          child: Text('66'),
        ),
        DropdownMenuItem(
          value: 67,
          child: Text('67'),
        ),
        DropdownMenuItem(
          value: 68,
          child: Text('68'),
        ),
        DropdownMenuItem(
          value: 69,
          child: Text('69'),
        ),
        DropdownMenuItem(
          value: 70,
          child: Text('70'),
        ),
        DropdownMenuItem(
          value: 71,
          child: Text('71'),
        ),
        DropdownMenuItem(
          value: 72,
          child: Text('72'),
        ),
        DropdownMenuItem(
          value: 73,
          child: Text('73'),
        ),
        DropdownMenuItem(
          value: 74,
          child: Text('74'),
        ),
        DropdownMenuItem(
          value: 75,
          child: Text('75'),
        ),
        DropdownMenuItem(
          value: 76,
          child: Text('76'),
        ),
        DropdownMenuItem(
          value: 77,
          child: Text('77'),
        ),
        DropdownMenuItem(
          value: 78,
          child: Text('78'),
        ),
        DropdownMenuItem(
          value: 79,
          child: Text('79'),
        ),
        DropdownMenuItem(
          value: 80,
          child: Text('80'),
        ),
        DropdownMenuItem(
          value: 81,
          child: Text('81'),
        ),
        DropdownMenuItem(
          value: 82,
          child: Text('82'),
        ),
        DropdownMenuItem(
          value: 83,
          child: Text('83'),
        ),
        DropdownMenuItem(
          value: 84,
          child: Text('84'),
        ),
        DropdownMenuItem(
          value: 85,
          child: Text('85'),
        ),
        DropdownMenuItem(
          value: 86,
          child: Text('86'),
        ),
        DropdownMenuItem(
          value: 87,
          child: Text('87'),
        ),
        DropdownMenuItem(
          value: 88,
          child: Text('88'),
        ),
        DropdownMenuItem(
          value: 89,
          child: Text('89'),
        ),
        DropdownMenuItem(
          value: 90,
          child: Text('90'),
        ),
        DropdownMenuItem(
          value: 91,
          child: Text('91'),
        ),
        DropdownMenuItem(
          value: 92,
          child: Text('92'),
        ),
        DropdownMenuItem(
          value: 93,
          child: Text('93'),
        ),
        DropdownMenuItem(
          value: 94,
          child: Text('94'),
        ),
        DropdownMenuItem(
          value: 95,
          child: Text('95'),
        ),
        DropdownMenuItem(
          value: 96,
          child: Text('96'),
        ),
        DropdownMenuItem(
          value: 97,
          child: Text('97'),
        ),
        DropdownMenuItem(
          value: 98,
          child: Text('98'),
        ),
        DropdownMenuItem(
          value: 99,
          child: Text('99'),
        ),
        DropdownMenuItem(
          value: 100,
          child: Text('100'),
        ),
        DropdownMenuItem(
          value: 101,
          child: Text('101'),
        ),
        DropdownMenuItem(
          value: 102,
          child: Text('102'),
        ),
        DropdownMenuItem(
          value: 103,
          child: Text('103'),
        ),
        DropdownMenuItem(
          value: 104,
          child: Text('104'),
        ),
        DropdownMenuItem(
          value: 105,
          child: Text('105'),
        ),
        DropdownMenuItem(
          value: 106,
          child: Text('106'),
        ),
        DropdownMenuItem(
          value: 107,
          child: Text('107'),
        ),
        DropdownMenuItem(
          value: 108,
          child: Text('108'),
        ),
        DropdownMenuItem(
          value: 109,
          child: Text('109'),
        ),
        DropdownMenuItem(
          value: 110,
          child: Text('110'),
        ),
        DropdownMenuItem(
          value: 111,
          child: Text('111'),
        ),
        DropdownMenuItem(
          value: 112,
          child: Text('112'),
        ),
        DropdownMenuItem(
          value: 113,
          child: Text('113'),
        ),
        DropdownMenuItem(
          value: 114,
          child: Text('114'),
        ),
        DropdownMenuItem(
          value: 115,
          child: Text('115'),
        ),
        DropdownMenuItem(
          value: 116,
          child: Text('116'),
        ),
        DropdownMenuItem(
          value: 117,
          child: Text('117'),
        ),
        DropdownMenuItem(
          value: 118,
          child: Text('118'),
        ),
        DropdownMenuItem(
          value: 119,
          child: Text('119'),
        ),
        DropdownMenuItem(
          value: 120,
          child: Text('120'),
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
