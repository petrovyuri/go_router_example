import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebViewScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Перейти на ConfirmScreen')),
      ),
    );
  }
}