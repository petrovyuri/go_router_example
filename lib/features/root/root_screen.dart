import 'package:flutter/material.dart';
import 'package:go_router_example/features/auth/screens/auth_screen.dart';
import 'package:go_router_example/features/main/screens/main_screen.dart';
import 'package:go_router_example/features/profile/screens/profile_screen.dart';
import 'package:octopus/octopus.dart';

///
enum RootTabs implements Comparable<RootTabs> {
  /// Home таб
  home('home'),

  /// Profile таб
  profile('profile'),

  /// Auth таб
  auth('auth');

  const RootTabs(this.name);

  static const argument = 'root';

  /// Получение таба из строки
  /// Используется для парсинга таба из аргумента root
  static RootTabs fromValue(
    String? value, {
    RootTabs? fallback,
  }) =>
      switch (value?.trim().toLowerCase()) {
        'home' => home,
        'profile' => profile,
        'auth' => auth,
        _ => fallback ?? (throw ArgumentError.value(value)),
      };

  final String name;

  String get routeName => '$name-tab';

  @override
  int compareTo(RootTabs other) => index.compareTo(other.index);

  @override
  String toString() => name;
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  // Текущий таб
  RootTabs _tab = RootTabs.home;

  // Octopus обервер
  late final OctopusStateObserver _octopusStateObserver;

  @override
  void initState() {
    super.initState();
    _octopusStateObserver = context.octopus.observer;

    // Восстанавливаем активный таб из аргуменов (query params)
    // Если открыт root скрин и нет аргумента, то по умолчанию ставится домашний таб
    _tab = RootTabs.fromValue(
      _octopusStateObserver.value.arguments[RootTabs.argument],
      fallback: RootTabs.home,
    );
    _octopusStateObserver.addListener(_onOctopusStateChanged);
  }

  @override
  void dispose() {
    _octopusStateObserver.removeListener(_onOctopusStateChanged);
    super.dispose();
  }

  // Метод смены таба при изменении в обсервере
  void _onOctopusStateChanged() {
    final newTab = RootTabs.fromValue(
      _octopusStateObserver.value.arguments[RootTabs.argument],
      fallback: RootTabs.home,
    );
    _switchTab(newTab);
  }

  // Метод смены таба
  void _switchTab(RootTabs tab) {
    if (!mounted) return;
    if (_tab == tab) return;
    context.octopus.setArguments((args) => args[RootTabs.argument] = tab.name);
    setState(() => _tab = tab);
  }

  /// Доп. возможность очистки всех страниц в табе
  /// Можно сделать вызов
  void _clearHomeNavigationStack() {
    context.octopus.setState((state) {
      final home = state.findByName(RootTabs.home.routeName);
      if (home == null || home.children.length < 2) return state;
      home.children.length = 1;
      if (mounted) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          const SnackBar(
            content: Text('Poped to hine tab at double tap'),
            backgroundColor: Colors.green,
          ),
        );
      }
      return state;
    });
  }

  /// Дейтсвие при нажатии на таб
  void _onItemTapped(int index) {
    final newTab = RootTabs.values[index];
    if (_tab == newTab) {
      /// Если нажали на текущий таб, то выполняем доп действие
      if (newTab == RootTabs.home) _clearHomeNavigationStack();
    } else {
      // Меняем на новый таб
      _switchTab(newTab);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoAnimationScope(
        child: IndexedStack(
          index: _tab.index,
          children: const <Widget>[
            HomeTab(),
            ProfileTab(),
            AuthTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Auth'),
        ],
        currentIndex: _tab.index,
        onTap: _onItemTapped,
      ),
    );
  }
}
