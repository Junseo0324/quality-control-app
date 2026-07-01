import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../presentation/dough/dough_root.dart';
import '../../presentation/camera/camera_root.dart';
import '../../presentation/mrd/mrd_root.dart';
import '../../presentation/main/main_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDoughKey = GlobalKey<NavigatorState>(debugLabel: 'shellDough');
final _shellNavigatorCameraKey = GlobalKey<NavigatorState>(debugLabel: 'shellCamera');
final _shellNavigatorMrdKey = GlobalKey<NavigatorState>(debugLabel: 'shellMrd');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dough',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDoughKey,
          routes: [
            GoRoute(
              path: '/dough',
              name: 'dough',
              builder: (context, state) => const DoughRoot(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCameraKey,
          routes: [
            GoRoute(
              path: '/camera',
              name: 'camera',
              builder: (context, state) => const CameraRoot(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMrdKey,
          routes: [
            GoRoute(
              path: '/mrd',
              name: 'mrd',
              builder: (context, state) => const MrdRoot(),
            ),
          ],
        ),
      ],
    ),
  ],
);
