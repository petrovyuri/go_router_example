import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:go_router_example/main.dart';

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
          StatefulShellBranch(initialLocation: '/main', routes: [
            GoRoute(
              path: '/main',
              name: 'main_screen',
              builder: (context, state) => const MainScreen(),
            )
          ]),
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
      // Отдельный роут
      GoRoute(
          path: '/web_view_screen',
          name: 'web_view_screen',
          builder: (context, state) => const WebViewScreen(),
          routes: [
            GoRoute(
              path: '/confirm_screen',
              name: 'confirm_screen',
              builder: (context, state) => const ConfirmScreen(),
            )
          ])
    ];
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      initialLocation: '/main',
      routes: routes,
    );
  }
}
