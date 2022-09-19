import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  go(BuildContext context) {
    context.push('/menu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        // ignore: prefer_const_constructors
        child: Center(
          child: const Text(
            'アプリ名',
          ),
        ),
        onTap: () => go(context),
      )
    );
  }
}