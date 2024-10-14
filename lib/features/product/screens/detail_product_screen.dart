import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/main/main_routes.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DetailProductScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.goNamed(MainRoutes.mainScreen);
            },
            child: const Text('go MainScreen')),
      ),
    );
  }
}
