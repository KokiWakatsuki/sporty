import 'package:flutter/material.dart';
import 'package:sporty/view/menu.dart';
import 'package:sporty/view/slow.dart';
import 'package:sporty/view/delay.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:sporty/view/top.dart';

main() {
  final app = App();
  runApp(app);
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final router = GoRouter(
    initialLocation: '/top',
    routes: [
      GoRoute(
        path: '/top',
        builder: (context, state) => const Top(),
      ),
      GoRoute(
        path: '/menu',
        builder: (context, state) => const Menu(),
      ),
      GoRoute(
        path: '/slow',
        builder: (context, state) => const Slow(),
      ),
      GoRoute(
        path: '/delay',
        builder: (context, state) => const Delay(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}