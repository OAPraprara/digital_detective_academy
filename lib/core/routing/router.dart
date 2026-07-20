import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/auth_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/dashboard/presentation/settings_placeholder_screen.dart';
import '../../features/cases/presentation/case_investigation_screen.dart';
import 'persistent_shell_screen.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
GoRouter router(RouterRef ref) {
  // Watch the mock authentication state.
  // Re-evaluation of this provider when auth state changes will recreate GoRouter and trigger a redirect.
  final isAuthenticated = ref.watch(authNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) {
      final path = state.uri.path;
      final isLoggingIn = path == '/auth';
      final isSplash = path == '/';

      if (!isAuthenticated) {
        // If not authenticated and not on splash/auth, redirect to auth
        if (!isLoggingIn && !isSplash) {
          return '/auth';
        }
      } else {
        // If authenticated and on splash or auth, redirect to dashboard
        if (isLoggingIn || isSplash) {
          return '/dashboard';
        }
      }

      // No redirect needed, proceed to target
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return PersistentShellScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsPlaceholderScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/case/:id',
        parentNavigatorKey: _rootNavigatorKey, // Force route to overlay full screen above the bottom nav shell
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? 'unknown';
          return CaseInvestigationScreen(caseId: id);
        },
      ),
    ],
  );
}
