import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

/// Класс, содержащий пути и имена маршрутов
class MyRoute {
  static String mainScreenName = 'main_screen';
  static String mainScreenPath = '/main';

  static String authScreenName = 'auth_screen';
  static String authScreenPath = '/auth';

  static String secondScreenName = 'second_screen';
  static String secondScreenPath = '/second_screen';

  static String nestedScreenName = 'nested_screen';
  static String nestedScreenPath = '/nested_screen';
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
                routes: [
                  GoRoute(
                    path: MyRoute.nestedScreenPath,
                    name: MyRoute.nestedScreenName,
                    parentNavigatorKey: _shellNavigatorKey,
                    builder: (context, state) => const NestedScreen(),
                  ),
                ]),
          ],
        ),
      ],
    );
  }
}
