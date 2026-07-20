class CaseQuestion {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final int xpReward;

  const CaseQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.xpReward,
  });

  CaseQuestion copyWith({
    String? id,
    String? questionText,
    List<String>? options,
    int? correctAnswerIndex,
    int? xpReward,
  }) {
    return CaseQuestion(
      id: id ?? this.id,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      xpReward: xpReward ?? this.xpReward,
    );
  }

  @override
  String toString() {
    return 'CaseQuestion(id: $id, questionText: $questionText, options: $options, correctAnswerIndex: $correctAnswerIndex, xpReward: $xpReward)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CaseQuestion &&
        other.id == id &&
        other.questionText == questionText &&
        other.correctAnswerIndex == correctAnswerIndex &&
        other.xpReward == xpReward;
  }

  @override
  int get hashCode {
    return Object.hash(id, questionText, correctAnswerIndex, xpReward);
  }
}
