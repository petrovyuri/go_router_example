import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/profile/profile_routes.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DetailScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.goNamed(ProfileRoutes.secondDetailScreen);
            },
            child: const Text('go SecondDetailScreen')),
      ),
    );
  }
}
