import 'package:flutter/material.dart';
import 'package:go_router_example/router/root_guard.dart';
import 'package:go_router_example/router/routes.dart';
import 'package:octopus/octopus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Octopus router;

  @override
  void initState() {
    super.initState();
    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.root,
      guards: [RootGuard()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Octopus',
      routerConfig: router.config,
      builder: (context, child) => OctopusTools(
        child: child!,
      ),
    );
  }
}
