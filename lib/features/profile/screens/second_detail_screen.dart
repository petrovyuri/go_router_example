import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/main/main_routes.dart';
import 'package:go_router_example/features/profile/profile_routes.dart';

class SecondDetailScreen extends StatelessWidget {
  const SecondDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondDetailScreen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.goNamed(ProfileRoutes.profileScreen);
                },
                child: const Text('go ProfileScreen')),
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
