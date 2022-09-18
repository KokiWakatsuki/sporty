import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

// ��� B
class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  // �i�ރ{�^�����������Ƃ�
  go(BuildContext context) {
    // ��� C �֐i��
    context.push('/c');
  }

  // �߂�{�^�����������Ƃ�
  back(BuildContext context) {
    // �O�̉�� �֖߂�
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // ��ʂ̏�ɕ\������o�[
    final appBar = AppBar(
      backgroundColor: Colors.green,
      title: const Text('���B'),
    );

    // �i�ރ{�^��
    final goButton = ElevatedButton(
      onPressed: () => go(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text('�i�� >'),
    );

    // �߂�{�^��
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< �߂�'),
    );

    // ��ʑS��
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton,
            goButton,
          ],
        ),
      ),
    );
  }
}