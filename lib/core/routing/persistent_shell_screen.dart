import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersistentShellScreen extends StatelessWidget {
  final Widget child;

  const PersistentShellScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the selected bottom bar index from the current path
    final GoRouterState state = GoRouterState.of(context);
    final String path = state.uri.path;
    
    int currentIndex = 0;
    if (path.startsWith('/settings')) {
      currentIndex = 1;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            context.go('/dashboard');
          } else {
            context.go('/settings');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
