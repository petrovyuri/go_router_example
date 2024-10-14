import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/main/main_routes.dart';
import 'package:go_router_example/features/product/product_routes.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProductListScreen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.goNamed(ProductRoutes.productDetailScreen);
                },
                child: const Text('go DetailProductScreen')),
            ElevatedButton(
                onPressed: () {
                  context.canPop();
                },
                child: const Text('pop')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(MainRoutes.mainScreen);
                },
                child: const Text('go MainScreen')),
          ],
        ),
      ),
    );
  }
}
