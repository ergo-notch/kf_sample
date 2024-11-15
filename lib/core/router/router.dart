import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kf_sample/home/presentation/home_screen.dart';

final _routes = [
  GoRoute(
    name: HomeScreen.name,
    path: HomeScreen.path,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const HomeScreen(),
    ),
  )
];

final router = GoRouter(
  initialLocation: HomeScreen.path,
  routes: _routes,
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Container(),
  ),
);
