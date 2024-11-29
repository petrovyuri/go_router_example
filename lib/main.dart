import 'package:flutter/material.dart';
import 'package:go_router_example/app_router.dart';

final _appRouter = AppRouter.instance.initRouter();

void main() {
  _appRouter.goNamed('web_main');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router demo',
      routerConfig: _appRouter,
    );
  }
}
