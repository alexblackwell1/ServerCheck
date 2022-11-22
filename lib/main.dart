// ignore_for_file: body_might_complete_normally_nullable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:server_check_ui/HomePage.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // add router for possible different pages
    return MaterialApp.router(
      title: 'Server Check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(
        redirect: (context, state) {},
        routes: <GoRoute>[
          // main page
          GoRoute(
            name: 'home',
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
        ],
        // certain page isn't found
        errorPageBuilder: (context, state) => MaterialPage(
          key: UniqueKey(),
          child: Scaffold(
            body: Center(child: Text(state.error.toString())),
          ),
        ),
      ),
    );
  }
}
