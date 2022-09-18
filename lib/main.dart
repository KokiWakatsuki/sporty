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

// アプリ全体
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // ルーター
  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/a',
    // パスと画面の組み合わせ
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
    // 上の組み合わせを使ってアプリを表示
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}