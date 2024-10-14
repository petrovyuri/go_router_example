import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/auth/auth_routes.dart';
import 'package:go_router_example/features/product/product_routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.goNamed(AuthRoutes.regScreen);
                },
                child: const Text('go RegScreen')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(ProductRoutes.productListScreen);
                },
                child: const Text('go ProductListScreen')),
            ElevatedButton(
                onPressed: () {
                  context.pushNamed(ProductRoutes.productListScreen);
                },
                child: const Text('push ProductListScreen')),
          ],
        ),
      ),
    );
  }
}
