import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/auth/auth_routes.dart';
import 'package:go_router_example/features/webview/webview_routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.pushNamed(AuthRoutes.regScreen);
                },
                child: const Text('Перейти на RegScreen')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(WebviewRoutes.webViewScreen);
                },
                child: const Text('Перейти на WebViewScreen')),
          ],
        ),
      ),
    );
  }
}
