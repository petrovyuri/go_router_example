import 'package:flutter/cupertino.dart';
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

/// Класс, реализующий роутер приложения и все поля классов
class AppRouter {
  /// Ключ для доступа к корневому навигатору приложения
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Метод для инициализации экземпляра GoRouter
  GoRouter initRouter() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: MyRoute.mainScreenPath,
            routes: [
              GoRoute(
                path: MyRoute.mainScreenPath,
                name: MyRoute.mainScreenName,
                builder: (context, state) => const MainScreen(),
              )
            ],
          ),
          StatefulShellBranch(
            initialLocation: MyRoute.authScreenPath,
            routes: [
              GoRoute(
                path: MyRoute.authScreenPath,
                name: MyRoute.authScreenName,
                builder: (context, state) => const AuthScreen(),
              ),
            ],
          )
        ],
      ),
      // Отдельный роут
      GoRoute(
          path: MyRoute.secondScreenPath,
          name: MyRoute.secondScreenName,
          builder: (context, state) => const SecondScreen(),
          routes: [
            GoRoute(
              path: MyRoute.nestedScreenPath,
              name: MyRoute.nestedScreenPath,
              builder: (context, state) => const NestedScreen(),
            )
          ])
    ];
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      initialLocation: MyRoute.authScreenPath,
      routes: routes,
    );
  }
}
