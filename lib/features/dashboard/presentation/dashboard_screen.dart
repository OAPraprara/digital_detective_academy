import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/presentation/auth_provider.dart';
import '../../user_progression/presentation/user_progression_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progression = ref.watch(userProgressionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detective Profile',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text('Current Level: ${progression.currentLevel}'),
                    Text('Experience Points (XP): ${progression.xp}'),
                    Text('Unlocked Levels: ${progression.unlockedLevelIds.join(', ')}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Actions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(userProgressionNotifierProvider.notifier).addXp(25);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Earn 25 XP'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(userProgressionNotifierProvider.notifier).unlockLevel('level_${progression.unlockedLevelIds.length + 1}');
                  },
                  icon: const Icon(Icons.lock_open),
                  label: const Text('Unlock Next Level'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    context.push('/case/case_101');
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('Investigate Case #101'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
