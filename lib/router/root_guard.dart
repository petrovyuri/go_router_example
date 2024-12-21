import 'dart:async';

import 'package:go_router_example/features/root/root_screen.dart';
import 'package:go_router_example/router/routes.dart';
import 'package:octopus/octopus.dart';

// Тк концепция октопуса в том что любые страницы могут быть вложены друг в друга в
// любом порядке, то если мы хотим чтобы первоначальные табы были с страницами
// то мы сделаем гвард который будет вставлять табы и первоначальные странице при открытии
// root ноды
class RootGuard extends OctopusGuard {
  RootGuard();

  static final String _homeTab = RootTabs.home.routeName;
  static final String _profileTab = RootTabs.profile.routeName;
  static final String _authTab = RootTabs.auth.routeName;

  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) {
    /// Ищем ноду с нашим экраном с табами
    final root = state.findByName(Routes.root.name);
    if (root == null) return state;

    /// Удаляем все подноды которые не должны существовать в root ноде
    root.removeWhere(
      (node) =>
          node.name != _homeTab &&
          node.name != _profileTab &&
          node.name != _authTab,
      recursive: false,
    );

    // Вставляем Home ноду и первоначальную станицу
    final home =
        root.putIfAbsent(_homeTab, () => OctopusNode.mutable(_homeTab));
    if (!home.hasChildren) {
      home.add(OctopusNode.mutable(Routes.home.name));
    }

    // Вставляем Profile ноду и первоначальную станицу
    final profile =
        root.putIfAbsent(_profileTab, () => OctopusNode.mutable(_profileTab));
    if (!profile.hasChildren) {
      profile.add(OctopusNode.mutable(Routes.profile.name));
    }

    // Вставляем Auth ноду и первоначальную станицу
    final auth =
        root.putIfAbsent(_authTab, () => OctopusNode.mutable(_authTab));
    if (!auth.hasChildren) {
      auth.add(OctopusNode.mutable(Routes.auth.name));
    }

    /// Все ето можно сделать через map по RootTabs, но мне лень

    if (!state.arguments.containsKey(RootTabs.argument)) {
      state.arguments.addAll({RootTabs.argument: RootTabs.home.name});
    }
    return state;
  }
}
