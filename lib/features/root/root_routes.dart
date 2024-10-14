import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/auth/auth_routes.dart';
import 'package:go_router_example/features/main/main_routes.dart';
import 'package:go_router_example/features/profile/profile_routes.dart';
import 'package:go_router_example/features/root/root_screen.dart';
import 'package:go_router_example/features/webview/webview_routes.dart';

/// Класс для реализации роутов по фиче корневой страницы
abstract final class RootRoutes {
  static RouteBase build(GlobalKey<NavigatorState>? navigatorKey) {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: navigatorKey,
      builder: (_, __, navigationShell) => RootScreen(navigationShell: navigationShell),
      branches: [
        MainRoutes.buildShellBranch(),
        ProfileRoutes.buildShellBranch(),
        AuthRoutes.buildShellBranch(),
        WebviewRoutes.buildShellBranch(),
      ],
    );
  }
}
