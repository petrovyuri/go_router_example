import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/app_router.dart';

void main() {
  final appRouter = AppRouter().initRouter();

  runApp(MaterialApp.router(
    title: 'go_router demo',
    routerConfig: appRouter,
  ));
}

/// Главный экран приложения
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(MyRoute.secondScreenName);
          },
          child: const Text('Перейти на SecondScreen'),
        ),
      ),
    );
  }
}

/// Экран авторизации
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(MyRoute.secondScreenName);
          },
          child: const Text('Перейти на SecondScreen'),
        ),
      ),
    );
  }
}

/// Второй экран
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(MyRoute.nestedScreenName);
          },
          child: const Text('Перейти на NestedScreen'),
        ),
      ),
    );
  }
}

/// Вложенный экран
class NestedScreen extends StatelessWidget {
  const NestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NestedScreen')),
      body: const Center(
        child: Text('NestedScreen'),
      ),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Auth'),
        ],
        currentIndex: _calculateCurrentIndex(state),
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  int _calculateCurrentIndex(GoRouterState state) {
    final location = state.matchedLocation;
    if (location.startsWith(MyRoute.mainScreenPath)) {
      return 0;
    }
    if (location.startsWith(MyRoute.authScreenPath)) {
      return 1;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed(MyRoute.mainScreenName);
        break;
      case 1:
        context.goNamed(MyRoute.authScreenName);
        break;
    }
  }
}
