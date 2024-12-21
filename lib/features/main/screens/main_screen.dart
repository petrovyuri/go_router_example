import 'package:flutter/material.dart';
import 'package:go_router_example/features/root/root_screen.dart';
import 'package:go_router_example/router/root_tabs_helper.dart';
import 'package:go_router_example/router/routes.dart';
import 'package:octopus/octopus.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabs.home.routeName,
        // Handles back button only if the current route is the catalog screen
        shouldHandleBackButton: (_) =>
            context.octopus.state.arguments['root'] == RootTabs.home.name,
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => context.octopus.push(Routes.webView),
            child: const Text('Перейти на WebViewScreen глобально'),
          ),
          ElevatedButton(
            onPressed: () => context.octopus.openInTab(Routes.webView),
            child: const Text('Перейти на WebViewScreen внутри main'),
          ),
          ElevatedButton(
            onPressed: () => context.octopus.openInTab(
              Routes.webView,
              tab: RootTabs.profile,
            ),
            child: const Text('Перейти на WebViewScreen внутри profile'),
          ),
          ElevatedButton(
            onPressed: () => context.octopus.openInTab(
              Routes.webView,
              tab: RootTabs.profile,
              setActiveTab: false,
            ),
            child: const Text(
                'Открыть WebViewScreen внутри profile не переходя в него'),
          ),
        ],
      )),
    );
  }
}
