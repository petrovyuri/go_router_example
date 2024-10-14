import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/profile/profile_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.goNamed(ProfileRoutes.detailScreen);
            },
            child: const Text('go DetailScreen')),
      ),
    );
  }
}
