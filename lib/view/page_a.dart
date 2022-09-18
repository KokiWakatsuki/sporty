import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

// ��� A
class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  // �i�ރ{�^�����������Ƃ�
  go(BuildContext context) {
    // ��� B �֐i��
    context.push('/b');
  }

  @override
  Widget build(BuildContext context) {
    // ��ʂ̏�ɕ\������o�[
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('���A'),
    );

    // �i�ރ{�^��
    final goButton = ElevatedButton(
      onPressed: () => go(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('�i�� >'),
    );

    // ��ʑS��
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goButton,
          ],
        ),
      ),
    );
  }
}