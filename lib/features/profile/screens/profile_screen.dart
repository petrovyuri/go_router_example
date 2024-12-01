import 'package:flutter/material.dart';
import 'package:go_router_example/features/root/root_screen.dart';
import 'package:go_router_example/router/root_tabs_helper.dart';
import 'package:go_router_example/router/routes.dart';
import 'package:octopus/octopus.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabs.profile.routeName,
        shouldHandleBackButton: (_) =>
            context.octopus.state.arguments[RootTabs.argument] ==
            RootTabs.profile.name,
      );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              context.octopus.openInTab(RootTabs.profile, Routes.detail),
          child: const Text('Перейти на DetailScreen'),
        ),
      ),
    );
  }
}
