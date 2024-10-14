import 'package:go_router/go_router.dart';
import 'package:go_router_example/features/profile/screens/detail_screen.dart';
import 'package:go_router_example/features/profile/screens/profile_screen.dart';
import 'package:go_router_example/features/profile/screens/second_detail_screen.dart';

abstract final class ProfileRoutes {
  // Пути для навигации, нужны для построения пути
  static const String _detailPath = '/detail';
  static const String _secondDetailPath = '/secondDetail';
  static const String _profilePath = '/profile';
  // Название роутов, нужны для навигации
  static const String detailScreen = 'detail_screen';
  static const String secondDetailScreen = 'secondDetail_screen';
  static const String profileScreen = 'profile_screen';

  static StatefulShellBranch buildShellBranch() => StatefulShellBranch(
        initialLocation: _profilePath,
        routes: [
          GoRoute(
            path: _profilePath,
            name: profileScreen,
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                  path: _detailPath,
                  name: detailScreen,
                  builder: (context, state) => const DetailScreen(),
                  routes: [
                    GoRoute(
                      path: _secondDetailPath,
                      name: secondDetailScreen,
                      builder: (context, state) => const SecondDetailScreen(),
                    ),
                  ]),
            ],
          ),
        ],
      );
}
