import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/webview/confirm_screen.dart';
import 'package:go_router_example/features/webview/webview_screen.dart';

abstract final class WebviewRoutes {
  static const String webViewScreen = 'web_view_screen';
  static const String confirmScreen = 'confirm_screen';

  static const String webViewPath = '/web_view_screen';
  static const String confirmPath = '/confirm_screen';

  static GoRoute build() => GoRoute(
          path: webViewPath,
          name: webViewScreen,
          builder: (context, state) => const WebViewScreen(),
          routes: [
            GoRoute(
              path: confirmPath,
              name: confirmScreen,
              builder: (context, state) => const ConfirmScreen(),
            )
          ]);
}
