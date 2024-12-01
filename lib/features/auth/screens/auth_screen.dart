import 'package:flutter/material.dart';
import 'package:go_router_example/features/root/root_screen.dart';
import 'package:octopus/octopus.dart';

class AuthTab extends StatelessWidget {
  const AuthTab({super.key});

  @override

  /// [BucketNavigator] по сути просто создание навигатора для таба
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabs.auth.routeName,

        /// Позволять учитывать нажатие кнопки назад
        shouldHandleBackButton: (_) =>

            /// Не учитываем если таб не auth
            context.octopus.state.arguments[RootTabs.argument] ==
            RootTabs.auth.name,
      );
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  // context.pushNamed(AuthRoutes.regScreen);
                },
                child: const Text('Перейти на RegScreen')),
            ElevatedButton(
                onPressed: () {
                  // context.pushNamed(WebviewRoutes.webViewScreen);
                },
                child: const Text('Перейти на WebViewScreen')),
          ],
        ),
      ),
    );
  }
}
