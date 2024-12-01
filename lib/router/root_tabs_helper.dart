import 'package:go_router_example/features/root/root_screen.dart';
import 'package:go_router_example/router/routes.dart';
import 'package:octopus/octopus.dart';

/// Хелпер чтобы проще было
extension RootTabsHelper on Octopus {
  Future<void> openInTab(
    RootTabs tab,
    Routes route, {
    bool setActiveTab = true,
  }) {
    // Можно попроще
    // setState((state) {
    //   return state
    //     ..findByName(tab.routeName)?.add(route.node())
    //     ..arguments['root'] = tab.name;
    // });

    return setState(
      (state) {
        /// Находим ноду с табом
        final tabNode = state.findByName(tab.routeName);

        /// Добавляем страницу в ноду
        tabNode?.add(route.node());

        if (setActiveTab) {
          /// Делаем вкладку активной
          state.arguments[RootTabs.argument] = tab.name;
        }

        /// Возвращаем новое состояние
        return state;
      },
    );
  }
}
