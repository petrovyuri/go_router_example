import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final appRouter = AppRouter().initRouter();

  runApp(MaterialApp.router(
    title: 'go_router demo',
    routerConfig: appRouter,
  ));
}

/// Класс, содержащий пути и имена маршрутов
class MyRoute {
  static String mainScreenName = 'main_screen';
  static String mainScreenPath = '/main';

  static String authScreenName = 'auth_screen';
  static String authScreenPath = '/auth';

  static String secondScreenName = 'second_screen';
  static String secondScreenPath = '/second_screen';

  static String nestedScreenName = 'nested_screen';
  static String nestedScreenPath = '/second_screen/nested_screen';
}

/// Класс, реализующий роутер приложения
class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  GoRouter initRouter() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: MyRoute.authScreenPath,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) =>
              RootScreen(state: state, child: child),
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return navigationShell;
              },
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: MyRoute.mainScreenPath,
                      name: MyRoute.mainScreenName,
                      builder: (context, state) => const MainScreen(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: MyRoute.authScreenPath,
                      name: MyRoute.authScreenName,
                      builder: (context, state) => const AuthScreen(),
                    ),
                  ],
                ),
              ],
            ),
            // Определяем SecondScreen на верхнем уровне
            GoRoute(
              path: MyRoute.secondScreenPath,
              name: MyRoute.secondScreenName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const SecondScreen(),
            ),
            // Определяем NestedScreen на верхнем уровне
            GoRoute(
              path: MyRoute.nestedScreenPath,
              name: MyRoute.nestedScreenName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const NestedScreen(),
            ),
          ],
        ),
      ],
    );
  }
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
            context.push(MyRoute.secondScreenPath);
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
            context.push(MyRoute.secondScreenPath);
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
            context.push(MyRoute.nestedScreenPath);
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
