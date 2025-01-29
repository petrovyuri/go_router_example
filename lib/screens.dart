import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: const Center(child: Text('MainScreen')),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: ElevatedButton(
          onPressed: () {
            context.push('/global');
          },
          child: const Text('Перейти на глобальный экран')),
    );
  }
}

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GlobalScreen')),
      body: const Center(child: Text('GlobalScreen')),
    );
  }
}

class RootScreen extends StatelessWidget {
  /// {@macro RootScreen}
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('RootScreen'),
    );
  }
}
