// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unused_local_variable, unused_import, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sporty/main.dart';

int delay_min = 0;
int delay_sec = 3;
int resolution_preset = 5;
int camera_lens_flag = 0;
const double text_size = 20;
const double time_text_size = 25;

class DelayMenu extends StatefulWidget {
  const DelayMenu({Key? key}) : super(key: key);

  @override
  State<DelayMenu> createState() => _DelayMenuState();
}

class _DelayMenuState extends State<DelayMenu> {
  goDelay(BuildContext context) {
    Navigator.pushNamed(context, '/delay');
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    final appBar = AppBar(
      backgroundColor: Colors.grey,
      title: const Text(
        style: TextStyle(
        color: Colors.black,
      ),
      '遅延再生設定'
    ),
      iconTheme: IconThemeData(
        color: Colors.black
      )
    );

    final sec_dropdownButton = DropdownButton(
      items: [
        if(delay_min != 0) DropdownMenuItem(value: 0, child: Text('00', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 1, child: Text('01', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 2, child: Text('02', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 3, child: Text('03', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 4, child: Text('04', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 5, child: Text('05', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 6, child: Text('06', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 7, child: Text('07', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 8, child: Text('08', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 9, child: Text('09', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 10, child: Text('10', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 11, child: Text('11', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 12, child: Text('12', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 13, child: Text('13', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 14, child: Text('14', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 15, child: Text('15', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 16, child: Text('16', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 17, child: Text('17', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 18, child: Text('18', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 19, child: Text('19', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 20, child: Text('20', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 21, child: Text('21', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 22, child: Text('22', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 23, child: Text('23', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 24, child: Text('24', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 25, child: Text('25', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 26, child: Text('26', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 27, child: Text('27', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 28, child: Text('28', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 29, child: Text('29', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 30, child: Text('30', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 31, child: Text('31', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 32, child: Text('32', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 33, child: Text('33', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 34, child: Text('34', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 35, child: Text('35', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 36, child: Text('36', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 37, child: Text('37', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 38, child: Text('38', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 39, child: Text('39', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 40, child: Text('40', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 41, child: Text('41', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 42, child: Text('42', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 43, child: Text('43', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 44, child: Text('44', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 45, child: Text('45', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 46, child: Text('46', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 47, child: Text('47', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 48, child: Text('48', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 49, child: Text('49', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 50, child: Text('50', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 51, child: Text('51', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 52, child: Text('52', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 53, child: Text('53', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 54, child: Text('54', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 55, child: Text('55', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 56, child: Text('56', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 57, child: Text('57', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 58, child: Text('58', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_min != 10) DropdownMenuItem(value: 59, child: Text('59', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
      ],
      dropdownColor: Colors.grey,
      value: delay_sec,
      onChanged: (int? value) {
        setState(() {
          delay_sec = value!;
        });
      },
      iconSize: 0,
    );

    final min_dropdownButton = DropdownButton(
      items: [
        if(delay_sec != 0) DropdownMenuItem(value: 0, child: Text('00', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 1, child: Text('01', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 2, child: Text('02', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 3, child: Text('03', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 4, child: Text('04', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 5, child: Text('05', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 6, child: Text('06', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 7, child: Text('07', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 8, child: Text('08', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        DropdownMenuItem(value: 9, child: Text('09', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
        if(delay_sec == 0) DropdownMenuItem(value: 10, child: Text('10', style: TextStyle(fontSize: time_text_size,color: Colors.white),),),
      ],
      dropdownColor: Colors.grey,
      value: delay_min,
      onChanged: (int? value) {
        setState(() {
          delay_min = value!;
        });
      },
      iconSize: 0,
    );

    final goDelayButton = ElevatedButton(
      onPressed: () => goDelay(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        width: _screenSize.width * 0.25,
        height:_screenSize.height * 0.06,
        child: Center(
          child: const Text(
            'スタート',
            style: TextStyle(
              color: Colors.black,
              fontSize: text_size,
            ),
          ),
        )
      )
    );

    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: appBar,
      body: Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '遅延時間',
                  style: TextStyle(
                    fontSize: text_size,
                    color: Colors.white
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  min_dropdownButton,
                  Text(
                    ' 分  ',
                    style: TextStyle(
                      fontSize: time_text_size,color: Colors.white
                    ),
                  ),
                  sec_dropdownButton,
                  Text(
                    ' 秒',
                    style: TextStyle(
                      fontSize: time_text_size,color: Colors.white
                    ),
                  ),
                ]),
              ]
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'カメラ方向',
                  style: TextStyle(
                    fontSize: text_size,
                    color: Colors.white
                  ),
                ),
                Text(''),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10,
                        children: [
                          ChoiceChip(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            label: Container(
                              width: _screenSize.width * 0.3,
                              height:_screenSize.height * 0.05,
                              child: Center(child: 
                                Text(
                                  "インカメラ",
                                  style: TextStyle(
                                    fontSize: text_size,
                                    color: camera_lens_flag == 0 ? Colors.black : Colors.white30
                                  )
                                ),
                              ),
                            ),
                            selected: camera_lens_flag == 0,
                            backgroundColor: Colors.black87,
                            selectedColor: Colors.grey,
                            onSelected: (_) {
                              setState(() {
                                camera_lens_flag = 0;
                              });
                            },
                          ),
                          ChoiceChip(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            label: Container(
                              width: _screenSize.width * 0.3,
                              height:_screenSize.height * 0.05,
                              child: Center(child: 
                                Text(
                                  "アウトカメラ",
                                  style: TextStyle(
                                    fontSize: text_size,
                                    color: camera_lens_flag == 1 ? Colors.black : Colors.white30
                                  )
                                ),
                              ),
                            ),
                            selected: camera_lens_flag == 1,
                            backgroundColor: Colors.black87,
                            selectedColor: Colors.grey,
                            onSelected: (_) {
                              setState(() {
                                camera_lens_flag = 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '解像度',
                  style: TextStyle(
                    fontSize: text_size,
                    color: Colors.white
                  ),
                ),
                Text(''),
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ChoiceChip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        label: Container(
                          width: _screenSize.width * 0.3,
                          height:_screenSize.height * 0.05,
                          child: Center(child: 
                            Text(
                              "240p",
                              style: TextStyle(
                                fontSize: text_size,
                                color: resolution_preset ==0 ? Colors.black : Colors.white30
                              )
                            ),
                          ),
                        ),
                        selected: resolution_preset == 0,
                        backgroundColor: Colors.black87,
                        selectedColor: Colors.grey,
                        onSelected: (_) {
                          setState(() {
                            resolution_preset = 0;
                          });
                        },
                      ),
                      Text('   '),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        label: Container(
                          width: _screenSize.width * 0.3,
                          height:_screenSize.height * 0.05,
                          child: Center(child: 
                            Text(
                              "480p",
                              style: TextStyle(
                                fontSize: text_size,
                                color: resolution_preset ==1 ? Colors.black : Colors.white30
                              )
                            ),
                          ),
                        ),
                        selected: resolution_preset == 1,
                        backgroundColor: Colors.black87,
                        selectedColor: Colors.grey,
                        onSelected: (_) {
                          setState(() {
                            resolution_preset = 1;
                          });
                        },
                      ),
                    ],),
                    Text(''),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ChoiceChip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        label: Container(
                          width: _screenSize.width * 0.3,
                          height:_screenSize.height * 0.05,
                          child: Center(child: 
                            Text(
                              "720p",
                              style: TextStyle(
                                fontSize: text_size,
                                color: resolution_preset ==2 ? Colors.black : Colors.white30
                              )
                            ),
                          ),
                        ),
                        selected: resolution_preset == 2,
                        backgroundColor: Colors.black87,
                        selectedColor: Colors.grey,
                        onSelected: (_) {
                          setState(() {
                            resolution_preset = 2;
                          });
                        },
                      ),
                      Text('   '),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        label: Container(
                          width: _screenSize.width * 0.3,
                          height:_screenSize.height * 0.05,
                          child: Center(child: 
                            Text(
                              "1080p",
                              style: TextStyle(
                                fontSize: text_size,
                                color: resolution_preset ==3 ? Colors.black : Colors.white30
                              )
                            ),
                          ),
                        ),
                        selected: resolution_preset == 3,
                        backgroundColor: Colors.black87,
                        selectedColor: Colors.grey,
                        onSelected: (_) {
                          setState(() {
                            resolution_preset = 3;
                          });
                        },
                      ),
                    ],),
                    Text(''),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ChoiceChip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        label: Container(
                          width: _screenSize.width * 0.3,
                          height:_screenSize.height * 0.05,
                          child: Center(child: 
                            Text(
                              "2160p",
                              style: TextStyle(
                                fontSize: text_size,
                                color: resolution_preset ==4 ? Colors.black : Colors.white30
                              )
                            ),
                          ),
                        ),
                        selected: resolution_preset == 4,
                        backgroundColor: Colors.black87,
                        selectedColor: Colors.grey,
                        onSelected: (_) {
                          setState(() {
                            resolution_preset = 4;
                          });
                        },
                      ),
                      Text('   '),
                      ChoiceChip(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        label: Container(
                          width: _screenSize.width * 0.3,
                          height:_screenSize.height * 0.05,
                          child: Center(child: 
                            Text(
                              "MAX",
                              style: TextStyle(
                                fontSize: text_size,
                                color: resolution_preset ==5 ? Colors.black : Colors.white30
                              )
                            ),
                          ),
                        ),
                        selected: resolution_preset == 5,
                        backgroundColor: Colors.black87,
                        selectedColor: Colors.grey,
                        onSelected: (_) {
                          setState(() {
                            resolution_preset = 5;
                          });
                        },
                      ),
                    ],),
                  ],
                )
              ]
            ),
            goDelayButton,
          ],
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child:
            const Icon(color: Colors.white, Icons.arrow_back),
      ),])
    );
  }
}
