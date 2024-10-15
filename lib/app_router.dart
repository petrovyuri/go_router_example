import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/main/main_routes.dart';
import 'package:go_router_example/features/root/root_routes.dart';

/// Класс, реализующий роутер приложения и все поля классов
class AppRouter {
  AppRouter._();
  static final _instance = AppRouter._();
  static AppRouter get instance => _instance;

  /// Ключ для доступа к корневому навигатору приложения
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальный роут приложения
  String get initialLocation => MainRoutes.mainPath;

  /// Метод для инициализации экземпляра GoRouter
  GoRouter initRouter() {
    final routes = [
      // Нижнее навигационное меню
      RootRoutes.build(rootNavigatorKey),
    ];
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      routes: routes,
    );
  }
}
