import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/user_progression.dart';

part 'user_progression_provider.g.dart';

@riverpod
class UserProgressionNotifier extends _$UserProgressionNotifier {
  @override
  UserProgression build() {
    // Initial state: 0 XP, and first level unlocked
    return const UserProgression(
      xp: 0,
      unlockedLevelIds: ['level_1'],
    );
  }

  void addXp(int amount) {
    state = state.copyWith(xp: state.xp + amount);
  }

  void unlockLevel(String levelId) {
    if (!state.unlockedLevelIds.contains(levelId)) {
      state = state.copyWith(
        unlockedLevelIds: [...state.unlockedLevelIds, levelId],
      );
    }
  }
}
