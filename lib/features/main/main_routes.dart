import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/main/screens/main_screen.dart';
import 'package:go_router_example/features/webview/webview_routes.dart';

abstract final class MainRoutes {
  static const String mainPath = '/main';
  static const String mainScreen = 'main_screen';

  static StatefulShellBranch buildShellBranch() =>
      StatefulShellBranch(initialLocation: mainPath, routes: [
        GoRoute(
          path: mainPath,
          name: mainScreen,
          builder: (context, state) => const MainScreen(),
          routes: [
            WebviewRoutes.build(),
          ],
        ),
      ]);
}
