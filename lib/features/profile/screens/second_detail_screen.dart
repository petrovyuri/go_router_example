import 'package:flutter/material.dart';

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
                  // context.goNamed(ProfileRoutes.profileScreen);
                },
                child: const Text('go ProfileScreen')),
            ElevatedButton(
                onPressed: () {
                  // context.goNamed(MainRoutes.mainScreen);
                },
                child: const Text('go MainScreen')),
          ],
        ),
      ),
    );
  }
}
