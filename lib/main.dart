import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp.router(
    title: 'go_router demo',
    routerConfig: goRouter,
  ));

  WidgetsBinding.instance.addPostFrameCallback((_) {
    goRouter.go('/global');
  });
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

GoRouter goRouter =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
      redirect: (context, state) {
        if (state.fullPath == '/') {
          return '/main';
        }
        return null;
      },
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (_, __, navigationShell) =>
              ShellScreen(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              initialLocation: '/main',
              routes: [
                GoRoute(
                  path: '/main',
                  name: 'main_screen',
                  builder: (context, state) => const MainScreen(),
                )
              ],
            ),
            StatefulShellBranch(
              initialLocation: '/auth',
              routes: [
                GoRoute(
                  path: '/auth',
                  name: 'auth_screen',
                  builder: (context, state) => const AuthScreen(),
                ),
              ],
            )
          ],
        ),
        GoRoute(
          path: '/global',
          name: 'global_screen',
          builder: (context, state) => const GlobalScreen(),
        )
      ])
]);

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
            context.go('/global');
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
