import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/app_router.dart';

final _appRouter = AppRouter().initRouter();

void main() {
  // const link = ProfileRoutes.secondDetailScreen;
  // _appRouter.goNamed(link);

  runApp(MaterialApp.router(
    title: 'go_router demo',
    routerConfig: _appRouter,
  ));
}

/// Класс для реализации корневой страницы приложения
class RootScreen extends StatelessWidget {
  /// Создает корневую страницу приложения
  ///
  /// Принимает:
  /// - [navigationShell] - текущая ветка навигации
  const RootScreen({super.key, required this.navigationShell});

  /// Текущая ветка навигации
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Auth'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          //  context.push(MyRoute.webViewScreenPath);
        },
        child: const Text('Перейти на WebViewScreen'),
      )),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.go('/main');
            },
            child: const Text('Перейти на WebViewScreen')),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // context.goNamed(WebviewRoutes.confirmScreen);
            },
            child: const Text('Перейти на NestedScreen')),
      ),
    );
  }
}

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
