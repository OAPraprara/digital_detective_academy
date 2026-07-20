class UserProgression {
  final int xp;
  final List<String> unlockedLevelIds;

  const UserProgression({
    required this.xp,
    required this.unlockedLevelIds,
  });

  UserProgression copyWith({
    int? xp,
    List<String>? unlockedLevelIds,
  }) {
    return UserProgression(
      xp: xp ?? this.xp,
      unlockedLevelIds: unlockedLevelIds ?? this.unlockedLevelIds,
    );
  }

  int get currentLevel {
    // Simple level calculation: 100 XP per level
    return (xp / 100).floor() + 1;
  }

  @override
  String toString() {
    return 'UserProgression(xp: $xp, unlockedLevelIds: $unlockedLevelIds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProgression &&
        other.xp == xp &&
        other.unlockedLevelIds == unlockedLevelIds;
  }

  @override
  int get hashCode => Object.hash(xp, unlockedLevelIds);
}
