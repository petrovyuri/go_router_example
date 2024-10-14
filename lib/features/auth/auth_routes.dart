import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/auth/screens/auth_screen.dart';
import 'package:go_router_example/features/auth/screens/reg_screen.dart';
import 'package:go_router_example/features/webview/webview_routes.dart';

abstract final class AuthRoutes {
  static const String _authPath = '/auth';
  static const String _regPath = '/reg';

  static const String authScreen = 'auth_screen';
  static const String regScreen = 'reg_screen';

  static StatefulShellBranch buildShellBranch() => StatefulShellBranch(
        initialLocation: _authPath,
        routes: [
          GoRoute(
              path: _authPath,
              name: authScreen,
              builder: (context, state) => const AuthScreen(),
              routes: [
                GoRoute(
                  path: _regPath,
                  name: regScreen,
                  builder: (context, state) => const RegScreen(),
                ),
              ]),
        ],
      );
}
