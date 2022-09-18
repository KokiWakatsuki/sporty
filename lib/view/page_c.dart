import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

// ��� C
class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  // �߂�{�^�����������Ƃ�
  back(BuildContext context) {
    // �O�̉�� �֖߂�
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // ��ʂ̏�ɕ\������o�[
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('���C'),
    );

    // �߂�{�^��
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
          ],
        ),
      ),
    );
  }
}