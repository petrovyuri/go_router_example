import 'package:flutter/material.dart';
import 'package:go_router_example/router/root_tabs_helper.dart';
import 'package:go_router_example/router/routes.dart';
import 'package:octopus/octopus.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DetailScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () => context.octopus.openInTab(
                  Routes.secondDetail,
                ),
            child: const Text('go SecondDetailScreen')),
      ),
    );
  }
}
