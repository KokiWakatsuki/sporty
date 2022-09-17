import 'package:flutter/material.dart';
import 'package:sporty/components/widgets/test/banana_counter.dart';

void main(){

  // ignore: unused_local_variable
  final controller = TextEditingController();

  // ignore: prefer_const_constructors
  final textField = TextField(
    controller: controller,
    // ignore: prefer_const_constructors
    decoration: InputDecoration(

      border: const OutlineInputBorder(),
      labelText: 'your name',
      hintText: 'fight',
      errorText: 'too long',
    ),
  );

  xxxx() {
    debugPrint(controller.text);
  }

  final button = ElevatedButton(
    onPressed: xxxx,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
    child: const Text('press')
  );



  final col = Column(
    
    mainAxisAlignment: MainAxisAlignment.center, //column ����
    crossAxisAlignment: CrossAxisAlignment.center, //column ����
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

      const BananaCounter(number: 888),

      textField,

      button,

    ]);

    // ignore: prefer_const_constructors
    

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