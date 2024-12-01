import 'package:flutter/widgets.dart';
import 'package:go_router_example/features/auth/screens/auth_screen.dart';
import 'package:go_router_example/features/auth/screens/reg_screen.dart';
import 'package:go_router_example/features/main/screens/main_screen.dart';
import 'package:go_router_example/features/profile/screens/detail_screen.dart';
import 'package:go_router_example/features/profile/screens/profile_screen.dart';
import 'package:go_router_example/features/profile/screens/second_detail_screen.dart';
import 'package:go_router_example/features/root/root_screen.dart';
import 'package:go_router_example/features/webview/webview_screen.dart';
import 'package:octopus/octopus.dart';

/// Описываем все возможные страницы в приложении
/// Можно так же использовать seald классы
enum Routes with OctopusRoute {
  webView('webview', title: 'WebView'),
  root('root', title: 'WebView'),
  auth('auth', title: 'WebView'),
  reg('reg', title: 'WebView'),
  home('home', title: 'WebView'),
  profile('profile', title: 'WebView'),
  detail('detail', title: 'WebView'),
  secondDetail('secondDetail', title: 'WebView');

  const Routes(this.name, {this.title});

  /// Название роута для RouteInfoParser
  @override
  final String name;

  /// Название страницы
  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.webView => const WebViewScreen(),
        Routes.root => const RootScreen(),
        Routes.auth => const AuthScreen(),
        Routes.reg => const RegScreen(),
        Routes.home => const HomeScreen(),
        Routes.profile => const ProfileScreen(),
        Routes.detail => const DetailScreen(),
        Routes.secondDetail => const SecondDetailScreen(),
      };
}
