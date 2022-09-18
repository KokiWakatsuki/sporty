import 'package:flutter/material.dart';
import 'package:sporty/view/page_a.dart';
import 'package:sporty/view/page_b.dart';
import 'package:sporty/view/page_c.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

main() {
  final app = App();
  runApp(app);
}

// �A�v���S��
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // ���[�^�[
  final router = GoRouter(
    // �p�X (�A�v�����N�������Ƃ�)
    initialLocation: '/a',
    // �p�X�Ɖ�ʂ̑g�ݍ��킹
    routes: [
      GoRoute(
        path: '/a',
        builder: (context, state) => const PageA(),
      ),
      GoRoute(
        path: '/b',
        builder: (context, state) => const PageB(),
      ),
      GoRoute(
        path: '/c',
        builder: (context, state) => const PageC(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // ��̑g�ݍ��킹���g���ăA�v����\��
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}