import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';
import 'package:go_router_example/screens.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
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
              parentNavigatorKey: rootNavigatorKey,
              builder: (_, __, navigationShell) => ShellScreen(navigationShell: navigationShell),
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
