import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:go_router_example/main.dart';

class MyRoute {
  static String mainScreenName = 'main_screen';
  static String mainScreenPath = '/main';
  static String authScreenPath = '/auth';
  static String authScreenName = 'auth_screen';
  static String secondScreenName = 'second_screen';
  static String secondScreenPath = '/second_screen';
  static String nestedScreenPath = '/nested_screen';
  static String nestedScreenName = 'nested_screen';
}

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
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Main'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.login), label: 'Auth'),
                ],
                currentIndex: _calculateCurrentIndex(context),
                onTap: (index) => _onTap(context, index),
              ),
            );
          },
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
            GoRoute(
              path: MyRoute.secondScreenPath,
              name: MyRoute.secondScreenName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const SecondScreen(),
              routes: [
                GoRoute(
                  path: MyRoute.nestedScreenPath,
                  name: MyRoute.nestedScreenName,
                  builder: (context, state) => const NestedScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  int _calculateCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).path;
    if (location?.startsWith(MyRoute.mainScreenPath) == true) {
      return 0;
    }
    if (location?.startsWith(MyRoute.authScreenPath) == true) {
      return 1;
    }
    return 0; // Значение по умолчанию
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(MyRoute.mainScreenPath);
        break;
      case 1:
        context.go(MyRoute.authScreenPath);
        break;
    }
  }
}
