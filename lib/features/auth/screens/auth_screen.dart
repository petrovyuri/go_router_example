import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/auth/auth_routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.pushNamed(AuthRoutes.regScreen);
            },
            child: const Text('go RegScreen')),
      ),
    );
  }
}
