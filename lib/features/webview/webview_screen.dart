import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/webview/webview_routes.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebViewScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.goNamed(WebviewRoutes.confirmScreen);
            },
            child: const Text('Перейти на ConfirmScreen')),
      ),
    );
  }
}
