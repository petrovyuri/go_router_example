import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/app_router.dart';

void main() {
  // const link = '/global';
  // goRouter.go(link);

  runApp(MaterialApp.router(
    title: 'go_router demo',
    routerConfig: goRouter,
  ));
}

/// Класс для реализации корневой страницы приложения
class ShellScreen extends StatelessWidget {
  /// Создает корневую страницу приложения
  ///
  /// Принимает:
  /// - [navigationShell] - текущая ветка навигации
  const ShellScreen({super.key, required this.navigationShell});

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

