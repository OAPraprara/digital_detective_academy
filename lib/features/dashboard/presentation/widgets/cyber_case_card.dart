import 'package:flutter/material.dart';
import '../../../cases/domain/cyber_case.dart';

class CyberCaseCard extends StatelessWidget {
  final CyberCase cyberCase;
  final VoidCallback? onTap;

  const CyberCaseCard({
    super.key,
    required this.cyberCase,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isUnlocked = !cyberCase.isLocked;

    Widget cardContent = Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: 0.08),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          // Active state left border accent (Cyan)
          if (isUnlocked)
            Container(
              width: 4,
              height: 50,
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          if (isUnlocked) const SizedBox(width: 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        cyberCase.title,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isUnlocked ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    if (!isUnlocked)
                      Icon(
                        Icons.lock,
                        color: colorScheme.onSurface.withValues(alpha: 0.4),
                        size: 20,
                      )
                    else if (cyberCase.progressPercent > 0)
                      Text(
                        '${cyberCase.progressPercent}%',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  cyberCase.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                if (isUnlocked && cyberCase.progressPercent > 0) ...[
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: cyberCase.progressPercent / 100,
                    backgroundColor: colorScheme.onSurface.withValues(alpha: 0.05),
                    color: colorScheme.secondary,
                    minHeight: 4,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );

    if (!isUnlocked) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Opacity(
          opacity: 0.5,
          child: cardContent,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: cardContent,
      ),
    );
  }
}
