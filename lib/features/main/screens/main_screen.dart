import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/webview/webview_routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(WebviewRoutes.webViewScreen);
          },
          child: const Text('Перейти на WebViewScreen'),
        ),
      ),
    );
  }
}
