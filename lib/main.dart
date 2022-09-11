import 'package:flutter/material.dart';

void main(){

  final col = Column(
    
    mainAxisAlignment: MainAxisAlignment.center, //column Å™Å´
    crossAxisAlignment: CrossAxisAlignment.center, //column Å©Å®
    mainAxisSize: MainAxisSize.min, //column size min
    
    children: [

      Image.asset(
        'images/img_aka.jpeg'
      ),

      // Image.network(
      //   'https://...'
      // ),

      const Text('aaa'),
      const Text('bbb'),
      const Text('ccc'),

    ]);

    final con = Container(
    color: Colors.blue,
    width: 400,
    height: 700,
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    padding: const EdgeInsets.all(50),
    alignment: Alignment.topCenter,
    child: Center(child: col),
  );


  final app = MaterialApp(
    home: Scaffold(
      body: Center(
        child: con,
      ),
    ),
    );
  runApp(app);
}

// const b = 'aaa';
// const t = Text(b);
// const c = Center(child: t);
// const s = Scaffold(body: c);
// const a = MaterialApp(home: s);
// runApp(a);