import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/presentation/auth_provider.dart';
import '../../cases/domain/mock_cases_provider.dart';
import '../../user_progression/presentation/user_progression_provider.dart';
import 'widgets/cyber_case_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final progression = ref.watch(userProgressionNotifierProvider);
    final casesList = ref.watch(mockCasesProvider);

    // XP calculation: 100 XP per level. Current progress within level is progression.xp % 100.
    final int currentXpInLevel = progression.xp % 100;
    const int xpNeededForNextLevel = 100;
    final double xpProgressRatio = currentXpInLevel / xpNeededForNextLevel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'D.D.A. TERMINAL',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Disconnect Session',
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Dashboard Header (Global State)
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: colorScheme.onSurface.withValues(alpha: 0.08),
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AGENT ALIAS',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.5),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Agent Protocol',
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          'LEVEL ${progression.currentLevel}',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COGNITIVE LEVEL SYNCHRONISATION',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      Text(
                        '$currentXpInLevel / $xpNeededForNextLevel XP',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: xpProgressRatio,
                    backgroundColor: colorScheme.onSurface.withValues(alpha: 0.05),
                    color: colorScheme.primary, // Orange
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 28),

            // 3. Case List Header
            Text(
              'ACTIVE DOSSIERS / CYBER THREATS',
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.secondary,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // ListView of Cases
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: casesList.length,
              itemBuilder: (context, index) {
                final cyberCase = casesList[index];
                return CyberCaseCard(
                  cyberCase: cyberCase,
                  onTap: () {
                    context.push('/case/${cyberCase.id}');
                  },
                );
              },
            ),
            
            const SizedBox(height: 24),

            // Interactive simulation section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: colorScheme.onSurface.withValues(alpha: 0.05),
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SIMULATION LAB CONTROLS',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.read(userProgressionNotifierProvider.notifier).addXp(25);
                        },
                        icon: const Icon(Icons.bolt, size: 16),
                        label: const Text('Inject 25 XP'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
